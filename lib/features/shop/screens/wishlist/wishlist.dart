import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/controllers/product/favourite_controller.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;

    return Scaffold(
      appBar: MyAppBar(
       title: Text('WishList', style: Theme.of(context).textTheme.headlineMedium,),
       // actions: [
       //   MyCircularIcon(icon: Iconsax.add, onPressed: () => const HomeScreen(),)
       // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [

              /// Products Grid
              Obx(
                () => FutureBuilder(
                    future: controller.favouriteProducts(),
                    builder: (context, snapshot) {


                      // Nothing found widget
                      final emptyWidget = MyAnimationLoaderWidget(
                          text: 'Whoops! Wishlist is Empty...',
                          animation: MyImages.nothingFoundLoader,
                          showAction: true,
                          actionText: 'Let\'s add some',
                          onActionPressed: () {
                            NavigationController.instance.selectedIndex.value = 0;
                          } ,
                      );
                      final widget = MyCloudHelperFunction.checkMultipleRecordState(snapshot: snapshot, nothingFound: emptyWidget);
                      if(widget != null) return widget;

                      final productList = snapshot.data!;
                      return MyGridLayout(
                        itemCount: productList.length,
                        itemBuilder: (_, index) => MyProductCardVertical(product:productList[index]),
                      );
                    }
                 )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
