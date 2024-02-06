import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/personalization/models/user_model.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/network/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

   Rx<UserModel> user = UserModel.empty().obs;
   final userRepository = Get.put(UserRepository());

   final hidePassword = false.obs;
   final verifyEmail = TextEditingController();
   final verifyPassword = TextEditingController();
   GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

   final imageUploading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  /// save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    // First Update Rx user and then check if user data is already stored. it not store new data
    await fetchUserRecord();

    // If no record already stored
    if (user.value.id.isEmpty) {
      try {
        if (userCredential != null) {
          // Convert Name to first and last name
          final nameParts = UserModel.nameParts(
              userCredential.user!.displayName ?? ' ');
          final username = UserModel.generateUserName(
              userCredential.user!.displayName ?? ' ');

          // Map Data
          final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            userName: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      } catch (e) {
        MyLoaders.warningSnackBar(
            title: 'Data not saved',
            message: 'SomeThing wnt wrong while saving your information. you can re-save your data in your profile'
        );
      }
    }
  }

  /// Delete account warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MySizes.md),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
          child: const Padding(padding: EdgeInsets.symmetric(horizontal: MySizes.lg), child: Text('Delete'),)
      ),
      cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'))
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      MyFullScreenLoader.openLoadingDialog('Processing', MyImages.personalInformationLoader);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          MyFullScreenLoader.stopLoading();
          Get.offAll(const LoginScreen());
        } else if (provider == 'password') {
          MyFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Re-authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
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
      if (!reAuthFormKey.currentState!.validate()) {
        MyFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      MyFullScreenLoader.stopLoading();
      Get.offAll(const LoginScreen());

    } catch (e) {
      MyFullScreenLoader.stopLoading();
      MyLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload image
  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // upload image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        MyLoaders.successSnackBar(title: 'Congratulations', message: 'Your profile image has been updated!');
      }
    } catch (e) {
      MyLoaders.errorSnackBar(title: 'OhSnap', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }
  }
}