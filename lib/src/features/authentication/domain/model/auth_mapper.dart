import 'package:vinhcine/src/core/network/response/object_response.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';

extension RegisterData on ObjectResponse {
  RegisterModel toModel() => RegisterModel(userName: data.userName, password: data.password);
}

extension SignInData on ObjectResponse {
  String toModel() => token;
}