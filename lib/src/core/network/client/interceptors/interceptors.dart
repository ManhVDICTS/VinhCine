import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/core/network/client/interceptors/authorization_interceptor.dart';
import 'package:vinhcine/src/core/shared_prefs/access_token_storage.dart';
import 'package:vinhcine/src/features/authentication/data/remote/services/auth_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

export 'authorization_interceptor.dart';

class InterceptorBuilder {
  InterceptorBuilder._();

  static AuthorizationInterceptor authorization =
      AuthorizationInterceptor(getBearerToken: () async {
    try {
      var token = await di<AccessTokenStorage>().read();
      return token;
    } catch (e) {
      rethrow;
    }
  });

  static Interceptor get logger {
    if (kDebugMode) {
      return PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90);
    } else {
      return const Interceptor();
    }
  }

  static Interceptor refreshToken(Dio dio) {
    return Fresh<String>(
        shouldRefresh: (Response? response) {
          return response?.statusCode == 401;
        },
        tokenStorage: di<AccessTokenStorage>(),
        refreshToken: (token, client) async {
          var result = await di<AuthService>().refreshToken();
          return result.token;
        },
        httpClient: dio,
        tokenHeader: (String token) {
          return {
            'Authorization': 'Bearer $token',
          };
        });
  }
}
