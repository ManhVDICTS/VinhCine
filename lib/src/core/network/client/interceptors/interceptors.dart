import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vinhcine/src/core/di/injections.dart';
import 'package:vinhcine/src/core/network/client/interceptors/authorization_interceptor.dart';
import 'package:vinhcine/src/core/network/client/interceptors/logger_interceptor.dart';
import 'package:vinhcine/src/core/shared_prefs/shared_prefs_provider.dart';

export 'authorization_interceptor.dart';
export 'logger_interceptor.dart';

class InterceptorBuilder {
  InterceptorBuilder._();

  static AuthorizationInterceptor authorization =
      AuthorizationInterceptor(getBearerToken: () async {
    try {
      var token = await di<SharedPrefProvider>().fetch(key: kAccessTokenKey);
      return token;
    } catch (e) {
      rethrow;
    }
  });

  static Interceptor get logger {
    if (kDebugMode) {
      return LoggerInterceptor.loggerInterceptor();
    } else {
      return const Interceptor();
    }
  }
}
