import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vinhcine/src/core/network/response/object_response.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/payload_dto.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/register_dto.dart';

part 'auth_service_no_token.g.dart';

@RestApi()
abstract class AuthServiceNoToken {
  factory AuthServiceNoToken(Dio dio) = _AuthServiceNoToken;

  @POST('/api/client_auth/login')
  Future<ObjectResponse<PayloadDTO>> signIn(@Body() Map<String, dynamic> body, @CancelRequest() CancelToken cancelToken);

  @POST('/api/client_auth/register')
  Future<ObjectResponse<RegisterDTO>> register(@Body() Map<String, dynamic> body, @CancelRequest() CancelToken cancelToken);
}

extension AuthServiceNoTokenExtensions on AuthServiceNoToken {
  ObjectResponse<PayloadDTO> mockSignIn(Map<String, dynamic> body) {
    Map<String, dynamic> json = const {
      "code": 0,
      "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im1hbmhwdGl0MTIzQGdtYWlsLmNvbSIsImZ1bGxuYW1lIjoiTeG6oW5oIiwicm9sZSI6ImNsaWVudCIsImp0aSI6IjBjNGUyYTkwLWVhNjEtMTFlZC05NDc2LWY3MjE0ZTlkZWYwYyIsImlhdCI6MTY4MzE5MzgwNSwiZXhwIjoyODkyNzkzODA1fQ.IFdUxyQXzV_WIuj0Kyynhx8l5wA7Xt0TdrSNwOr9Vdg",
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
    };
    return ObjectResponse.fromJson(json, (data) => PayloadDTO.fromJson(data as Map<String, dynamic>));
  }
}
