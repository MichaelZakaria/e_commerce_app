import 'package:e_commerce_app/features/shop/controllers/product/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/my_circular_icon.dart';

class MyFavouriteIcon extends StatelessWidget {
  const MyFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());

    return Obx(
            () => MyCircularIcon(
              icon: controller.isFavourite(productId) ?  Iconsax.heart5 : Iconsax.heart,
              color: controller.isFavourite(productId) ? MyColors.error : null,
              width: 40,
              height: 40,
              onPressed: () => controller.toggleFavouriteProduct(productId),
            )
    );
  }
}
