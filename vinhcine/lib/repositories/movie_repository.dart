import 'package:flutter/cupertino.dart';
import 'package:vinhcine/configs/app_config.dart';
import 'package:vinhcine/models/entities/movie_entity.dart';
import 'package:vinhcine/models/responses/array_response.dart';
import 'package:vinhcine/network/api_client.dart';

abstract class MovieRepository {
  Future<ArrayResponse<MovieEntity>>? getMovies({ int page});

  Future<MovieEntity> getMovie(int id);
}

class MovieRepositoryImpl extends MovieRepository {
  ApiClient? _apiClient;

  MovieRepositoryImpl(ApiClient? client) {
    _apiClient = client;
  }

  @override
  Future<MovieEntity> getMovie(int id) {
    // TODO: implement getMovie
    throw UnimplementedError();
  }

  @override
  Future<ArrayResponse<MovieEntity>>? getMovies({int? page}) async {
    try {
      return _apiClient!.getMovies(MovieAPIConfig.APIKey, page ?? 1);
    } catch (e) {
      throw e;
    }
  }
}
