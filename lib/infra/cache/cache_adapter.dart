import 'package:localstorage/localstorage.dart';

import '../../data/data.dart';

class CacheAdapter implements CacheStorage {
  CacheAdapter({
    required this.localStorage,
  });

  final LocalStorage localStorage;

  @override
  Future fetch(String key) async {
    if (await localStorage.ready) {
      return await localStorage.getItem(key);
    }
  }

  @override
  Future<void> save({required String key, required value}) async {
    await localStorage.deleteItem(key);
    await localStorage.setItem(key, value);
  }
}
