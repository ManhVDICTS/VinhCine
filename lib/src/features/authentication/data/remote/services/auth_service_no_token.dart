import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

import '../dtos/get_token_response.dart';
import '../dtos/register_response.dart';

part 'auth_service_no_token.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AuthServiceNoToken {
  factory AuthServiceNoToken(Dio dio) = _AuthServiceNoToken;

  @POST('/api/client_auth/login')
  Future<GetTokenResponse> signIn(@Body() Map<String, dynamic> body, @CancelRequest() CancelToken cancelToken);

  @POST('/api/client_auth/register')
  Future<RegisterResponse> register(@Body() Map<String, dynamic> body, @CancelRequest() CancelToken cancelToken);
}

GetTokenResponse deserializeGetTokenResponse(Map<String, dynamic> json) => GetTokenResponse.fromJson(json);

RegisterResponse deserializeRegisterResponse(Map<String, dynamic> json) => RegisterResponse.fromJson(json);

Map<String, dynamic> serializeGetTokenResponse(GetTokenResponse object) => object.toJson();

Map<String, dynamic> serializeRegisterResponse(RegisterResponse object) => object.toJson();

extension AuthServiceNoTokenExtensions on AuthServiceNoToken {
  GetTokenResponse mockSignIn(@Body() Map<String, dynamic> body) {
    return GetTokenResponse.fromJson(const {
        "code": 0,
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im1hbmhwdGl0MTIzQGdtYWlsLmNvbSIsImZ1bGxuYW1lIjoiTeG6oW5oIiwicm9sZSI6ImNsaWVudCIsImp0aSI6IjBjNGUyYTkwLWVhNjEtMTFlZC05NDc2LWY3MjE0ZTlkZWYwYyIsImlhdCI6MTY4MzE5MzgwNSwiZXhwIjoyODkyNzkzODA1fQ.IFdUxyQXzV_WIuj0Kyynhx8l5wA7Xt0TdrSNwOr9Vdg",
        "data": {
          "is_card": false,
          "point": 0,
          "__v": 0,
          "phone": "0933041188",
          "fullname": "Mạnh",
          "username": "manhptit123@gmail.com",
          "bar_code": "ATttI5gNaulKPVKl",
          "_id": "6436764b33949609dce1e37a"
        },
        "expiresIn": 1209600000
      });
  }
}
