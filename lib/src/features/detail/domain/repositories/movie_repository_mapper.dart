import 'package:vinhcine/src/features/detail/domain/models/genre_mapper.dart';
import '../../data/remote/dtos/movie_genre_response.dart';
import '../models/genre.dart';

class MovieGenreMapper {
  static List<GenreModel> mapToModel(MovieGenreResponse response) {
    return response.data.map((e) => e.toModel()).toList();
  }
}
