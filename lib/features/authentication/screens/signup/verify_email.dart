import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(const LoginScreen()), icon: const Icon(CupertinoIcons.clear,))
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
              Text(MyText.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwItems,),
              Text('michael@mail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwItems,),
              Text(MyText.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwSections,),
              /// buttons
              SizedBox(width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to( SuccessScreen(image: MyImages.onBoardingImage1,
                      title: MyText.yourAccountCreatedTitle,
                      subtitle: MyText.yourAccountCreatedSubTitle,
                      onPressed: () => Get.to(const LoginScreen()),)),
                    child: const Text(MyText.mcontinue)),),
              const SizedBox(height: MySizes.spaceBtwItems,),
              SizedBox(width: double.infinity, child: TextButton(onPressed: () {}, child: const Text(MyText.resendEmail)),),
            ],
          ),
        ),
      ),
    );
  }
}
