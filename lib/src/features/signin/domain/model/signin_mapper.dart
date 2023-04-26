import 'package:vinhcine/src/features/signin/domain/data/remote/dtos/signin_response.dart';

extension SignInData on SignInResponse {
  String toModel() => token;
}