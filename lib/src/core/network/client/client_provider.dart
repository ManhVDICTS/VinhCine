import 'package:dio/dio.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/interceptors/interceptors.dart';

Dio dio(AppConfig appConfig) {
  final dio = Dio();
  dio.interceptors.add(InterceptorBuilder.logger);
  dio.options.baseUrl = appConfig.baseUrl;
  return dio;
}

Dio authDio(AppConfig appConfig) {
  ///(1) init dio
  final dio = Dio();
  dio.interceptors.addAll([
    ///(2) inject interceptors
    InterceptorBuilder.authorization,
    InterceptorBuilder.logger
  ]);
  dio.options.baseUrl = appConfig.baseUrl;
  return dio;
}
