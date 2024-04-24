import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;

    return Scaffold(
      appBar: MyAppBar(title: Text(category.name), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [
              /// banner
              const MyRoundImage(width: double.infinity, imageUrl: MyImages.salePromoBanner, applyImageRadius: true,),
              const SizedBox(height: MySizes.spaceBtwSections,),

              /// sub-categories
              FutureBuilder(
                future: controller.getSubCategories(category.id),
                builder: (context, snapshot) {

                  // Handle loader, No record or error message
                  final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
                  if (widget != null) return widget;

                  // Record is found
                  final subCategories = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: subCategories.length,
                    itemBuilder: (_,index) {

                      final subCategory = subCategories[index];
                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context,snapshot) {

                          // Handle loader, No record or error message
                          final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
                          if (widget != null) return widget;

                          // Record is found
                          final subCategoryProducts = snapshot.data!;

                          return Column(
                            children: [
                              /// heading
                              MySectionHeading(
                                  title: subCategory.name,
                                  onPressed: () => Get.to(
                                      AllProducts(
                                        title: subCategory.name,
                                        futureMethod: controller.getCategoryProducts(categoryId: subCategory.id, limit: -1),
                                      )
                                  )
                              ),
                              const SizedBox(height: MySizes.spaceBtwItems / 2,),

                              /// horizontal product card
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemBuilder: (context,index) => MyProductCardHorizontal(product: subCategoryProducts[index]),
                                  separatorBuilder: (context,index) => const SizedBox(width: MySizes.spaceBtwItems,),
                                  itemCount: subCategoryProducts.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),

                              const SizedBox(height: MySizes.spaceBtwSections),
                            ],
                          );
                        },
                        
                      );
                    }
                  );
                },
              ),



              // /// sub-categories
              // Column(
              //   children: [
              //     /// heading
              //     MySectionHeading(title: 'Apple', onPressed: () {},),
              //     const SizedBox(height: MySizes.spaceBtwItems / 2,),
              //
              //     /// horizontal product card
              //     SizedBox(
              //       height: 120,
              //       child: ListView.separated(
              //         itemBuilder: (context,index) => const MyProductCardHorizontal(),
              //         separatorBuilder: (context,index) => const SizedBox(width: MySizes.spaceBtwItems,),
              //         itemCount: 4,
              //         scrollDirection: Axis.horizontal,
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
