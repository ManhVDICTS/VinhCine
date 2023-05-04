import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'payload_dto.dart';
part 'get_token_response.g.dart';

@JsonSerializable()
class GetTokenResponse extends Equatable {
  @JsonKey()
  final int code;
  @JsonKey()
  final String token;
  @JsonKey()
  final PayloadDTO data;
  @JsonKey()
  final double expiresIn;

  const GetTokenResponse({required this.code, required this.token, required this.data, required this.expiresIn});

  factory GetTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetTokenResponseToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code, token, data, expiresIn];

  GetTokenResponse copyWith({
    int? code,
    String? token,
    PayloadDTO? data,
    double? expiresIn,
  }) {
    return GetTokenResponse(
      code: code ?? this.code,
      token: token ?? this.token,
      data: data ?? this.data,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }
}
