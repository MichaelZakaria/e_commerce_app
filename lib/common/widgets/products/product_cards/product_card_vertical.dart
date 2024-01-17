import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/my_circular_icon.dart';
import '../../prices/product_price_text.dart';
import '../../texts/my_brand_title_text_with_verified.dart';
import '../../texts/product_title_text.dart';

class MyProductCardVertical extends StatelessWidget {
  const MyProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    /// container with side paddings, color, edges, radius, and shadow.
    return GestureDetector(
      onTap: () => Get.to(const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [MyShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MySizes.productImageRadius),
          color: dark ? MyColors.darkerGrey : MyColors.softGrey,
        ),
        child: Column(
          children: [
            /// thumbnail, wishlist button, discount Tag
            MyCircularContainer(
              height: 175,
              padding: const EdgeInsets.all(MySizes.sm),
              backGround: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  /// thumbnail image
                  const MyRoundImage(imageUrl: MyImages.iphone15ProMaxNaturalTitanium, applyImageRadius: true, height: 175,),
                  /// sale tag
                  Positioned(
                    top: 8,
                      left: 0,
                      child: MyCircularContainer(
                        radius: MySizes.sm,
                        backGround: MyColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(horizontal: MySizes.sm, vertical: MySizes.xs),
                        child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: MyColors.black)),
                        ),
                      ),
                  /// favourite icon button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: MyCircularIcon(icon: Iconsax.heart5, color: Colors.red, width: 40, height: 40,)
                  ),
                ],
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwItems / 2,),
            /// details
            const Padding(
              padding: EdgeInsets.only(left: MySizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyProductTitleText(title: 'Iphone 15 pro max', smallSize: true,),
                  SizedBox(height: MySizes.spaceBtwItems / 2,),
                  MyBrandTitleWithVerifiedIcon(title: 'Apple',),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                const Padding(
                  padding: EdgeInsets.only(left: MySizes.sm),
                  child: MyProductPriceText(price: '1199.99', maxLines: 1,),
                ),
                ///add to cart
                Container(
                  decoration: const BoxDecoration(
                      color: MyColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MySizes.cardRadiusMd),
                        bottomRight: Radius.circular(MySizes.productImageRadius),
                      )
                  ),
                  child: const SizedBox(
                    width: MySizes.iconLg * 1.2,
                    height: MySizes.iconLg * 1.2,
                    child: Center(child: Icon(Iconsax.add, color: MyColors.white,),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}








