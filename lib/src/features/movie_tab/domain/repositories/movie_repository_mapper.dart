import 'package:vinhcine/src/core/network/response/array_response.dart';
import 'package:vinhcine/src/features/movie_tab/data/remote/dtos/movie_dto.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/movie.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/movie_mapper.dart';

class MovieMapper {
  static List<MovieModel> mapToModel(ArrayResponse<MovieDto> response) {
    return response.data.map((e) => e.toModel()).toList();
  }
}
