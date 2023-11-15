import 'package:lyw_lessors/shared/domain/services/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServiceImpl extends LocalStorageService {
  SharedPreferences? preferences;

  Future<void> loadSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<T?> persist<T>(String key, T value) async {
    if (preferences == null) await loadSharedPreferences();

    switch (T) {
      case int:
        preferences!.setInt(key, value as int);
        break;
      case String:
        preferences!.setString(key, value as String);
        break;
      default:
        throw UnimplementedError(
            "Persist isn't implemented for type ${T.runtimeType}");
    }
  }

  @override
  Future<bool> remove(String key) async {
    if (preferences == null) await loadSharedPreferences();
    return await preferences!.remove(key);
  }

  @override
  Future<T?> retrieve<T>(String key) async {
    if (preferences == null) await loadSharedPreferences();

    switch (T) {
      case int:
        return preferences!.getInt(key) as T?;
      case String:
        return preferences!.getString(key) as T?;
      default:
        throw UnimplementedError(
            "Retrieve isn't implemented for type ${T.runtimeType}");
    }
  }
}
