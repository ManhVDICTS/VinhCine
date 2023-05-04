import 'package:vinhcine/src/features/authentication/data/remote/dtos/get_token_response.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/register_response.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';

extension RegisterData on RegisterResponse {
  RegisterModel toModel() => RegisterModel(userName: data.userName, password: data.password);
}

extension SignInData on GetTokenResponse {
  String toModel() => token;
}