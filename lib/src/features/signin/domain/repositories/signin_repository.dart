import 'package:dio/dio.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/features/detail/domain/models/genre.dart';
import 'package:dartz/dartz.dart';
import 'package:vinhcine/src/features/signin/domain/data/remote/dtos/signin_response.dart';
import 'dart:io' show HttpStatus;

import '../data/services/signin_service.dart';
import 'signin_repository_mapper.dart';

abstract class SignInRepository {
  Future<Either<Failure, String>> signIn({
    required String userName, required String password});
}

class SignInRepositoryImpl implements SignInRepository {
  final SignInService _remoteDataService;

  @override
  SignInRepositoryImpl(this._remoteDataService);

  @override
  Future<Either<Failure, String>> signIn({
    required String userName, required String password}) async {
    try {
      final result = await _remoteDataService.signIn({
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
}
