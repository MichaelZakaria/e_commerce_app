import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/prices/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/my_brand_title_text_with_verified.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/my_circular_icon.dart';

class MyProductCardHorizontal extends StatelessWidget {
  const MyProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = MyHelperFunctions.isDarkMode(context);

    return GestureDetector(
        onTap: () => Get.to( ProductDetailScreen(product: ProductModel.empty(),)),
        child: Container(
            width: 310,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MySizes.productImageRadius),
              color: dark ? MyColors.darkerGrey : MyColors.softGrey,
            ),
          child: Row(
            children: [
              /// thumbnail
              MyCircularContainer(
                height: 120,
                padding: const EdgeInsets.all(MySizes.sm),
                backGround: dark ? MyColors.dark : MyColors.light,
                child: Stack(
                  children: [
                    /// thumbnail image
                    const SizedBox(
                      height: 120,
                      width: 120,
                      child: MyRoundImage(imageUrl: MyImages.iphone15ProMaxNaturalTitanium, applyImageRadius: true,),
                    ),
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

              /// details
              SizedBox(
                width: 172,
                child: Padding(
                  padding: const EdgeInsets.only(top: MySizes.sm, left: MySizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyProductTitleText(title: 'Iphone 15 Pro Max', smallSize: true,),
                          SizedBox(height: MySizes.spaceBtwItems / 2,),
                          MyBrandTitleWithVerifiedIcon(title: 'Apple'),
                        ],
                      ),

                      const Spacer(),

                      Row(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        children: [
                          /// pricing
                          const Flexible(child: MyProductPriceText(price: '1199.99')),

                          /// add to cart
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
              )
            ],
          ),
        )
    );
  }
}
