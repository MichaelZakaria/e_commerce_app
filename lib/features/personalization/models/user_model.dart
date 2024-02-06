import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/formatters/formatter.dart';

/// Model class representing user data
class UserModel {
  // Add the final keyword to values which you don't want to update
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel
  UserModel ({
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.userName,
  required this.email,
  required this.phoneNumber,
  required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number
  String get formattedPhoneNo => MyFormatter.formatePhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// Static function to generate a username from the full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelUserName = "$firstName$lastName"; // combine first and last name
    String usernameWithPrefix = "My_$camelUserName"; // add "cwt" prefix
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', userName: '', email: '', phoneNumber: '', profilePicture: '');

  /// Convert model to JSON structure for storing data in firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName' : lastName,
      'Username' : userName,
      'Email' : email,
      'PhoneNumber' : phoneNumber,
      'ProfilePicture' : profilePicture,
    };
  }

  /// Factory method to create a UserModel from a firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          userName: data['Username'] ?? '',
          email: data['Email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? ''
      );
    } else {
      return UserModel.empty();
    }
  }
}