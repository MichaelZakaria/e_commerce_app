import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/circular_container.dart';
import 'brand_card.dart';

class MyBrandShowCase extends StatelessWidget {
  const MyBrandShowCase({
    super.key, required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return MyCircularContainer(
      showBorder: true,
      borderColor: MyColors.darkGrey,
      backGround: Colors.transparent,
      padding: const EdgeInsets.all(MySizes.md),
      margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
      child: Column(
          children: [
            /// brand with product count
            const MyBrandCard(showBorder: false),
            const SizedBox(height: MySizes.spaceBtwItems,),
            /// brand top 3 product images
            Row(
              children: images.map((image) => brandTopProductImageWidget(image,context)).toList(),
            ),
          ]
      ),
    );
  }
}

Widget brandTopProductImageWidget (String image, context) {
  return Expanded(
    child: MyCircularContainer(
      height: 100,
      backGround: MyHelperFunctions.isDarkMode(context) ? MyColors.darkGrey : MyColors.light,
      margin: const EdgeInsets.only(right: MySizes.sm),
      padding:const EdgeInsets.all(MySizes.sm),
      child: Image(fit: BoxFit.contain, image: AssetImage(image),),
    ),
  );
}