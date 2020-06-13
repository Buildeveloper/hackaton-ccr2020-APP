import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ace/app/shared/exceptions/storage_exceptions.dart';
import 'package:ace/app/shared/repositories/storage/storage_manager_interface.dart';

class StorageManager<T> extends IStorageManager {
  Completer<SharedPreferences> _instance = Completer<SharedPreferences>();

  _init() async{
    _instance.complete(await SharedPreferences.getInstance());
  }

  StorageManager() {
    _init();
  }

  @override
  Future put(String key, dynamic value) async {
    var preferences = await _instance.future;

    if (value is bool)
      preferences.setBool(key, value);
    else if (value is int)
      preferences.setInt(key, value);
    else if (value is double)
      preferences.setDouble(key, value);
    else if (value is String)
      preferences.setString(key, value);
    else if (value is List<String>)
      preferences.setStringList(key, value);
    else
      throw new StorageException(INVALID_DATA_TYPE);
  }

  @override
  Future<dynamic> get(String key) async {
    var preferences = await _instance.future;

    return preferences.get(key);
  }

  @override
  Future delete(String key) async {
    var preferences = await _instance.future;
    preferences.remove(key);
  }
}