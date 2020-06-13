abstract class IStorageManager {
  Future delete(String key);
  Future<dynamic> get(String key);
  Future put(String key, dynamic value);
}