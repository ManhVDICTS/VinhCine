import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/core/exceptions/app_exceptions.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/core/shared_prefs/shared_prefs_provider.dart';
import 'package:vinhcine/src/features/authentication/domain/data/services/auth_service.dart';

class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor({required Future<String?> Function() getBearerToken})
      : _bearerToken = getBearerToken,
        super();

  final Future<String?> Function() _bearerToken;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await _bearerToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
        super.onRequest(options, handler);
      } else {
        final e = NotAuthenticatedException(message: 'NotAuthenticatedException');
        handler.reject(DioError(
            requestOptions: options, type: DioErrorType.cancel, error: e));
      }
    } on NotAuthenticatedException catch (e) {
      handler.reject(DioError(
          requestOptions: options, type: DioErrorType.cancel, error: e));
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    var data = "";
    try {
      data = jsonEncode(err.response?.data);
      if (statusCode == 401) {
        await _refreshToken();
        return handler.resolve(await _retry(err.requestOptions));
      }
    } catch (e) {}
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    var token = await di<SharedPrefProvider>().fetch(key: kAccessTokenKey);
    requestOptions.headers["Authorization"] = "Bearer $token";

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    Uri uri = Uri.parse("${di<AppConfig>().baseUrl}" "${requestOptions.path}");
    return authDio(di<AppConfig>()).requestUri<dynamic>(
      uri,
      data: requestOptions.data,
      options: options,
    );
  }

  Future<void> _forceSignOut() async {
    di<SharedPrefProvider>().delete(key: kAccessTokenKey);
  }

  int count = 0;

  void _resetCounter() {
    count = 0;
  }

  void _increaseCounter() {
    count++;
  }

  Future<void> _refreshToken() async {
    final apiService = di<AuthService>();
    _increaseCounter();
    if (count > 1) {
      print('quanth: welcome refreshToken 1');
      await _forceSignOut();
    } else {
      /// lấy access token mới bằng refresh token ...
      try {
        var result = await apiService.refreshToken();
        if (result.data.token.isNotEmpty) {
          print('quanth: welcome refreshToken 1.1');
          /// save token
          di<SharedPrefProvider>().save(key: kAccessTokenKey, data: result.data.token);
          _resetCounter();
        } else {
          print('quanth: welcome refreshToken 2');
          await _forceSignOut();
        }
      } on Exception catch (e) {
        print('quanth: welcome refreshToken 3');
        await _forceSignOut();
      }
    }
  }
}
