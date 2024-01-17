import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class MyBillingAddressSection extends StatelessWidget {
  const MyBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MySectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {},),
        Text('Michael', style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16,),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Expanded(child: Text('+20-123456789', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
          ],
        ),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16,),
            const SizedBox(width: MySizes.spaceBtwItems,),
            Expanded(child: Text('132, My Street, Big-town BG23 4YZ England', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
          ],
        ),
      ],
    );
  }
}
