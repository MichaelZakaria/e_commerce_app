import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';

class MyCartCounterIcon extends StatelessWidget {
  const MyCartCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
  });

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark =MyHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.shopping_bag, color: iconColor ?? (dark ? MyColors.light : MyColors.dark))),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(color:dark ? MyColors.light : MyColors.dark, borderRadius: BorderRadius.circular(18)),
            child: Center(
                child: Text(
                    '2',
                    style: Theme.of(context).textTheme.labelLarge!.apply(color: dark ? MyColors.dark : MyColors.light, fontSizeFactor: 0.8)
                )
            ),
          ),
        )
      ],
    );
  }
}