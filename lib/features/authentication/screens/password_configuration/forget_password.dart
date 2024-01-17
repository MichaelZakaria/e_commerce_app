import 'package:e_commerce_app/common/styles/spacing_style.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
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
            TextFormField(
              decoration: const InputDecoration(labelText: MyText.email, prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),
            /// submit button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.off(const ResetPassword()), child: const Text(MyText.submit),),)
          ],
        ),
      ),
    );
  }
}
