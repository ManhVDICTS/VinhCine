import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie.dart';
import '../../data/remote/services/movie_service.dart';
import '../models/movie_tab.dart';
import 'movie_repository_mapper.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getTopPage(MovieTabType movieTab);
  Future<Either<Failure, MovieModel>> getMovieById(String movieId);
}

class MovieRepositoryImpl extends MovieRepository {
  final MovieService _movieService;

  MovieRepositoryImpl(this._movieService);

  @override
  Future<Either<Failure, List<MovieModel>>> getTopPage(
      MovieTabType movieTab) async {
    try {
      final result = (movieTab == MovieTabType.special)
          ? await _movieService.getTopPage(movieTab.queryValue)
          : await _movieService.getTopPagePeriod(movieTab.queryValue);
      if (result.code == 0) {
        return Right(MovieMapper.mapToListModel(result));
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieModel>> getMovieById(String movieId) async {
    try {
      final result = await _movieService.getMovieById(movieId);
      if (result.code == 0) {
        return right(MovieMapper.mapToModel(result));
      } else {
        return left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }
}
