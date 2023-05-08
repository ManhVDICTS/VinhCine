import 'package:vinhcine/src/features/authentication/data/remote/dtos/profile_dto.dart';
import 'package:vinhcine/src/features/profile/domain/model/my_profile.dart';

extension ProfileDTOExtension on ProfileDTO {
  MyProfile toModel() => MyProfile(
      fullName: fullName ?? '',
      point: point ?? 0,
      barCode: barCode ?? '',
      avatar: '',
      seenFilmNumber: 0,
      totalPay: 0);
}