import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:e_commerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../cart/widgets/cart_items.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());

    bool dark = MyHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: MyAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpaces),
          child: Column(
            children: [
              /// items in cart
              const MyCartItems(showAddRemoveButtons: false),
              const SizedBox(height: MySizes.spaceBtwSections),

              /// coupon text field
              const MyCouponCode(),
              const SizedBox(height: MySizes.spaceBtwSections),

              /// billing section
              MyCircularContainer(
                padding: const EdgeInsets.all(MySizes.md),
                showBorder: true,
                backGround: dark ? MyColors.black : MyColors.white,
                child: const Column(
                  children: [
                    /// pricing
                    MyBillingAmountSection(),
                    SizedBox(height: MySizes.spaceBtwItems,),
                    /// divider
                    Divider(),
                    SizedBox(height: MySizes.spaceBtwItems,),
                    /// payment methods
                    MyBillingPaymentSection(),
                    SizedBox(height: MySizes.spaceBtwItems,),
                    /// address
                    MyBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      
      /// checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpaces),
        child: ElevatedButton(
          onPressed: () => Get.to( SuccessScreen(
              image: MyImages.success,
              title: 'Payment Success!',
              subtitle: 'Your item will be shipped soon!',
              onPressed: () => Get.offAll(const NavigationMenu())
          )),
          child: const Text('Checkout \$2216.00'),
        ),
      ),
    );
  }
}
