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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// image
        MyRoundImage(
          imageUrl: MyImages.iphone15ProMaxNaturalTitanium,
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
              const MyBrandTitleWithVerifiedIcon(title: 'Nike'),
              const MyProductTitleText(title: 'Iphone 15 Pro Max', maxLines: 1,),
              /// attributes
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Natural Titanium ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Storage ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: '512 GB ', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}