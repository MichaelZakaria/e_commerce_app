import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpaces),

          /// items in cart
          child: MyCartItems(),
        ),
      ),

      /// checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpaces),
        child: ElevatedButton(
          onPressed: () => Get.to(const CheckOutScreen()),
          child: const Text('Checkout \$2200.99'),
        ),
      ),
    );
  }
}
