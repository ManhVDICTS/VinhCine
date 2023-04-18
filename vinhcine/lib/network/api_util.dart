import 'package:dio/dio.dart';
import 'package:vinhcine/configs/app_config.dart';
import 'package:vinhcine/network/amazon_client.dart';
import 'package:vinhcine/network/api_client.dart';

import 'api_interceptors.dart';
import 'logger_interceptor.dart';

class ApiUtil {
  static ApiClient getApiClient() {
    final dio = Dio();
    dio.options.connectTimeout = 30000;
    dio.interceptors.addAll([ApiInterceptors(), PrettyDioLogger()]);
    final apiClient = ApiClient(dio, baseUrl: AppConfig.baseUrl);
    return apiClient;
  }

  static AmazonClient getAmazonClient() {
    final dio = Dio();
    dio.options.connectTimeout = 60000;
    dio.interceptors.addAll([ApiInterceptors(), PrettyDioLogger()]);
    final apiClient = AmazonClient(dio, baseUrl: AppConfig.baseUrl);
    return apiClient;
  }
}
