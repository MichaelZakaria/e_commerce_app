import 'package:e_commerce_app/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: const [

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [
              /// image
              const Image(image: AssetImage(MyImages.onBoardingImage1),),
              const SizedBox(height: MySizes.spaceBtwSections,),
              /// email, title amd subtitle
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwSections,),
              Text(MyText.changePasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwItems,),
              Text(MyText.changePasswordSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwSections,),
              /// buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.offAll(const LoginScreen()), child: const Text(MyText.done)),),
              const SizedBox(height: MySizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child:const Text(MyText.resendEmail),),),
              const SizedBox(height: MySizes.spaceBtwSections,),
            ],
          ),
        ),
      ),
    );
  }
}
