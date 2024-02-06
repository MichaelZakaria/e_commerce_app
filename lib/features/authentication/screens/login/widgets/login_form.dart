import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MySizes.spaceBtwSections),
        child: Column(
          children: [
            /// email
            TextFormField(
              controller: controller.email,
              validator: (value) => MyValidator.validateEmail(value),
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: MyText.email),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => MyValidator.validateEmptyText(value, 'Password'),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: MyText.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye),),
                ),
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
                    Obx(
                          () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value
                      ),
                    ),
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
                    onPressed: () => controller.emailAndPasswordSignIn(),
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