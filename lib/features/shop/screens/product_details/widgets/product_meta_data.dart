import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/prices/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/my_brand_title_text_with_verified.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MyProductMetaData extends StatelessWidget {
  const MyProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// price and sale price
        Row(
          /// sale tag
          children: [
            MyCircularContainer(
              radius: MySizes.sm,
              backGround: MyColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: MySizes.sm, vertical: MySizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: MyColors.black)),
            ),
            const SizedBox(width: MySizes.spaceBtwItems,),
            /// price
            Text('\$1299.99', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: MySizes.spaceBtwItems,),
            const MyProductPriceText(price: '1199.99', isLarge: true,)
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 1.5),
        /// title
        const MyProductTitleText(title: 'Iphone 15 Pro Max'),
        const SizedBox(height: MySizes.spaceBtwItems / 1.5),
        /// stock status
        Row(
          children: [
            const MyProductTitleText(title: 'Status'),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 1.5,),
        /// brand
        Row(
          children: [
            MyRoundImage(imageUrl: MyImages.apple, width: 32, height: 32, backgroundColor: dark ? MyColors.white : MyColors.grey),
            const SizedBox(width: MySizes.spaceBtwItems / 1.5,),
            const MyBrandTitleWithVerifiedIcon(title: 'Apple', brandTextSize: TextSizes.medium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 1.5,)
      ],
    );
  }
}
