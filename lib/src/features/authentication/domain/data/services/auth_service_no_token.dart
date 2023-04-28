import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vinhcine/src/features/authentication/domain/data/remote/dtos/register_response.dart';

import '../remote/dtos/signin_response.dart';

part 'auth_service_no_token.g.dart';

@RestApi()
abstract class AuthServiceNoToken {
  factory AuthServiceNoToken(Dio dio) = _AuthServiceNoToken;

  @POST('/api/client_auth/login')
  Future<HttpResponse<SignInResponse>> signIn(@Body() Map<String, dynamic> body);

  @POST('/api/client_auth/register')
  Future<HttpResponse<RegisterResponse>> register(@Body() Map<String, dynamic> body);
}
