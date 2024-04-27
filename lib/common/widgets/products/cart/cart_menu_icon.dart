import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';

class MyCartCounterIcon extends StatelessWidget {
  const MyCartCounterIcon({
    super.key,
    this.iconColor, this.counterBgColor, this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    final dark =MyHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(const CartScreen()),
            icon: Icon(Iconsax.shopping_bag, color: iconColor ?? (dark ? MyColors.light : MyColors.dark))),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: counterBgColor ?? (dark ? MyColors.light : MyColors.dark),
                borderRadius: BorderRadius.circular(18)
            ),
            child: Center(
                child: Obx(
                  () => Text(
                      cartController.noOfCartItems.value.toString(),
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                          color:  counterTextColor ?? (dark ? MyColors.dark : MyColors.light),
                          fontSizeFactor: 0.8
                      )
                  ),
                )
            ),
          ),
        )
      ],
    );
  }
}