import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:vinhcine/src/configs/app_configs/app_config.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/core/exceptions/app_exceptions.dart';
import 'package:vinhcine/src/core/network/client/client_provider.dart';
import 'package:vinhcine/src/core/shared_prefs/access_token_storage.dart';
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
}
