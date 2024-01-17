import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: Text('Phones'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [
              /// banner
              const MyRoundImage(width: double.infinity, imageUrl: MyImages.phonesPromoBanner,),
              const SizedBox(height: MySizes.spaceBtwSections,),

              /// sub-categories
              Column(
                children: [
                  /// heading
                  MySectionHeading(title: 'Apple', onPressed: () {},),
                  const SizedBox(height: MySizes.spaceBtwItems / 2,),

                  /// horizontal product card
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemBuilder: (context,index) => const MyProductCardHorizontal(),
                      separatorBuilder: (context,index) => const SizedBox(width: MySizes.spaceBtwItems,),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: MySizes.spaceBtwSections),

              /// sub-categories
              Column(
                children: [
                  /// heading
                  MySectionHeading(title: 'Apple', onPressed: () {},),
                  const SizedBox(height: MySizes.spaceBtwItems / 2,),

                  /// horizontal product card
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemBuilder: (context,index) => const MyProductCardHorizontal(),
                      separatorBuilder: (context,index) => const SizedBox(width: MySizes.spaceBtwItems,),
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
