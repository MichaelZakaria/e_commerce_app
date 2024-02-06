import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brand_card/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: Text('Brand'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [
              /// heading
              const MySectionHeading(title: 'Brands', showActionButton: false,),
              const SizedBox(height: MySizes.spaceBtwItems,),

              /// brands
              MyGridLayout(
                  itemCount: 8,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => MyBrandCard(showBorder: true, onTap: () => Get.to(const BrandProducts()),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
