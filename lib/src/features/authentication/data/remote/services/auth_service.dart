import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/get_token_response.dart';

part 'auth_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @GET('/api/client_auth/logout')
  Future<dynamic> signOut();

  @GET('/api/client_auth/refresh')
  Future<GetTokenResponse> refreshToken();
}

GetTokenResponse deserializeGetTokenResponse(Map<String, dynamic> json) => GetTokenResponse.fromJson(json);

Map<String, dynamic> serializeGetTokenResponse(GetTokenResponse object) => object.toJson();
