import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      // start loading
      MyFullScreenLoader.openLoadingDialog('Logging you in...', MyImages.personalInformationLoader);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      MyFullScreenLoader.stopLoading();

      // Show Success Screen
      MyLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);


      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));

    } catch (e) {
      // remove loader
      MyFullScreenLoader.stopLoading();

      // show some some generic error to user
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      MyFullScreenLoader.openLoadingDialog('Logging you in...', MyImages.personalInformationLoader);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // Send Email to reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      MyFullScreenLoader.stopLoading();

      // Show Success Screen
      MyLoaders.successSnackBar(title: 'Email Sent', message: 'Email Link Sent to Reset your Password'.tr);

    } catch (e) {
      // remove loader
      MyFullScreenLoader.stopLoading();

      // show some some generic error to user
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}