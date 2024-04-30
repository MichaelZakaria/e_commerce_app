import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class MyBillingPaymentSection extends StatelessWidget {
  const MyBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;

    bool dark = MyHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        MySectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () => controller.selectPaymentMethod(context),),
        const SizedBox(height: MySizes.spaceBtwItems / 2,),
        Obx(
          () => Row(
            children: [
              MyCircularContainer(
                width: 60,
                height: 35,
                backGround: dark ? MyColors.light : MyColors.white,
                padding: const EdgeInsets.all(MySizes.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain,),
              ),
              const SizedBox(width: MySizes.spaceBtwItems / 2,),
              Text(controller.selectedPaymentMethod.value.name, style: Theme.of(context).textTheme.bodyLarge,)
            ],
          ),
        )
      ],
    );
  }
}

