abstract class PermissionException implements Exception {
  const PermissionException(this.message);

  final String message;
}

class DeniedException extends PermissionException {
  const DeniedException(super.message);
}

class PermanentlyDeniedException extends PermissionException {
  const PermanentlyDeniedException(super.message);
}
