class InvalidDataException implements Exception {
  const InvalidDataException();
}

class InvalidResponseException implements Exception {
  final String message;

  const InvalidResponseException([this.message]);

  @override
  String toString() => 'InvalidResponseException{message: $message}';
}
