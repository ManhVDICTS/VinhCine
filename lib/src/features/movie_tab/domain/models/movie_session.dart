import 'package:vinhcine/src/features/movie_tab/domain/models/session.dart';

class MovieSessionModel {
  final String? cinemaId;
  final List<SessionModel>? sessions;

  MovieSessionModel({required this.cinemaId, required this.sessions});
}
