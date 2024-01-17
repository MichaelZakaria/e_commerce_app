import 'package:e_commerce_app/common/styles/spacing_style.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo, title, subtitle
              const MyLoginHeader(),
              /// form
              const MyLoginForm(),
              /// divider
              MyFormDivider(dividerText: MyText.orSignInWith.capitalize!),
              const SizedBox(height: MySizes.spaceBtwSections),
              /// social buttons
              const MySocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}







