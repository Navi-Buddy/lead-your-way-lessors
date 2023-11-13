
abstract class LocalStorageService {
  Future<void> persist<T>(String key, T value);
  Future<T?> retrieve<T>(String key);
  Future<bool> remove(String key);
}