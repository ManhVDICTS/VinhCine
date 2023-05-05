import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vinhcine/src/core/network/response/object_response.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/payload_dto.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/payload_dto.dart' as dto;

part 'auth_service.g.dart';

@RestApi(parser: Parser.FlutterCompute)
abstract class AuthService {
  factory AuthService(Dio dio) = _AuthService;

  @GET('/api/client_auth/logout')
  Future<ObjectResponse<dynamic>> signOut(@CancelRequest() CancelToken cancelToken);

  @GET('/api/client_auth/refresh')
  Future<ObjectResponse<PayloadDTO>> refreshToken();
}

ObjectResponse<dto.PayloadDTO> deserializeObjectResponse<PayloadDTO>(Map<String, dynamic> json) =>
    ObjectResponse<dto.PayloadDTO>.fromJson(
      json,
          (value) => dto.PayloadDTO.fromJson(value as Map<String, dynamic>),
    );

Map<String, dynamic> serializeObjectResponse(ObjectResponse object) => object.toJson((obj) => obj.toJson());
