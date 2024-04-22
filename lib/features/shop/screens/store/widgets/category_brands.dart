import 'package:e_commerce_app/common/widgets/brand_card/brand_show_case.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/category_model.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/cupertino.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands(
      this.category, {super.key}
      );

  final CategoryModel category;
  
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {

        /// Handle Loaders, no record or error messages
        final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
        if (widget != null) return widget;

        /// Record is found
        final brands = snapshot.data!;

        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {

                    /// Handle Loaders, no record or error messages
                    final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot);
                    if (widget != null) return widget;

                    /// Record is found
                    final products = snapshot.data!;

                    return MyBrandShowCase(brand: brand, images: products.map((product) => product.thumbnail).toList());
                  }
              );
            }
        );
      },
    );
  }
}
