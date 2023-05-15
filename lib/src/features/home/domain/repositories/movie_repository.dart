import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/features/home/data/remote/services/toppage_service.dart';
import 'package:vinhcine/src/features/home/domain/models/movie.dart';
import 'movie_repository_mapper.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getTopPage(String date);
}

class MovieRepositoryImpl extends MovieRepository {
  final TopPageService _topPageRemoteService;

  MovieRepositoryImpl(this._topPageRemoteService);

  @override
  Future<Either<Failure, List<MovieModel>>> getTopPage(String date) async {
    try {
      final result = await _topPageRemoteService.getTopPage(date);
      if (result.code == 0) {
        return Right(MovieMapper.mapToModel(result));
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }
}