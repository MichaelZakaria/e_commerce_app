import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/features/personalization/controllers/address_controller.dart';
import 'package:e_commerce_app/features/personalization/models/address_model.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MySingleAddress extends StatelessWidget {
  const MySingleAddress({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = MyHelperFunctions.isDarkMode(context);

    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;

        return InkWell(
          onTap: onTap,
          child: MyCircularContainer(
            showBorder: true,
            padding: const EdgeInsets.all(MySizes.md),
            width: double.infinity,
            backGround: selectedAddress ? MyColors.primary.withOpacity(0.5) : Colors.transparent,
            borderColor: selectedAddress ? Colors.transparent : dark ? MyColors.darkerGrey : MyColors.grey,
            margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 0,
                  child: Icon(
                    selectedAddress ? Iconsax.tick_circle5 : null,
                    color: selectedAddress ? dark ? MyColors.light : MyColors.dark : null,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge,),
                    const SizedBox(height: MySizes.sm / 2,),
                    Text(address.phoneNumber, maxLines: 1, overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: MySizes.sm / 2,),
                    Text(address.toString() , softWrap: true,)
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
