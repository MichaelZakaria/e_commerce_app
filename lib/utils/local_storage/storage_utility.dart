import 'package:get_storage/get_storage.dart';

// A singleton class (design pattern) for maintaining a single connection tom improve performance and avoid redundant connections
class MyLocalStorage {
  // private constructor
  MyLocalStorage._internal();

  // instance of the class
  static final MyLocalStorage _instance = MyLocalStorage._internal();

  // factory constructor
  factory MyLocalStorage() {
    return _instance;
  }

  final _storage = GetStorage();

  // generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // generic method to clear data
  Future<void> clearAll() async {
    await _storage.erase();
  }

}