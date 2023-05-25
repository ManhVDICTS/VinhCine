import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vinhcine/src/core/network/response/object_response.dart';

import '../../../../../core/network/response/array_response.dart';
import '../dtos/movie_dto.dart';

part 'movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio) = _MovieService;

  @GET('/api/movie') 
  Future<ObjectResponse<MovieDto>> getMovieById(@Path() String movieId);

  @GET('/api/movie') 
  Future<ArrayResponse<MovieDto>> getTopPage(@Query("date") String date); // dd/MM/yyyy

  @GET('/api/movie?session=true') 
  Future<ArrayResponse<MovieDto>> getTopPagePeriod(@Query("period") String period); 
}
