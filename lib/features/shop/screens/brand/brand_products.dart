import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brand_card/brand_card.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: Text('Nike'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [
              /// brand detail
              MyBrandCard(showBorder: true),
              SizedBox(height: MySizes.spaceBtwSections,),

              MySortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
