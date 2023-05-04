import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/get_token_response.dart';
import '../dtos/register_response.dart';

part 'auth_service_no_token.g.dart';

@RestApi()
abstract class AuthServiceNoToken {
  factory AuthServiceNoToken(Dio dio) = _AuthServiceNoToken;

  @POST('/api/client_auth/login')
  Future<HttpResponse<GetTokenResponse>> signIn(@Body() Map<String, dynamic> body);

  @POST('/api/client_auth/register')
  Future<HttpResponse<RegisterResponse>> register(@Body() Map<String, dynamic> body);
}
