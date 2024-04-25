import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      appBar: const MyAppBar(
        showBackArrow: true,
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                  validator: (value) => MyValidator.validateEmptyText(value, 'Name'),
                  controller: controller.name,
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),
                  validator: (value) => MyValidator.validatePhoneNumber(value),
                  controller: controller.phoneNumber,
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),
                      validator: (value) => MyValidator.validateEmptyText(value, 'Street'),
                      controller: controller.street,
                    )),
                    const SizedBox(width: MySizes.spaceBtwInputFields,),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),
                      validator: (value) => MyValidator.validateEmptyText(value, 'PostalCode'),
                      controller: controller.postalCode,
                    )),
                  ],
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),
                      validator: (value) => MyValidator.validateEmptyText(value, 'City'),
                      controller: controller.city,
                    )),
                    const SizedBox(width: MySizes.spaceBtwInputFields,),
                    Expanded(child: TextFormField(
                      decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),
                      validator: (value) => MyValidator.validateEmptyText(value, 'State'),
                      controller: controller.state,
                    )),
                  ],
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                TextFormField(
                  decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                  validator: (value) => MyValidator.validateEmptyText(value, 'Country'),
                  controller: controller.country,
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.addNewAddress(), child: const Text('Save'),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}