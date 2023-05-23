import 'package:vinhcine/src/features/movie_tab/data/remote/dtos/type_dto.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/type.dart';

extension TypeData on TypeDto {
  TypeModel toModel() => TypeModel(id: id, code: code, name: name, v: v);
}
