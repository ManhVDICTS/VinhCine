import 'dart:convert';
import 'package:dio/dio.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = ''/*authService.token.value*/;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      options.headers['Content-Type'] = 'application/json';
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    try {
      data = jsonEncode(err.response?.data);
      if (statusCode == 401) {
        await _refreshToken();
        return handler.resolve(await _retry(err.requestOptions));
      }
    } catch (e) {
      /// do something here
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final authService = Get.find<AuthService>();
    final tokenEntity = authService.token.value;
    final languageCode = await authService.getLanguageCode();

    /// set bearer token
    requestOptions.headers["Authorization"] =
        "Bearer " + (tokenEntity?.accessToken ?? "");
    requestOptions.headers['Content-Type'] = 'application/json';
    requestOptions.headers['Accept-Language'] = languageCode;

    final options = Options(
      contentType: 'application/json',
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    Uri uri = Uri.parse("${AppConfigs.baseUrl}" "${requestOptions.path}");
    return ApiUtil.getDio().requestUri<dynamic>(
      uri,
      data: requestOptions.data,
      options: options,
    );
  }

  Future<void> _forceSignOut() async {
    /*final authService = Get.find<AuthService>();
    await authService.signOut();
    AppToast.showError(message: S.of(Get.context!).login_session_expired);
    Get.offAllNamed(RouteGenerator.welcome);*/
    GlobalEvent.instance.forceSignOutEvent.add(true);
  }

  int refreshTime = 0;

  void clearRefreshTime() {
    refreshTime = 0;
  }

  void increaseRefreshTime() {
    refreshTime++;
  }

  Future<void> _refreshToken() async {
    final ApiService apiService = Get.find<ApiService>();
    final authService = Get.find<AuthService>();
    /// đánh dấu đã refresh token
    increaseRefreshTime();
    /// chỉ cho refresh token 1 lần
    if (refreshTime > 1) {
      print('quanth: welcome refreshToken 1');
      await _forceSignOut();
    } else {
      /// lấy access token mới bằng refresh token ...
      try {
        TokenEntity? result = await apiService.refreshToken();
        if (result != null &&
            (result.accessToken.isNotEmpty) &&
            (result.refreshToken.isNotEmpty) &&
            (result.mmToken.isNotEmpty)) {
          print('quanth: welcome refreshToken 1.1');
          /// save token
          await authService.saveToken(result);
          clearRefreshTime();
        } else{
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
