import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';

class MyBillingAmountSection extends StatelessWidget {
  const MyBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;

    return Column(
      children: [

        /// subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$$subTotal',  style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        /// shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$${MyPriceCalculator.calculateShippingCost(subTotal, 'Us')}',  style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        /// tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$${MyPriceCalculator.calculateTax(subTotal, 'Us')}',  style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        /// order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$${MyPriceCalculator.calculateTotalPrice(subTotal, 'Us')}',  style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),
      ],
    );
  }
}