import 'dart:async';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email whenever verify screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      MyLoaders.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and verify your email');
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on email verification
  setTimerForAutoRedirect() {
    Timer.periodic(
        const Duration(seconds: 1),
            (timer) async {
              await FirebaseAuth.instance.currentUser?.reload();
              final user =FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                timer.cancel();
                Get.off(
                  SuccessScreen(
                      image: MyImages.success,
                      title: MyText.yourAccountCreatedTitle,
                      subtitle: MyText.yourAccountCreatedSubTitle,
                      onPressed: () => AuthenticationRepository.instance.screenRedirect(),
                  )
                );
              }
            }
    );
  }

  /// Manually check if email is verified
  checkEmailVerificationStatus() async {
    await FirebaseAuth.instance.currentUser?.reload();
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
          SuccessScreen(
            image: MyImages.success,
            title: MyText.yourAccountCreatedTitle,
            subtitle: MyText.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          )
      );
    }
  }

}