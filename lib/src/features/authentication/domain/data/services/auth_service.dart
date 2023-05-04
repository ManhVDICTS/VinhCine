import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vinhcine/src/features/authentication/domain/data/remote/dtos/get_token_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @GET('/api/client_auth/logout1')
  Future<HttpResponse<dynamic>> signOut();

  @GET('/api/client_auth/refresh')
  Future<HttpResponse<GetTokenResponse>> refreshToken();
}
