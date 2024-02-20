import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/prices/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/my_brand_title_text_with_verified.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MyProductMetaData extends StatelessWidget {
  const MyProductMetaData({super.key, required this.product});
  
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
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
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: MyColors.black)),
            ),
            const SizedBox(width: MySizes.spaceBtwItems),
            /// price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text(product.price.toString(), style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(width: MySizes.spaceBtwItems,),
            MyProductPriceText(price: controller.getProductPrice(product), isLarge: true,)
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 1.5),
        /// title
        MyProductTitleText(title: product.title),
        const SizedBox(height: MySizes.spaceBtwItems / 1.5),
        /// stock status
        Row(
          children: [
            const MyProductTitleText(title: 'Status'),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 1.5,),
        /// brand
        Row(
          children: [
            MyRoundImage(imageUrl: product.brand  != null ? product.brand!.image : '', width: 32, height: 32, backgroundColor: dark ? MyColors.white : MyColors.grey, isNetworkingImage: true,),
            const SizedBox(width: MySizes.spaceBtwItems / 1.5,),
           MyBrandTitleWithVerifiedIcon(title: product.brand  != null ? product.brand!.name : '', brandTextSize: TextSizes.medium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 1.5,)
      ],
    );
  }
}
