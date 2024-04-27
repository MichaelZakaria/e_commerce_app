import 'package:e_commerce_app/features/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/my_rounded_image.dart';
import '../../texts/my_brand_title_text_with_verified.dart';
import '../../texts/product_title_text.dart';

class MyCartItem extends StatelessWidget {
  const MyCartItem({
    super.key, required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// image
        MyRoundImage(
          imageUrl: cartItem.image ?? '',
          isNetworkingImage: true,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(MySizes.sm),
          backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.darkerGrey : MyColors.light,
        ),
        const SizedBox(width: MySizes.spaceBtwItems,),
        /// title, price & size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              MyProductTitleText(title: cartItem.title, maxLines: 1,),
              /// attributes
              Text.rich(
                  TextSpan(
                      children: (cartItem.selectedVariation ?? {})
                          .entries
                          .map((item) => TextSpan(
                              children: [
                                TextSpan(text: item.key, style: Theme.of(context).textTheme.bodySmall),
                                TextSpan(text: item.value, style: Theme.of(context).textTheme.bodyLarge),
                              ]
                      )) .toList()
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}