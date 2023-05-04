import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'register_dto.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends Equatable {
  @JsonKey()
  final int code;
  @JsonKey()
  final RegisterDTO data;

  const RegisterResponse({required this.code, required this.data});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, data];

  RegisterResponse copyWith({
    int? code,
    String? token,
    RegisterDTO? data,
    double? expiresIn,
  }) {
    return RegisterResponse(
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }
}