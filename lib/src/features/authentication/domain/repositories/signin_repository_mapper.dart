import '../data/remote/dtos/signin_response.dart';

class SignInMapper {
  static String mapToModel(SignInResponse response) {
    return response.token;
  }
}
