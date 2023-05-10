import 'package:vinhcine/src/core/network/response/array_response.dart';
import 'package:vinhcine/src/features/banner/data/remote/dtos/banner_dto.dart';
import 'package:vinhcine/src/features/banner/domain/models/banner.dart';
import 'package:vinhcine/src/features/banner/domain/models/banner_mapper.dart';

class BannerRepositoryMapper {
  static List<BannerModel> mapToModel(ArrayResponse<BannerDto> response) {
    return response.data.map((e) => e.toModel()).toList();
  }
}
