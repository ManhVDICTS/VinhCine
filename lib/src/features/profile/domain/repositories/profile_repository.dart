import 'package:dio/dio.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';
import 'package:vinhcine/src/features/authentication/domain/repositories/auth_repository_mapper.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'dart:io' show HttpStatus;

import '../../data/remote/services/profile_service.dart';
import '../../data/remote/services/profile_service_no_token.dart';
import 'profile_repository_mapper.dart';

abstract class ProfileRepository {
  Future<Either<Failure, MyProfile>> getMyProfile();
  /// cancel token
  void cancelRequest();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileServiceNoToken _profileServiceNoToken;
  final ProfileService _profileService;
  CancelToken? _getMyProfileCancelToken;

  @override
  ProfileRepositoryImpl(this._profileServiceNoToken, this._profileService);

  @override
  Future<Either<Failure, MyProfile>> getMyProfile() async {
    _getMyProfileCancelToken = CancelToken();
    try {
      var result = await _profileService.getMyProfile();
      if (result.code == 0) {
        return Right(ProfileMapper.mapToModel(result));
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  void cancelRequest() {
    _getMyProfileCancelToken?.cancel();
  }
}
