import 'package:dio/dio.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'dart:io' show HttpStatus;

import '../../data/remote/services/profile_service.dart';
import '../../data/remote/services/profile_service_no_token.dart';
import 'profile_repository_mapper.dart';

abstract class ProfileRepository {
  Future<Either<Failure, MyProfile>> getMyProfile();

  Future<Either<Failure, bool>> changePassword({
    required String password,
    required String newPassword
  });

  /// cancel token
  void cancelRequest();
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileServiceNoToken _profileServiceNoToken;
  final ProfileService _profileService;
  CancelToken? _getMyProfileCancelToken;
  CancelToken? _changePassCancelToken;

  @override
  ProfileRepositoryImpl(this._profileServiceNoToken, this._profileService);

  @override
  Future<Either<Failure, MyProfile>> getMyProfile() async {
    _getMyProfileCancelToken = CancelToken();
    try {
      var result = await _profileService.getMyProfile(_getMyProfileCancelToken!);
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
  Future<Either<Failure, bool>> changePassword({
    required String password,
    required String newPassword
  }) async {
    _changePassCancelToken = CancelToken();
    try {
      var result = await _profileService.changePassword(
        {
          "password": password,
          "new_password": newPassword,
        },_changePassCancelToken!
      );
      if (result.code == 0) {
        return const Right(true);
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      if(e is DioError){
        String code = e.response?.data['errors'][0]['messages'][0];
        switch(code){
          case 'PASSWORD_MIN':
            return Left(DetailFailure(message: 'Mật khẩu cần tối thiểu 6 ký tự'));
          case 'INVALID_PASSWORD':
            return Left(DetailFailure(message: 'Mật khẩu cũ không chính xác'));
        }
      }
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  void cancelRequest() {
    _getMyProfileCancelToken?.cancel();
  }
}
