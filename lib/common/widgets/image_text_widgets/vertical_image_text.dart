import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class MyVerticalImageText extends StatelessWidget {
  const MyVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = MyColors.white,
    this.backGroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backGroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);


    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MySizes.spaceBtwItems,),
        child: Column(
          children: [
            // circular icons
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: backGroundColor ?? (dark ? MyColors.dark : MyColors.white)
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  color: backGroundColor ?? (dark ? MyColors.white : MyColors.dark),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // text
            const SizedBox(height: MySizes.spaceBtwItems / 2,),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,
                )
            )
          ],
        ),
      ),
    );
  }
}