import 'package:e_commerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MySizes.spaceBtwSections),
        child: Column(
          children: [
            /// email
            TextFormField(
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: MyText.email),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// password
            TextFormField(
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check),
                labelText: MyText.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields / 2),
            /// remember me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // remember  me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(MyText.rememberMe),
                  ],
                ),
                // forget password
                TextButton(onPressed: () => Get.to(const ForgetPassword()), child: const Text(MyText.forgetPassword)),
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwSections),
            /// sign in Button
            SizedBox(width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(const NavigationMenu()),
                    child: const Text(MyText.signIn))
            ),
            const SizedBox(height: MySizes.spaceBtwItems),
            /// Create an account
            SizedBox(width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {Get.to(const SignupScreen());},
                    child: const Text(MyText.createAccount)
                )
            ),
            // divider
          ],
        ),
      ),
    );
  }
}