import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/movie_genre_response.dart';

part 'genre_service.g.dart';

@RestApi()
abstract class GenreService {
  factory GenreService(Dio dio) = _GenreService;

  @GET('/api/movie_genre')
  Future<HttpResponse<MovieGenreResponse>> getMovieGenres();
}
