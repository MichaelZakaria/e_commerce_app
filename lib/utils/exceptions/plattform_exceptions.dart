/// Custom exception class to handle Platform-related errors
class MyPlatformException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code
  MyPlatformException(this.code);

  /// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Pleas double check you information.';

    /// Todo: Complete the remaining Exceptions

      default:
        return 'An unexpected Firebase error occurred. Pleas try again';
    }
  }


}