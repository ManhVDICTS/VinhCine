import 'package:vinhcine/src/features/detail/data/remote/dtos/genre_dto.dart';
import 'genre.dart';

extension GenreData on GenreDTO {
  GenreModel toModel() => GenreModel(
      id: id,
      updatedAt: updatedAt,
      createdAt: createdAt,
      code: code,
      name: name);
}
