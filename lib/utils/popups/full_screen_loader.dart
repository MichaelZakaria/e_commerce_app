import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../constants/colors.dart';

/// A utility class for managing a full-screen loading dialog
class MyFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation
  /// This method doesn't return anything
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog
  ///   - animation: The lottie animation to be shown
  static void openLoadingDialog(String text, String animation) {
    showDialog(
        context: Get.overlayContext!, // for overlay dialogs
        barrierDismissible: false, // the dialog can't be dismissed by tapping outside it
        builder: (_) => PopScope(
            canPop: false, // disable popping with the back button
            child: Container(
              color: MyHelperFunctions.isDarkMode(Get.context!) ? MyColors.dark : MyColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250,), // adjust the height as needed
                  MyAnimationLoaderWidget(text: text, animation: animation)
                ],
              ),
            )
        )
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // close the dialog using the Navigator
  }

}