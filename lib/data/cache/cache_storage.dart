abstract interface class CacheStorage {
  Future<void> save({required String key, required dynamic value});
  Future<dynamic> fetch(String key);
}
