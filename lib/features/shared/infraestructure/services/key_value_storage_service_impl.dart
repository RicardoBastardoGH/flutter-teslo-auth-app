

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teslo_shop_mobile/features/shared/infraestructure/services/key_value_storage_service.dart';

class KeyValueStorageServiceImpl extends KeyValueStorageService {

  Future<SharedPreferences> getSharesPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharesPrefs();

    switch(T) {
      case const (int):
        return prefs.getInt(key) as T?;
        
      case const (String):
        return prefs.getString(key) as T?;

      default:
      throw UnimplementedError('Set not implemented for type ${T.runtimeType}');
    }

  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharesPrefs();
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharesPrefs();

    switch(T) {
      case const (int):
        prefs.setInt(key, value as int);
        break;
        
      case const (String):
        prefs.setString(key, value as String);
        break;

      default:
      throw UnimplementedError('Set not implemented for type ${T.runtimeType}');
    }

  }
}