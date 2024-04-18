import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../custom_shapes/containers/circular_container.dart';
import '../images/my_circular_image.dart';
import '../texts/my_brand_title_text_with_verified.dart';

class MyBrandCard extends StatelessWidget {
  const MyBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyCircularContainer(
        //padding: const EdgeInsets.all(MySizes.sm),
        showBorder: showBorder,
        backGround: Colors.transparent,
        child: Row(
          children: [
            /// icon
            Flexible(child: MuCircularImage(image: brand.image, isNetworkImage: true,)),
            //const SizedBox(width: MySizes.spaceBtwItems / 2),
            /// text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 MyBrandTitleWithVerifiedIcon(title: brand.name, brandTextSize: TextSizes.medium,),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}