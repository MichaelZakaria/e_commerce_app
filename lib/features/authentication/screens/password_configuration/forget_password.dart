import 'package:e_commerce_app/common/styles/spacing_style.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// headings
              Text(MyText.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
              const SizedBox(height: MySizes.spaceBtwItems,),
              Text(MyText.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
              const SizedBox(height: MySizes.spaceBtwSections * 2,),
              /// text field
              Form(
                key: controller.forgetPasswordFormKey,
                child: TextFormField(
                  validator: (value) => MyValidator.validateEmail(value),
                  controller: controller.email,
                  decoration: const InputDecoration(labelText: MyText.email, prefixIcon: Icon(Iconsax.direct_right)),
                ),
              ),
              const SizedBox(height: MySizes.spaceBtwSections,),
              /// submit button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(MyText.submit),),)
            ],
          ),
        ),
      ),
    );
  }
}
