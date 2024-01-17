import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

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
              /// title amd subtitle
              Text(MyText.changePasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwItems,),
              Text(MyText.changePasswordSubTitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwSections,),
              /// buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(const LoginScreen()), child: const Text(MyText.done)),),
              const SizedBox(height: MySizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child:const Text(MyText.resendEmail),),),
              const SizedBox(height: MySizes.spaceBtwSections,),
            ],
          ),
        ),
      ),
    );
  }
}
