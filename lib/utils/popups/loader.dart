import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/colors.dart';

class MyLoaders {

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          elevation: 0,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: MyHelperFunctions.isDarkMode(Get.context!) ? MyColors.darkGrey.withOpacity(0.9) : MyColors.grey.withOpacity(0.9)
            ),
            child: Center(child: Text(message, style: Theme.of(Get.context!).textTheme.labelLarge,)),
          )
        )
    );
  }

  static successSnackBar({required title, message='', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: MyColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(Iconsax.check, color: MyColors.white,),
    );
  }

    static warningSnackBar({required title, message = ''}) {
      Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: MyColors.white,),
      );
    }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: MyColors.white,),
    );
  }

}