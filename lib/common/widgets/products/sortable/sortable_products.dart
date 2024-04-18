import 'package:e_commerce_app/features/shop/controllers/product/all_products_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../product_cards/product_card_vertical.dart';

class MySortableProducts extends StatelessWidget {
  const MySortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // controller to manage product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        /// dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          items: ['Name', 'Higher Price', 'LowerPrice', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {
            // Sort products based on selected option
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(height: MySizes.spaceBtwSections,),
        /// products
        Obx( () => MyGridLayout(itemCount: controller.products.length, itemBuilder: (_,index) => MyProductCardVertical(product: controller.products[index],)))
      ],
    );
  }
}