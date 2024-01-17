import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/curved_edge/curved_edges_widget.dart';
import 'package:e_commerce_app/common/widgets/icons/my_circular_icon.dart';
import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_detail_image_sider.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/widgets/rating_share.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - product image slider
            MyProductImageSlider(),
            /// 2 - product details
            Padding(
              padding: EdgeInsets.only(right: MySizes.defaultSpaces, bottom: MySizes.defaultSpaces, left: MySizes.defaultSpaces),
              child: Column(
                children: [
                  /// ratings and share button
                  MyRatingAndShare(),
                  /// price, title, stock & brand
                  MyProductMetaData(),
                  /// attributes
                  MyProductAttributes(),
                  /// checkout button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {  }, child: const Text('Checkout'),),),
                  const SizedBox(height: MySizes.spaceBtwSections,),
                  /// Description
                  const MySectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: MySizes.spaceBtwItems),
                  const ReadMoreText(
                    'FORGED IN TITANIUM — iPhone 15 Pro Max has a strong and light aerospace-grade titanium design with a textured matt-glass back. It also features a super-tough Ceramic Shield front. And it’s splash, water and dust resistant. ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
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




