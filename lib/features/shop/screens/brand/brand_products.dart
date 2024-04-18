import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brand_card/brand_card.dart';
import 'package:e_commerce_app/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: MyAppBar(title: Text(brand.name),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [
              /// brand detail
              MyBrandCard(showBorder: true, brand: brand),
              const SizedBox(height: MySizes.spaceBtwSections,),

              FutureBuilder(
                future: controller.getBrandProducts(brand.id),
                builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {

                  final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
                  if (widget != null) return widget;

                  final brandProducts = snapshot.data!;
                  return MySortableProducts(products: brandProducts);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
