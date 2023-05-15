import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vinhcine/src/core/network/response/array_response.dart';

import '../dtos/movie_dto.dart';

part 'toppage_service.g.dart';

@RestApi()
abstract class TopPageService {
  factory TopPageService(Dio dio) = _TopPageService;

  @GET('/api/movie') 
  Future<ArrayResponse<MovieDto>> getTopPage(@Query("date") String date); // dd/MM/yyyy
}
