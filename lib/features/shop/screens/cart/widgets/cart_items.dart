import 'package:flutter/material.dart';
import '../../../../../common/widgets/prices/product_price_text.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../utils/constants/sizes.dart';

class MyCartItems extends StatelessWidget {
  const MyCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: MySizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          /// cart item
          const MyCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),

          /// add & remove with total price
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),

                    /// add & remove buttons
                    MyProductQuantityWithAddRemoveButton(),
                  ],
                ),

                /// product total price
                MyProductPriceText(price: '1199.99'),
              ],
            )
        ],
      ),
    );
  }
}
