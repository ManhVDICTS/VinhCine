import 'package:vinhcine/src/core/network/response/object_response.dart';
import '../model/register.dart';

class RegisterMapper {
  static RegisterModel mapToModel(ObjectResponse response) {
    return response.data.toModel();
  }
}

class SignInMapper {
  static String mapToModel(ObjectResponse response) {
    return response.token;
  }
}