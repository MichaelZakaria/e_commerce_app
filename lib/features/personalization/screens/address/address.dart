import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/address/add_new_address.dart';
import 'package:e_commerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(const AddNewAddressScreen()),
        backgroundColor: MyColors.primary,
        child: const Icon(Iconsax.add, color: MyColors.white,),
      ),
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Obx(
              () => FutureBuilder(
                // Use Key to trigger a refresh
                key: Key(controller.refreshData.value.toString()),

                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {

                  // Handle loader, No record or error message
                  final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
                  if (widget != null) return widget;

                  // Record is found
                  final addresses = snapshot.data!;

                  return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: addresses.length,
                      itemBuilder: (_,index) {
                        return MySingleAddress(address: addresses[index], onTap: () => controller.selectAddress(addresses[index]),);
                      }
                  );
                },
            ),
          ),
        ),
      ),
    );
  }
}
