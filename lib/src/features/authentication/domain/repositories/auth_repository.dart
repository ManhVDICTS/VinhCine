import 'package:dio/dio.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vinhcine/src/features/authentication/domain/data/services/auth_service.dart';
import 'package:vinhcine/src/features/authentication/domain/data/services/auth_service_no_token.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';
import 'package:vinhcine/src/features/authentication/domain/repositories/register_repository_mapper.dart';
import 'dart:io' show HttpStatus;

import 'signin_repository_mapper.dart';

abstract class SignInRepository {
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

class SignInRepositoryImpl implements SignInRepository {
  final AuthServiceNoToken _noTokenAuthService;
  final AuthService _hasTokenAuthService;

  @override
  SignInRepositoryImpl(this._noTokenAuthService, this._hasTokenAuthService);

  @override
  Future<Either<Failure, String>> signIn({
    required String userName, required String password}) async {
    try {
      final result = await _noTokenAuthService.signIn({
        "username": userName,
        "password": password
      });
      if (result.response.statusCode == HttpStatus.ok) {
        return Right(SignInMapper.mapToModel(result.data));
      } else {
        throw DioError(
          response: result.response,
          requestOptions: result.response.requestOptions,
        );
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut() async {
    try {
      final result = await _hasTokenAuthService.signOut();
      if (result.response.statusCode == HttpStatus.ok) {
        return const Right(true);
      } else {
        throw DioError(
          response: result.response,
          requestOptions: result.response.requestOptions,
        );
      }
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
      final result = await _noTokenAuthService.register({
        "username": userName,
        "password": password,
        "fullname": fullName,
        "phone": phone
      });
      if (result.response.statusCode == HttpStatus.ok) {
        return Right(RegisterMapper.mapToModel(result.data));
      } else {
        throw DioError(
          response: result.response,
          requestOptions: result.response.requestOptions,
        );
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }
}
