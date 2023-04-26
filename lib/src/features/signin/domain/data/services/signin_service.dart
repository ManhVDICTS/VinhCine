import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../remote/dtos/signin_response.dart';

part 'signin_service.g.dart';

@RestApi()
abstract class SignInService {
  factory SignInService(Dio dio) = _SignInService;

  @GET('/api/client_auth/login')
  Future<HttpResponse<SignInResponse>> signIn(@Body() Map<String, dynamic> body);
}
