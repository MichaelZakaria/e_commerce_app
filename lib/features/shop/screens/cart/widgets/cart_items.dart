import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/prices/product_price_text.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../utils/constants/sizes.dart';

class MyCartItems extends StatelessWidget {
  const MyCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Obx(
      () =>ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
          height: MySizes.spaceBtwSections,
        ),
        itemCount: controller.cartItems.length,
        itemBuilder: (_, index) => Obx(
            () {
              final item = controller.cartItems[index];

              return Column(
                children: [
                  /// cart item
                  MyCartItem(cartItem: item),
                  if (showAddRemoveButtons)
                    const SizedBox(
                      height: MySizes.spaceBtwItems,
                    ),

                  /// add & remove with total price
                  if (showAddRemoveButtons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 70,
                            ),

                            /// add & remove buttons
                            MyProductQuantityWithAddRemoveButton(
                                quantity: item.quantity, 
                                add: () => controller.addOneToCart(item),
                                remove: () => controller.removeOneFormCart(item),
                            ),
                          ],
                        ),

                        /// product total price
                        MyProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
                      ],
                    )
                ],
              );
            }
        ),
      ),
    );
  }
}
