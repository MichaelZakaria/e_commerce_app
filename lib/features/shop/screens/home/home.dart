import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            const MyPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// appbar
                  MyHomeAppbar(),
                  SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),
                  /// searchbar
                  MySearchContainer(text: 'Search in Store'),
                  SizedBox(
                    height: MySizes.spaceBtwSections,
                  ),
                  /// categories
                  Padding(
                    padding: EdgeInsets.only(left: MySizes.defaultSpaces),
                    child: Column(
                      children: [
                        /// section heading
                        MySectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: MySizes.spaceBtwItems,
                        ),
                        /// the categories
                        MyHomeCategories(),
                        SizedBox(height: MySizes.spaceBtwSections,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            /// body
            Padding(
                padding: const EdgeInsets.all(MySizes.defaultSpaces),
                child: Column(
                  children: [
                    /// promo slider
                    const MyPromoSlider(banners: [MyImages.darkAppLogo, MyImages.darkAppLogo, MyImages.darkAppLogo],),
                    const SizedBox(
                      height: MySizes.spaceBtwSections,
                    ),
                    /// heading
                    MySectionHeading(title: 'Popular Products', onPressed: (){},),
                    const SizedBox(
                      height: MySizes.spaceBtwSections,
                    ),
                    /// popular products
                    MyGridLayout(itemCount: 6, itemBuilder: (BuildContext , int ) => const MyProductCardVertical(),),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}


