import 'package:vinhcine/src/features/authentication/domain/model/auth_mapper.dart';
import '../../data/remote/dtos/get_token_response.dart';
import '../../data/remote/dtos/register_response.dart';
import '../model/register.dart';

class RegisterMapper {
  static RegisterModel mapToModel(RegisterResponse response) {
    return response.toModel();
  }
}

class SignInMapper {
  static String mapToModel(GetTokenResponse response) {
    return response.token;
  }
}