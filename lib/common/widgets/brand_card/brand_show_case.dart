import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/containers/circular_container.dart';
import 'brand_card.dart';

class MyBrandShowCase extends StatelessWidget {
  const MyBrandShowCase({
    super.key, required this.images, required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: MyCircularContainer(
        showBorder: true,
        borderColor: MyColors.darkGrey,
        backGround: Colors.transparent,
        padding: const EdgeInsets.all(MySizes.md),
        margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
        child: Column(
            children: [
              /// brand with product count
              MyBrandCard(showBorder: false, brand: brand),
              const SizedBox(height: MySizes.spaceBtwItems,),
              /// brand top 3 product images
              Row(
                children: images.map((image) => brandTopProductImageWidget(image,context)).toList(),
              ),
            ]
        ),
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
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(MySizes.sm),
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error)
          ),
        ),
      )
    ),
  );
}