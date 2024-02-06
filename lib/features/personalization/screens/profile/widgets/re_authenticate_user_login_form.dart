import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Re-authenticate User'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => MyValidator.validateEmail(value),
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: MyText.email),
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                /// Password
                Obx(
                        () => TextFormField(
                          obscureText: controller.hidePassword.value,
                          controller: controller.verifyPassword,
                          validator: (value) => MyValidator.validateEmptyText(value, 'Password'),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.password_check),
                              suffixIcon: IconButton(
                                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                                  icon: controller.hidePassword.value ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye)),
                              labelText: MyText.password),
                        )
                ),
                const SizedBox(height: MySizes.spaceBtwSections,),

                /// Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                    child: const Text('Verify'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
