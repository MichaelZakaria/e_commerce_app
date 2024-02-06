import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/data/repositories/user/user_repository.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/utils/network/network_manager.dart';
import 'package:e_commerce_app/utils/popups/full_screen_loader.dart';
import 'package:e_commerce_app/utils/popups/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../personalization/models/user_model.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController(); // controller for email input
  final lastName = TextEditingController(); // controller for lastName input
  final userName = TextEditingController(); // controller for userName input
  final password = TextEditingController(); // controller for password input
  final firstName = TextEditingController(); // controller for firstName input
  final phoneNumber = TextEditingController(); // controller for phoneNumber input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // form key for form validation

 /// signup
 Future<void> signup() async {
   try{
     // start loading
     MyFullScreenLoader.openLoadingDialog('We are processing your information...', MyImages.personalInformationLoader);

     // check internet connectivity
     final isConnected = await NetworkManager.instance.isConnected();
     if(!isConnected) {
       MyFullScreenLoader.stopLoading();
       MyLoaders.warningSnackBar(title: 'No Internet Connection');
       return;
     }

     // form validation
     if(!signupFormKey.currentState!.validate()) {
       MyFullScreenLoader.stopLoading();
       return;
     }

     // privacy policy check
     if (!privacyPolicy.value) {
       MyFullScreenLoader.stopLoading();
       MyLoaders.warningSnackBar(
           title: 'Accept Privacy Policy',
           message: 'In order to create account, you have to read and accept the Privacy Policy & Terms of Use'
       );
       return;
     }

     // register user in firebase authentication & save user data in the firebase
     final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

     // save authenticated user data in the firebase firestore
     final newUser = UserModel(
       id: userCredential.user!.uid,
       firstName: firstName.text.trim(),
       lastName: lastName.text.trim(),
       userName: userName.text.trim(),
       email: email.text.trim(),
       phoneNumber: phoneNumber.text.trim(),
       profilePicture: '',
     );

     final userRepository = Get.put(UserRepository());
     await userRepository.saveUserRecord(newUser);

     // remove loader
     MyFullScreenLoader.stopLoading();

     // show success message
     MyLoaders.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email email to continue.');

     // move to verify email screen
     Get.to(VerifyEmailScreen(email: email.text.trim(),));

   } catch (e) {
     // remove loader
     MyFullScreenLoader.stopLoading();

     // show some some generic error to user
     MyLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
   }
 }
}