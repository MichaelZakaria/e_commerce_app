import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_function.dart';

class MySignUpForm extends StatelessWidget {
  const MySignUpForm({super.key,});

  @override
  Widget build(BuildContext context) {

    final dark = MyHelperFunctions.isDarkMode(context);


    return Form(
        child: Column(
          children: [
            /// first and last name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(labelText: MyText.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: MySizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    expands: false,
                    decoration: const InputDecoration(labelText: MyText.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// username
            TextFormField(
              decoration: const InputDecoration(labelText: MyText.userName, prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// email
            TextFormField(
              decoration: const InputDecoration(labelText: MyText.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// phone number
            TextFormField(
              decoration: const InputDecoration(labelText: MyText.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// password
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: MyText.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwSections),
            /// terms and conditions checkbox
            const MyTermsAndConditionsCheckbox(),
            const SizedBox(height: MySizes.spaceBtwSections),
            /// sign up button
            SizedBox(width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(const VerifyEmailScreen()),
                    child: const Text(MyText.createAccount)
                )
            ),
            const SizedBox(height: MySizes.spaceBtwSections),
          ],
        )
    );
  }
}

