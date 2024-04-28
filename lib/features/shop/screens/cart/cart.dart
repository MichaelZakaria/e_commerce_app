import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme
            .of(context)
            .textTheme
            .headlineSmall),
      ),
      body: Obx(
              () {
            /// Nothing found Widget
            final emptyWidget = MyAnimationLoaderWidget(
              text: 'Whoops! cart is Empty',
              animation: MyImages.nothingFoundLoader,
              showAction: true,
              actionText: 'Let\'s fill it',
              onActionPressed: () => Get.off(() => const NavigationMenu()),
            );

            return controller.cartItems.isEmpty 
                ? emptyWidget 
                : const SingleChildScrollView(
                  child: Padding(
                                padding: EdgeInsets.all(MySizes.defaultSpaces),
                  
                                /// items in cart
                                child: MyCartItems(),
                              ),
                );
          }
      ),

      /// checkout button
      bottomNavigationBar: Obx(
        () => SizedBox(
          child: controller.cartItems.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(MySizes.defaultSpaces),
                  child: ElevatedButton(
                    onPressed: () => Get.to(const CheckOutScreen()),
                    child: Obx(() => Text('Checkout \$${controller.totalCartPrice.value.toStringAsFixed(2)}')),
            ),
          ),
        ),
      )
    );
  }
}
