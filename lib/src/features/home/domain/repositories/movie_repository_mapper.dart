import 'package:vinhcine/src/core/network/response/array_response.dart';
import 'package:vinhcine/src/features/home/data/remote/dtos/movie_dto.dart';
import 'package:vinhcine/src/features/home/domain/models/movie.dart';
import 'package:vinhcine/src/features/home/domain/models/movie_mapper.dart';

class MovieMapper {
  static List<MovieModel> mapToModel(ArrayResponse<MovieDto> response) {
    return response.data.map((e) => e.toModel()).toList();
  }
}
