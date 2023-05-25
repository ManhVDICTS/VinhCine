import 'package:vinhcine/src/core/network/response/array_response.dart';
import 'package:vinhcine/src/core/network/response/object_response.dart';
import 'package:vinhcine/src/features/movie/data/remote/dtos/movie_dto.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie.dart';
import 'package:vinhcine/src/features/movie/domain/models/movie_mapper.dart';

class MovieMapper {
  static List<MovieModel> mapToListModel(ArrayResponse<MovieDto> response) {
    return response.data.map((e) => e.toModel()).toList();
  }

  static MovieModel mapToModel(ObjectResponse<MovieDto> response) {
    return response.data!.toModel();
  }
}
