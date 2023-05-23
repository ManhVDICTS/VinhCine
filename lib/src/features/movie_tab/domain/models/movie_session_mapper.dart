import 'package:vinhcine/src/features/movie_tab/data/remote/dtos/movie_session_dto.dart';
import 'package:vinhcine/src/features/movie_tab/domain/models/session_mapper.dart';

import 'movie_session.dart';

extension MovieSessionData on MovieSessionDto {
  MovieSessionModel toModel() => MovieSessionModel(
      cinemaId: cinemaId,
      sessions:
          sessions?.asMap().entries.map((e) => e.value.toModel()).toList());
}
