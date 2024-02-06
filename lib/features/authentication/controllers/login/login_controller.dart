import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/network/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loader.dart';

class LoginController extends GetxController {

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final userController = Get.put(UserController());


  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL') != null && localStorage.read('REMEMBER_ME_PASSWORD') != null) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    }
    super.onInit();
  }

  /// Email and Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try{
      // start loading
      MyFullScreenLoader.openLoadingDialog('Logging you in...', MyImages.personalInformationLoader);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // form validation
      if(!loginFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      MyFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // remove loader
      MyFullScreenLoader.stopLoading();

      // show some some generic error to user
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Google SignIN Authentication
  Future<void> googleSignIn() async {
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

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      MyFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      // remove loader
      MyFullScreenLoader.stopLoading();

      // show some some generic error to user
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}