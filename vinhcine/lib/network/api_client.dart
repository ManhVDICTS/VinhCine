import 'package:dio/dio.dart';
import 'package:vinhcine/configs/app_config.dart';
import 'package:vinhcine/models/entities/movie_entity.dart';
import 'package:vinhcine/models/responses/array_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///Setting
  @GET("/settings")
  Future<void> getSetting();

  ///Auth

  /// Movie
  @GET("/discover/movie")
  Future<ArrayResponse<MovieEntity>> getMovies(@Query('api_key') String apiKey, @Query('page') int page);
}
