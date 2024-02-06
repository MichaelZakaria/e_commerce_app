import 'package:e_commerce_app/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
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

    // initialize sign up controller
    final controller = Get.put(SignUpController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            /// first and last name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) => MyValidator.validateEmptyText(value, 'First name'),
                    expands: false,
                    decoration: const InputDecoration(labelText: MyText.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: MySizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) => MyValidator.validateEmptyText(value, 'Last name'),
                    expands: false,
                    decoration: const InputDecoration(labelText: MyText.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// username
            TextFormField(
              controller: controller.userName,
              validator: (value) => MyValidator.validateEmptyText(value, 'User Name'),
              decoration: const InputDecoration(labelText: MyText.userName, prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// email
            TextFormField(
              controller: controller.email,
              validator: (value) => MyValidator.validateEmail(value),
              decoration: const InputDecoration(labelText: MyText.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// phone number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => MyValidator.validatePhoneNumber(value),
              decoration: const InputDecoration(labelText: MyText.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: MySizes.spaceBtwInputFields),
            /// password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => MyValidator.validatePassword(value),
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
            const SizedBox(height: MySizes.spaceBtwSections),
            /// terms and conditions checkbox
            const MyTermsAndConditionsCheckbox(),
            const SizedBox(height: MySizes.spaceBtwSections),
            /// sign up button
            SizedBox(width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
                    child: const Text(MyText.createAccount)
                )
            ),
            const SizedBox(height: MySizes.spaceBtwSections),
          ],
        )
    );
  }
}

