import 'package:dio/dio.dart';
import 'package:vinhcine/configs/app_config.dart';
import 'package:vinhcine/models/entities/movie_entity.dart';
import 'package:vinhcine/models/responses/array_response.dart';
import 'package:retrofit/retrofit.dart';

part 'amazon_client.g.dart';

@RestApi()
abstract class AmazonClient {
  factory AmazonClient(Dio dio, {String baseUrl}) = _AmazonClient;

  /// Update avatar
  @POST("/avatar")
  Future<void> uploadAvatar();
}
