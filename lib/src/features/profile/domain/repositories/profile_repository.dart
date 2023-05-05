import 'package:dio/dio.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';
import 'package:vinhcine/src/features/authentication/domain/repositories/auth_repository_mapper.dart';
import 'dart:io' show HttpStatus;

import '../../data/remote/services/profile_service.dart';
import '../../data/remote/services/profile_service_no_token.dart';

abstract class ProfileRepository {

  /// cancel token
  void cancelRequest();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileServiceNoToken _profileServiceNoToken;
  final ProfileService _profileService;
  CancelToken? _signInCancelToken;
  CancelToken? _registerCancelToken;
  CancelToken? _logoutCancelToken;
  CancelToken? _forgotPasswordCancelToken;

  @override
  ProfileRepositoryImpl(this._profileServiceNoToken, this._profileService);

  @override
  void cancelRequest() {
    _signInCancelToken?.cancel();
    _registerCancelToken?.cancel();
    _logoutCancelToken?.cancel();
    _forgotPasswordCancelToken?.cancel();
  }
}
