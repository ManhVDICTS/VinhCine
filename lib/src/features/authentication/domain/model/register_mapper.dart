import 'package:vinhcine/src/features/authentication/domain/data/remote/dtos/register_response.dart';
import 'package:vinhcine/src/features/authentication/domain/model/register.dart';

extension RegisterData on RegisterResponse {
  RegisterModel toModel() => RegisterModel(userName: data.userName, password: data.password);
}