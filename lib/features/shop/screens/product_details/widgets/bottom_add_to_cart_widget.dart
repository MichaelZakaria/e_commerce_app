import 'package:e_commerce_app/common/widgets/icons/my_circular_icon.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../controllers/product/cart_controller.dart';
import '../../../models/product_model.dart';

class MyBottomAddToCart extends StatelessWidget {
  const MyBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    controller.updateAlreadyAddedProductCount(product);

    final dark = MyHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MySizes.defaultSpaces, vertical: MySizes.defaultSpaces / 2),
      decoration: BoxDecoration(
        color: dark ? MyColors.darkerGrey : MyColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(MySizes.cardRadiusLg),
          topRight: Radius.circular(MySizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                  MyCircularIcon(
                    icon: Iconsax.minus,
                    backgroundColor: MyColors.dark,
                    width: 40,
                    height: 40,
                    color: MyColors.white,
                    onPressed: () => controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart -= 1 ,
                  ),
                  const SizedBox(width: MySizes.spaceBtwItems,),
                  Obx(() => Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall,)),
                  const SizedBox(width: MySizes.spaceBtwItems,),
                  MyCircularIcon(
                    icon: Iconsax.add,
                    backgroundColor: MyColors.realBlack,
                    width: 40,
                    height: 40,
                    color: MyColors.white,
                    onPressed: () => controller.productQuantityInCart.value += 1,
                  ),
                ],
              ),
            ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(MySizes.md),
                  backgroundColor: MyColors.black,
                  side: const BorderSide(color: MyColors.realBlack)
                ),
                child: Text('Add to Cart', style: TextStyle(
                    color: controller.productQuantityInCart.value < 1 ? Colors.grey[600] :  Colors.white),
                )
            ),
          ],
        ),
      ),
    );
  }
}
