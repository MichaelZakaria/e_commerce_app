import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/brand_card/brand_card.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce_app/features/shop/models/brand_model.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

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
              Obx(
                      () {
                    if(controller.isLoading.value) return const Center(child: CircularProgressIndicator(),);

                    if (controller.allBrands.isEmpty) {
                      return Center(
                        child: Text('No Data Found1', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
                      );
                    }

                    return MyGridLayout(
                        itemCount: controller.allBrands.length,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          final brand = controller.allBrands[index];
                          return MyBrandCard(
                            showBorder: true, 
                            brand: brand,
                            onTap: () => Get.to(BrandProducts(brand: brand,)),
                          );
                        }
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
