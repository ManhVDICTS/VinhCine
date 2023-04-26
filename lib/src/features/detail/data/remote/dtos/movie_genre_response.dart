import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'genre_dto.dart';

part 'movie_genre_response.g.dart';

@JsonSerializable()
class MovieGenreResponse extends Equatable {
  final int code;
  final List<GenreDTO> data;

  const MovieGenreResponse({required this.code, required this.data});

  factory MovieGenreResponse.fromJson(Map<String, dynamic> json) {
    return _$MovieGenreResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieGenreResponseToJson(this);

  MovieGenreResponse copyWith({
    int? code,
    List<GenreDTO>? data,
  }) {
    return MovieGenreResponse(
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, data];
}
