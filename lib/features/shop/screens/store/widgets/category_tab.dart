import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/features/shop/screens/store/widgets/category_brands.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/brand_card/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return ListView(
      /// ############################333333333333333333333333333333333333333333333333333
      //shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      /// ############################333333333333333333333333333333333333333333333333333
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
             children: [
               /// brands
               CategoryBrands(category),
               const SizedBox(height: MySizes.spaceBtwItems,),
               /// products
               FutureBuilder(
                 future: controller.getCategoryProducts(categoryId: category.id),
                 builder: (context, snapshot) {

                   /// Handle Loaders, no record or error messages
                   final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot, nothingFound: const Text(''), loader: const SizedBox(height: 0,));
                   if (widget != null) return widget;

                   /// Record is found
                   final products = snapshot.data!;

                   return Column(
                     children: [
                       MySectionHeading(
                           title: 'You might like', 
                           onPressed: () => Get.to(
                               AllProducts(
                                   title: category.name,
                                   futureMethod: controller.getCategoryProducts(categoryId: category.id, limit: -1),
                               )
                           ) 
                       ),
                       const SizedBox(height: MySizes.spaceBtwItems,),
                       MyGridLayout(itemCount: products.length, itemBuilder: (_,index) => MyProductCardVertical(product: products[index],)),
                       const SizedBox(height: MySizes.spaceBtwSections,)
                     ],
                   );
                 },
               )
             ],
          ),
        ),
      ]
    );
  }
}
