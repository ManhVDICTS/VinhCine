import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
// {
//             "adult": false,
//             "backdrop_path": "/ovM06PdF3M8wvKb06i4sjW3xoww.jpg",
//             "genre_ids": [
//                 878,
//                 12,
//                 28
//             ],
//             "id": 76600,
//             "original_language": "en",
//             "original_title": "Avatar: The Way of Water",
//             "overview": "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
//             "popularity": 7918.132,
//             "poster_path": "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
//             "release_date": "2022-12-14",
//             "title": "Avatar: The Way of Water",
//             "video": false,
//             "vote_average": 7.7,
//             "vote_count": 6657
//         }
class MovieEntity {
  @JsonKey()
  int? id;
  @JsonKey()
  String? title;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey()
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;

  MovieEntity(
      {this.id,
      this.title,
      this.posterPath,
      this.backdropPath,
      this.voteAverage,
      this.overview,
      this.releaseDate});

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);

  @JsonKey(ignore: true)
  String get posterUrl {
    return 'https://image.tmdb.org/t/p/w185${posterPath ?? ""}';
  }
}
