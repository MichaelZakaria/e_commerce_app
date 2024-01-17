import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class MyHomeAppbar extends StatelessWidget {
  const MyHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MyAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MyText.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: MyColors.grey),),
                Text(MyText.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: MyColors.white,),),
              ],
            ),
            actions: [
              MyCartCounterIcon(onPressed: () => Get.to(const CartScreen()), iconColor: MyColors.white,)
            ],
    );
  }
}