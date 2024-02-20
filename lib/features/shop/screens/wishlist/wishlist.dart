import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/icons/my_circular_icon.dart';
import 'package:e_commerce_app/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce_app/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/product_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
       title: Text('WishList', style: Theme.of(context).textTheme.headlineMedium,),
       actions: [
         MyCircularIcon(icon: Iconsax.add, onPressed: () => const HomeScreen(),)
       ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [
              MyGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => MyProductCardVertical(product: ProductModel.empty()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
