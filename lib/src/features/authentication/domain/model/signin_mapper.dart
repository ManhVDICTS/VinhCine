
import 'package:vinhcine/src/features/authentication/data/remote/dtos/get_token_response.dart';

extension SignInData on GetTokenResponse {
  String toModel() => token;
}