import 'package:get_storage/get_storage.dart';

// A singleton class (design pattern) for maintaining a single connection to improve performance and avoid redundant connections
class MyLocalStorage {

  late final GetStorage _storage;

  // instance of the class
  static MyLocalStorage? _instance;

  // private constructor
  MyLocalStorage._internal();

  // factory constructor
  factory MyLocalStorage.instance() {
    _instance ??= MyLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = MyLocalStorage._internal();
    _instance!._storage =GetStorage(bucketName);
  }


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