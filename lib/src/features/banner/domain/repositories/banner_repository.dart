import 'package:dartz/dartz.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/features/banner/data/remote/services/banner_service.dart';
import 'package:vinhcine/src/features/banner/domain/models/banner.dart';
import 'package:vinhcine/src/features/banner/domain/repositories/banner_repository_mapper.dart';

abstract class BannerRepository {
  Future<Either<Failure, List<BannerModel>>> getBanner();
}

class BannerRepositoryImpl extends BannerRepository {
  final BannerService _remoteDataService;

  BannerRepositoryImpl(this._remoteDataService);

  @override
  Future<Either<Failure, List<BannerModel>>> getBanner() async {
    try {
      final result = await _remoteDataService.getBanner();
      if (result.code == 0) {
        return Right(BannerRepositoryMapper.mapToModel(result));
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

}
