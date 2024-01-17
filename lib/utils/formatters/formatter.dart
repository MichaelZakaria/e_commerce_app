import 'package:intl/intl.dart';

class MyFormatter {

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-YYYY').format(date) ;
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount) ;
  }

  static String formatePhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7860
    if (phoneNumber.length == 10) {
      return '( ${phoneNumber.substring(0, 3)} ) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)} ';
    } else if (phoneNumber == 11) {
      return '( ${phoneNumber.substring(0, 4)} ) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)} ';
    }
    // you can add more custom phone number formatting logic if needed
    return phoneNumber;
  }

  // internationale phone number //

}