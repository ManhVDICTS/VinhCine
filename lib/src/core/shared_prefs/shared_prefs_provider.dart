import 'package:shared_preferences/shared_preferences.dart';

typedef ObjDecoder<T> = T Function(Map<String, dynamic>);
typedef ObjEncoder<T> = Map<String, dynamic> Function(T);

abstract class SharedPreferencesProvider {
  Future<T?> fetch<T>({
    required String key,
    ObjDecoder<T>? decoder,
  });
  Future<bool> save<T>({
    required String key,
    required T data,
    ObjEncoder<T>? encoder,
  });
  Future<bool> delete({required String key});
  Future<bool> clearAll();
}

class SharedPreferencesProviderImpl extends SharedPreferencesProvider {
  @override
  Future<bool> clearAll() =>
      SharedPreferences.getInstance().then((sp) => sp.clear());

  @override
  Future<bool> delete({required String key}) =>
      SharedPreferences.getInstance().then((sp) => sp.remove(key));

  @override
  Future<T?> fetch<T>({
    required String key,
    ObjDecoder<T>? decoder,
  }) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<bool> save<T>({
    required String key,
    required T data,
    ObjEncoder<T>? encoder,
  }) {
    // TODO: implement save
    throw UnimplementedError();
  }
}

class SingInProviderImpl{

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
