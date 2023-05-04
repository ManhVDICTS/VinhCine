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

  Future<Either<Failure, RegisterModel>> register({
    required String userName,
    required String password,
    required String fullName,
    required String phone,
  });
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthServiceNoToken _authServiceNoToken;
  final AuthService _authService;

  @override
  AuthRepositoryImpl(this._authServiceNoToken, this._authService);

  @override
  Future<Either<Failure, String>> signIn({
    required String userName, required String password}) async {
    try {
      final result = await _authServiceNoToken.signIn({
        "username": userName,
        "password": password
      });
      return Right(SignInMapper.mapToModel(result));
      // if (result.response.statusCode == HttpStatus.ok) {
      //   return Right(SignInMapper.mapToModel(result.data));
      // } else {
      //   throw DioError(
      //     response: result.response,
      //     requestOptions: result.response.requestOptions,
      //   );
      // }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      await _authService.signOut();
      return const Right(true);
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register({
    required String userName,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    try {
      final result = await _authServiceNoToken.register({
        "username": userName,
        "password": password,
        "fullname": fullName,
        "phone": phone
      });
      return Right(RegisterMapper.mapToModel(result));
      // if (result != null) {
      //   return Right(RegisterMapper.mapToModel(result));
      // } else {
      //   throw DioError(
      //     response: result,
      //     requestOptions: result.requestOptions,
      //   );
      // }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }
}
