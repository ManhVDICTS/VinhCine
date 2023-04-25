import 'package:dio/dio.dart';
import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/features/detail/domain/models/genre.dart';
import '../../data/remote/services/genre_service.dart';
import 'movie_repository_mapper.dart';
import 'package:dartz/dartz.dart';
import 'dart:io' show HttpStatus;

abstract class MovieGenreRepository {
  Future<Either<Failure, List<GenreModel>>> getMovieGenres();
}

class MovieGenreRepositoryImpl implements MovieGenreRepository {
  final GenreService _remoteDataService;

  @override
  MovieGenreRepositoryImpl(this._remoteDataService);

  @override
  Future<Either<Failure, List<GenreModel>>> getMovieGenres() async {
    try {
      final data = await _remoteDataService.getMovieGenres().then((value) {
        if (value.response.statusCode == HttpStatus.ok) {
          return MovieGenreMapper.mapToModel(value.data);
        } else {
          throw DioError(
            response: value.response,
            requestOptions: value.response.requestOptions,
          );
        }
      });
      return right(data);
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }
}
