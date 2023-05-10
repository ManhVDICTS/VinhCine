import 'package:dio/dio.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';
import 'package:vinhcine/src/features/authentication/domain/repositories/auth_repository_mapper.dart';
import 'dart:io' show HttpStatus;

import '../../data/remote/services/auth_service.dart';
import '../../data/remote/services/auth_service_no_token.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signIn({
    required String userName,
    required String password,
  });

  Future<Either<Failure, bool>> signOut();

  Future<Either<Failure, RegisterModel?>> register({
    required String userName,
    required String password,
    required String fullName,
    required String phone,
  });

  Future<Either<Failure, bool>> forgotPassword({
    required String userName,
  });

  /// cancel token
  void cancelRequest();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthServiceNoToken _authServiceNoToken;
  final AuthService _authService;
  CancelToken? _signInCancelToken;
  CancelToken? _registerCancelToken;
  CancelToken? _logoutCancelToken;
  CancelToken? _forgotPasswordCancelToken;

  @override
  AuthRepositoryImpl(this._authServiceNoToken, this._authService);

  @override
  Future<Either<Failure, String>> signIn(
      {required String userName, required String password}) async {
    _signInCancelToken = CancelToken();
    try {
      final result = await _authServiceNoToken.signIn(
          {"username": userName, "password": password}, _signInCancelToken!);
      if (result.code == 0) {
        return Right(SignInMapper.mapToModel(result));
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    _logoutCancelToken = CancelToken();
    try {
      var result = await _authService.signOut(_logoutCancelToken!);
      if (result.code == 0) {
        return const Right(true);
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterModel?>> register({
    required String userName,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    _registerCancelToken = CancelToken();
    try {
      final result = await _authServiceNoToken.register({
        "username": userName,
        "password": password,
        "fullname": fullName,
        "phone": phone
      }, _registerCancelToken!);
      if (result.code == 0) {
        return Right(RegisterMapper.mapToModel(result));
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword({
    required String userName,
  }) async {
    _forgotPasswordCancelToken = CancelToken();
    try {
      final result = await _authServiceNoToken
          .forgotPassword({"username": userName}, _forgotPasswordCancelToken!);
      if (result.code == 0) {
        return const Right(true);
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      if (e is DioError) {
        return Left(DetailFailure(message: e.response?.statusMessage ?? ''));
      }
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  void cancelRequest() {
    _signInCancelToken?.cancel();
    _registerCancelToken?.cancel();
    _logoutCancelToken?.cancel();
    _forgotPasswordCancelToken?.cancel();
  }
}
