import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/update_name_controller.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      /// Custom Appbar
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpaces),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              'Use real name for verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            /// Text field and button
            Form(
              key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => MyValidator.validateEmptyText(value, 'First name'),
                      expands: false,
                      decoration: const InputDecoration(labelText: MyText.firstName, prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(height: MySizes.spaceBtwInputFields,),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => MyValidator.validateEmptyText(value, 'Last name'),
                      expands: false,
                      decoration: const InputDecoration(labelText: MyText.lastName, prefixIcon: Icon(Iconsax.user)),
                    ),
                  ],
                ),
            ),
            const SizedBox(height: MySizes.spaceBtwSections),
            
            /// save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
