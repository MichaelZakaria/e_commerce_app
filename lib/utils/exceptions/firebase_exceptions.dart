/// Custom exception class to handle Firebase-related errors
class MyFirebaseException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code
  MyFirebaseException(this.code);

  /// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'unknown':
        return 'An unknown firebase error occurred. Pleas try again.';

    /// Todo: Complete the remaining Exceptions

      default:
        return 'An unexpected Firebase error occurred. Pleas try again';
    }
  }


}