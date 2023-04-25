import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_dto.g.dart';

@JsonSerializable()
class GenreDTO extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: '__v')
  final int? v;

  const GenreDTO({
    this.id,
    this.updatedAt,
    this.createdAt,
    this.code,
    this.name,
    this.v,
  });

  factory GenreDTO.fromJson(Map<String, dynamic> json) {
    return _$GenreDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenreDTOToJson(this);

  GenreDTO copyWith({
    String? id,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? code,
    String? name,
    int? v,
  }) {
    return GenreDTO(
      id: id ?? this.id,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      code: code ?? this.code,
      name: name ?? this.name,
      v: v ?? this.v,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, updatedAt, createdAt, code, name, v];
}
