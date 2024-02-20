import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/brand_card/brand_show_case.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class MyCategoryTab extends StatelessWidget {
  const MyCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      /// ############################333333333333333333333333333333333333333333333333333
      //shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      /// ############################333333333333333333333333333333333333333333333333333
      /// ############################333333333333333333333333333333333333333333333333333
      /// ############################333333333333333333333333333333333333333333333333333
      /// ############################333333333333333333333333333333333333333333333333333
      /// ############################333333333333333333333333333333333333333333333333333
      /// ############################333333333333333333333333333333333333333333333333333
      /// ############################333333333333333333333333333333333333333333333333333
      /// ############################333333333333333333333333333333333333333333333333333
      children: [
        Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
             children: [
               /// brands
               const MyBrandShowCase(images: [MyImages.iphone15ProMaxNaturalTitanium, MyImages.iphone15ProMaxNaturalTitanium, MyImages.iphone15ProMaxNaturalTitanium,],),
               const MyBrandShowCase(images: [MyImages.iphone15ProMaxNaturalTitanium, MyImages.iphone15ProMaxNaturalTitanium, MyImages.iphone15ProMaxNaturalTitanium],),
               const SizedBox(height: MySizes.spaceBtwItems,),
               /// products
               MySectionHeading(title: 'You might like', onPressed: () {},),
               const SizedBox(height: MySizes.spaceBtwItems,),

               MyGridLayout(itemCount: 4, itemBuilder: (_,index) => MyProductCardVertical(product: ProductModel.empty(),)),
               const SizedBox(height: MySizes.spaceBtwSections,)
             ],
          ),
        ),
      ]
    );
  }
}
