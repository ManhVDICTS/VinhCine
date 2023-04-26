import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';

Dio getDio(AppConfig appConfig) {
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
  dio.options.baseUrl = appConfig.baseUrl;
  return dio;
}
