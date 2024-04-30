import 'package:e_commerce_app/common/widgets/list_tiles/payment_method_tile.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/models/payment_method_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(image: MyImages.paypal, name: 'paypal');
    super.onInit();
  }

  /// Show payment methods bottom sheet
  Future<dynamic> selectPaymentMethod(BuildContext context) {

    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(MySizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MySectionHeading(title: 'Select Payment Method', showActionButton: false,),
                const SizedBox(height: MySizes.spaceBtwSections,),
                MyPaymentTile(paymentMethod: PaymentMethodModel(name: 'paypal', image: MyImages.paypal)),
                const SizedBox(height:  MySizes.spaceBtwItems,),
                MyPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: MyImages.creditCard)),
                const SizedBox(height:  MySizes.spaceBtwItems,),
                MyPaymentTile(paymentMethod: PaymentMethodModel(name: 'Cash', image: MyImages.cash)),
                const SizedBox(height:  MySizes.spaceBtwItems,),
              ],
            ),
          ),
        )
    );
  }
}