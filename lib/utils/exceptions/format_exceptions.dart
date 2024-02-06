/// Custom exception class to handle Format-related errors
class MyFormatException implements Exception {
  /// The associated error message
  final String message;

  /// Default constructor with a generic error message
  MyFormatException([this.message = 'An unexpected format error occurred. pleas check your input']);

  /// Create a format exception from a specific error message
  factory MyFormatException.fromMessage(String message) {
    return MyFormatException(message);
  }

  /// Get the corresponding error message
  String get formattedMessage => message;

  /// Get the corresponding error message based on the error code
  factory MyFormatException.fromCode(String code) {
    switch (code) {
      case 'invalid-email-format':
        return MyFormatException('The email address format is invalid. Pleas enter a valid email.');

    /// Todo: Complete the remaining Exceptions

      default:
        return MyFormatException('An unexpected Firebase error occurred. Pleas try again');
    }
  }


}