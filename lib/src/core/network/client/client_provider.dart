import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/interceptors/interceptors.dart';

Dio baseDio(AppConfig appConfig) {
  final dio = Dio();
  dio.interceptors.add(InterceptorBuilder.logger);
  dio.options.baseUrl = appConfig.baseUrl;
  return dio;
}

Dio authDio(AppConfig appConfig) {
  final dio = Dio();
  dio.interceptors.addAll([
    InterceptorBuilder.authorization,
    InterceptorBuilder.logger,
    InterceptorBuilder.refreshToken(dio),
  ]);
  dio.options.baseUrl = appConfig.baseUrl;
  return dio;
}
