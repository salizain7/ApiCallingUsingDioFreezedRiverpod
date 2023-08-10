class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException(this.message, this.statusCode);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ServerException) {
      return other.message == message && other.statusCode == statusCode;
    }

    return false;
  }
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

// Cancel Token Exception
class CancelRequestException implements Exception {
  final String message;

  CancelRequestException(this.message);
}
