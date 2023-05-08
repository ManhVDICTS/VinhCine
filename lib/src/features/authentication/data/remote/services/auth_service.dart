import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vinhcine/src/core/network/response/object_response.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/profile_dto.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/profile_dto.dart' as dto;

part 'auth_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @GET('/api/client_auth/logout')
  Future<ObjectResponse<dynamic>> signOut(@CancelRequest() CancelToken cancelToken);

  @GET('/api/client_auth/refresh')
  Future<ObjectResponse<ProfileDTO>> refreshToken();
}

ObjectResponse<dto.ProfileDTO> deserializeObjectResponse<PayloadDTO>(Map<String, dynamic> json) =>
    ObjectResponse<dto.ProfileDTO>.fromJson(
      json,
          (value) => dto.ProfileDTO.fromJson(value as Map<String, dynamic>),
    );

Map<String, dynamic> serializeObjectResponse(ObjectResponse object) => object.toJson((obj) => obj.toJson());
