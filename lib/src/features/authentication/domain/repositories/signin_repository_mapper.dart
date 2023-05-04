
import '../../data/remote/dtos/get_token_response.dart';

class SignInMapper {
  static String mapToModel(GetTokenResponse response) {
    return response.token;
  }
}
