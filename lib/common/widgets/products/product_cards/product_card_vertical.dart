import 'package:e_commerce_app/common/styles/shadows.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../utils/constants/colors.dart';
import '../../icons/my_circular_icon.dart';
import '../../prices/product_price_text.dart';
import '../../texts/my_brand_title_text_with_verified.dart';
import '../../texts/product_title_text.dart';

class MyProductCardVertical extends StatelessWidget {
  const MyProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final dark = MyHelperFunctions.isDarkMode(context);

    /// container with side paddings, color, edges, radius, and shadow.
    return GestureDetector(
      onTap: () => Get.to(ProductDetailScreen(product: product,)),
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
              width: 175,
              padding: const EdgeInsets.all(MySizes.sm),
              backGround: dark ? MyColors.dark : MyColors.light,
              child: Stack(
                children: [
                  /// thumbnail image
                  Center(child: MyRoundImage(imageUrl: product.thumbnail, applyImageRadius: true, height: 175, isNetworkingImage: true,)),
                  /// sale tag
                  if (controller.calculateSalePercentage(product.price, product.salePrice) != null)
                      Positioned(
                        top: 8,
                          left: 0,
                          child: MyCircularContainer(
                            radius: MySizes.sm,
                            backGround: MyColors.secondary.withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(horizontal: MySizes.sm, vertical: MySizes.xs),
                            child: Text(
                                ('${controller.calculateSalePercentage(product.price, product.salePrice)}%') ?? '',
                                style: Theme.of(context).textTheme.labelLarge!.apply(color: MyColors.black)),
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
            Padding(
              padding: const EdgeInsets.only(left: MySizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyProductTitleText(title: product.title, smallSize: true,),
                    const SizedBox(height: MySizes.spaceBtwItems / 2,),
                    MyBrandTitleWithVerifiedIcon(title: product.brand!.name,),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Flexible(
                  child: Column(
                    children: [

                      if (product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: MySizes.sm),
                          child: Text(
                            '\$$product.price.toString()',
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough)
                          ),
                        ),

                      /// Price, show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: MySizes.sm),
                        child: MyProductPriceText(price: controller.getProductPrice(product),),
                      ),

                    ],
                  ),
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








