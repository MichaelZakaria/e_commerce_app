/// Custom exception class to handle Firebase authentication-related errors
class MyFirebaseAuthException implements Exception {
  /// The error code associated with the exception
  final String code;

  /// Constructor that takes an error code
  MyFirebaseAuthException(this.code);

  /// Get the corresponding error message based on the error code
  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';

        /// Todo: Complete the remaining Exceptions

      default:
        return 'An unexpected Firebase error occurred. Pleas try again';
    }
  }


}