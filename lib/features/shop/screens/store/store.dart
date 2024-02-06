import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/category_controller.dart';
import 'package:e_commerce_app/features/shop/screens/all_brands/all_brands.dart';
import 'package:e_commerce_app/features/shop/screens/store/category_tab.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brand_card/brand_card.dart';
import '../cart/cart.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: MyAppBar(
          title: Text(
            'Store',
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
          actions: [
            MyCartCounterIcon(
              onPressed: () => Get.to(const CartScreen()),
            )
          ],
        ),



        body: NestedScrollView(
          /// header
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: MyHelperFunctions.isDarkMode(context) ? MyColors.black : MyColors.white,
                expandedHeight: 440,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(MySizes.defaultSpaces),
                  child: ListView(
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    //shrinkWrap: true,
                    //physics: const NeverScrollableScrollPhysics(),
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    /// ############################333333333333333333333333333333333333333333333333333
                    children: [
                      /// search bar
                      const SizedBox(height: MySizes.spaceBtwItems,),
                      const MySearchContainer(text: 'Search in Store', showBorder: true, showBackGround: false, padding: EdgeInsets.zero),
                      const SizedBox(height: MySizes.spaceBtwSections,),
                      /// featured brands
                      MySectionHeading(title: 'Featured Brands', onPressed: () => Get.to(const AllBrandsScreen()),),
                      const SizedBox(height: MySizes.spaceBtwItems / 1.5),
                      /// brands grid
                      MyGridLayout(itemCount: 4, mainAxisExtent: 80, itemBuilder: (_, index) {
                      return  const MyBrandCard(showBorder: true,) ;
                      })
                    ],
                  ),
                ),
                /// tabs
                bottom: MyTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              )
            ];
          },
          /// body
          body: TabBarView(
            children: categories.map((category) => MyCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}










