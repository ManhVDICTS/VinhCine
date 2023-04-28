import 'package:dio/dio.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/features/detail/domain/models/genre.dart';
import 'package:dartz/dartz.dart';
import 'package:vinhcine/src/features/signin/domain/data/remote/dtos/signin_response.dart';
import 'package:vinhcine/src/features/signin/domain/data/services/signout_service.dart';
import 'dart:io' show HttpStatus;

import '../data/services/signin_service.dart';
import 'signin_repository_mapper.dart';

abstract class SignInRepository {
  Future<Either<Failure, String>> signIn({
    required String userName, required String password});

  Future<Either<Failure, bool>> signOut();
}

class SignInRepositoryImpl implements SignInRepository {
  final SignInService _signInService;
  final SignOutService _signOutService;

  @override
  SignInRepositoryImpl(this._signInService, this._signOutService);

  @override
  Future<Either<Failure, String>> signIn({
    required String userName, required String password}) async {
    try {
      final result = await _signInService.signIn({
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
      final result = await _signOutService.signOut();
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
}
