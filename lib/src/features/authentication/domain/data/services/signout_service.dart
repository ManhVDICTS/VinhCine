import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'signout_service.g.dart';

@RestApi()
abstract class SignOutService {
  factory SignOutService(Dio dio) = _SignOutService;

  @GET('/api/client_auth/logout')
  Future<HttpResponse<dynamic>> signOut();
}
