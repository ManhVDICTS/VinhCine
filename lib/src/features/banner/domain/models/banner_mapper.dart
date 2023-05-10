import 'package:vinhcine/src/features/banner/data/remote/dtos/banner_dto.dart';
import 'package:vinhcine/src/features/banner/domain/models/banner.dart';

extension BannerData on BannerDto {
  BannerModel toModel() => BannerModel(id: id, url: url, disabled: disabled);
}
