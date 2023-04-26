import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vinhcine/src/features/signin/domain/data/remote/dtos/payload_dto.dart';

part 'signin_response.g.dart';

@JsonSerializable()
class SignInResponse extends Equatable {
  @JsonKey()
  final int code;
  @JsonKey()
  final String token;
  @JsonKey()
  final PayloadDTO data;
  @JsonKey()
  final double expiresIn;

  const SignInResponse({required this.code, required this.token, required this.data, required this.expiresIn});

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, token, data, expiresIn];

  SignInResponse copyWith({
    int? code,
    String? token,
    PayloadDTO? data,
    double? expiresIn,
  }) {
    return SignInResponse(
      code: code ?? this.code,
      token: token ?? this.token,
      data: data ?? this.data,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }
}
