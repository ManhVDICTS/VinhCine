import 'package:vinhcine/src/features/movie/domain/models/session.dart';

class MovieSessionModel {
  final String? cinemaId;
  final List<SessionModel>? sessions;

  MovieSessionModel({required this.cinemaId, required this.sessions});
}
