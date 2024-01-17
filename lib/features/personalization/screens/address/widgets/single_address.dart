import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MySingleAddress extends StatelessWidget {
  const MySingleAddress({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return MyCircularContainer(
      showBorder: true,
      padding: const EdgeInsets.all(MySizes.md),
      width: double.infinity,
      backGround: isSelected ? MyColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: isSelected ? Colors.transparent : dark ? MyColors.darkerGrey : MyColors.grey,
      margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
              right: 5,
              top: 0,
              child: Icon(
                isSelected ? Iconsax.tick_circle5 : null,
                color: isSelected ? dark ? MyColors.light : MyColors.dark : null,
              ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Michael', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: MySizes.sm / 2,),
              const Text('012 534 7896', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: MySizes.sm / 2,),
              const Text('132, My Street, Big-town BG23 4YZ England' , softWrap: true,)
            ],
          )
        ],
      ),
    );
  }
}
