import 'package:shared_preferences/shared_preferences.dart';

const kAccessTokenKey = 'access_token';

class SharedPrefProvider{

  Future<bool> clearAll() =>
      SharedPreferences.getInstance().then((sp) => sp.clear());

  Future<bool> delete({required String key}) =>
      SharedPreferences.getInstance().then((sp) => sp.remove(key));

  Future<String?> fetch({
    required String key,
  }) {
      return SharedPreferences.getInstance().then((sp) => sp.getString(key));
  }

  Future<bool> save({
    required String key,
    required String data,
  }) {
      return SharedPreferences.getInstance().then((sp) => sp.setString(key, data));
  }
}
