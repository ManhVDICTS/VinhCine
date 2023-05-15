import 'package:dio/dio.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/network/client/interceptors/interceptors.dart';

class AppDio {
  AppConfig appConfig;

  AppDio(this.appConfig);

  factory AppDio.init(AppConfig config) {
    AppDio result = AppDio(config);
    result.baseDio = Dio();
    result.authDio = Dio();
    return result;
  }

  late Dio _baseDio;
  late Dio _authDio;

  Dio get baseDio => _baseDio;

  set baseDio(Dio dio) {
    dio.interceptors.add(InterceptorBuilder.logger);
    dio.options.baseUrl = appConfig.baseUrl;
    _baseDio = dio;
  }

  Dio get authDio => _authDio;

  set authDio(Dio dio) {
    dio.interceptors.addAll([
      InterceptorBuilder.authorization,
      InterceptorBuilder.logger,
      InterceptorBuilder.refreshToken(dio),
    ]);
    dio.options.baseUrl = appConfig.baseUrl;
    _authDio = dio;
  }
}
