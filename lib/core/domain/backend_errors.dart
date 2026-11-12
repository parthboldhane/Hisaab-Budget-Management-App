class BackendException implements Exception {
  const BackendException(this.message);

  final String message;

  @override
  String toString() => message;
}

class ValidationException extends BackendException {
  const ValidationException(super.message);
}

class RecordNotFoundException extends BackendException {
  const RecordNotFoundException(super.message);
}

class DuplicateRecordException extends BackendException {
  const DuplicateRecordException(super.message);
}

class PermissionDeniedException extends BackendException {
  const PermissionDeniedException(super.message);
}

class InvalidBackupException extends BackendException {
  const InvalidBackupException(super.message);
}
