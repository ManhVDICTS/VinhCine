import 'package:vinhcine/src/core/network/response/object_response.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/profile_dto.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile_mapper.dart';

class ProfileMapper {
  static MyProfile mapToModel(ObjectResponse response) {
    return (response.data as ProfileDTO).toModel();
  }
}
