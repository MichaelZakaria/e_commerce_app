import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class MyBillingPaymentSection extends StatelessWidget {
  const MyBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = MyHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        MySectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {},),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),
        Row(
          children: [
            MyCircularContainer(
              width: 60,
              height: 35,
              backGround: dark ? MyColors.light : MyColors.white,
              padding: const EdgeInsets.all(MySizes.sm),
              child: const Image(image: AssetImage(MyImages.paypal), fit: BoxFit.contain,),
            ),
            const SizedBox(width: MySizes.spaceBtwItems / 2,),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}

