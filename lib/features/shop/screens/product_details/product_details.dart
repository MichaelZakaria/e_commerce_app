import 'package:e_commerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_detail_image_sider.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAddToCart(product: product,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - product image slider
            MyProductImageSlider(product: product),
            /// 2 - product details
            Padding(
              padding: const EdgeInsets.only(right: MySizes.defaultSpaces, bottom: MySizes.defaultSpaces, left: MySizes.defaultSpaces),
              child: Column(
                children: [
                  /// ratings and share button
                  const MyRatingAndShare(),
                  /// price, title, stock & brand
                  MyProductMetaData(product: product),
                  /// attributes
                  if (product.productType == ProductType.variable.toString()) MyProductAttributes(product: product),
                  if (product.productType == ProductType.variable.toString()) const SizedBox(height: MySizes.spaceBtwSections,),
                  /// checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {  }, child: const Text('Checkout'),),),
                  const SizedBox(height: MySizes.spaceBtwSections,),
                  /// Description
                  const MySectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: MySizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? 'No description found',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  /// reviews
                  const Divider(),
                  const SizedBox(height: MySizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MySectionHeading(title: 'Reviews (199)', showActionButton: false,),
                      IconButton(onPressed: () => Get.to(const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18,)),
                    ],
                  ),
                  const SizedBox(height: MySizes.spaceBtwItems),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}




