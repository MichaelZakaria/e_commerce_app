import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/network/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loader.dart';

/// Controller to manage user-related functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey =GlobalKey<FormState>();

  /// init user data when Home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  /// Update user record
  Future<void> updateUserName() async {
    try {
      // start loading
      MyFullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          MyImages.personalInformationLoader);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MyFullScreenLoader.stopLoading();
        MyLoaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      // form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first and last name in the firebase firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loader
      MyFullScreenLoader.stopLoading();

      // show success message
      MyLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated.');

      // move to verify email screen
      Get.off(const ProfileScreen());
    } catch (e) {
      // remove loader
      MyFullScreenLoader.stopLoading();

      // show some some generic error to user
      MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}