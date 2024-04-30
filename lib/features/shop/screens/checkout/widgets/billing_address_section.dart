import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../personalization/controllers/address_controller.dart';

class MyBillingAddressSection extends StatelessWidget {
  const MyBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Obx(
      () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () => controller.selectNewAddressPopup(context)),
            controller.selectedAddress.value.id.isNotEmpty
                ? Column(
                    children: [
                      Text(controller.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge,),
                      const SizedBox(height: MySizes.spaceBtwItems / 2,),
                      Row(
                        children: [
                          const Icon(Icons.phone, color: Colors.grey, size: 16,),
                          const SizedBox(width: MySizes.spaceBtwItems,),
                          Expanded(child: Text(controller.selectedAddress.value.phoneNumber, style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
                        ],
                      ),
                      const SizedBox(height: MySizes.spaceBtwItems / 2,),
                      Row(
                        children: [
                          const Icon(Icons.location_history, color: Colors.grey, size: 16,),
                          const SizedBox(width: MySizes.spaceBtwItems,),
                          Expanded(child: Text(controller.selectedAddress.value.toString(), style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
                        ],
                      ),
              ],
            )
                : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium,)
          ],
      ),
    );
  }
}
