import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class MyBillingAmountSection extends StatelessWidget {
  const MyBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$2200.99',  style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        /// shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.00',  style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        /// tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$10.00',  style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),

        /// order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$2216.00',  style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),
      ],
    );
  }
}