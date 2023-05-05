import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vinhcine/src/core/network/response/object_response.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/payload_dto.dart';
import 'package:vinhcine/src/features/authentication/data/remote/dtos/payload_dto.dart' as dto;

part 'profile_service.g.dart';

@RestApi()
abstract class ProfileService {
  factory ProfileService(Dio dio) = _ProfileService;

}