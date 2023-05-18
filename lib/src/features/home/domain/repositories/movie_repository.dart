import 'dart:developer';

import 'package:vinhcine/src/core/failures/failure.dart';
import 'package:vinhcine/src/features/home/data/remote/services/toppage_service.dart';
import 'package:vinhcine/src/features/home/domain/models/movie.dart';
import '../models/movie_tab.dart';
import 'movie_repository_mapper.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieModel>>> getTopPage(MovieTab movieTab);
}

class MovieRepositoryImpl extends MovieRepository {
  final TopPageService _topPageRemoteService;

  MovieRepositoryImpl(this._topPageRemoteService);

  @override
  Future<Either<Failure, List<MovieModel>>> getTopPage(
      MovieTab movieTab) async {
    try {
      final result = (movieTab == MovieTab.special)
          ? await _topPageRemoteService.getTopPage(movieTab.queryValue)
          : await _topPageRemoteService.getTopPagePeriod(movieTab.queryValue);
      if (result.code == 0) {
        log('getTopPage data length ${result.data.length}');
        return Right(MovieMapper.mapToModel(result));
      } else {
        return Left(DetailFailure(message: result.message));
      }
    } catch (e) {
      return Left(DetailFailure(message: e.toString()));
    }
  }
}
