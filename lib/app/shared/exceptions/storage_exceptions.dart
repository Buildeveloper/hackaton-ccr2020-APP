const String INVALID_DATA_TYPE = "Invalid storage data type";


class StorageException implements Exception {
  final String message;

  const StorageException(this.message);

  String toString() => "StorageException: $message";
}