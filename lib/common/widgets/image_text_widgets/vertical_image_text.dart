import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../images/my_rounded_image.dart';

class MyVerticalImageText extends StatelessWidget {
  const MyVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = MyColors.white,
    this.backGroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backGroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);


    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: MySizes.spaceBtwItems,),
        child: Column(
          children: [
            // circular icon
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: backGroundColor ?? (dark ? MyColors.dark : MyColors.white)
              ),
              child: Center(
                child: MyRoundImage(
                  imageUrl: image,
                  fit: BoxFit.fitWidth,
                  padding: const EdgeInsets.all(MySizes.sm * 1.4),
                  isNetworkingImage: isNetworkImage,
                  backgroundColor: backGroundColor,
                  overlayColor: MyHelperFunctions.isDarkMode(context) ? MyColors.light : MyColors.dark,
                ),
              ),
            ),
            // text
            const SizedBox(height: MySizes.spaceBtwItems / 2,),
            SizedBox(
                width: 75,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                )
            )
          ],
        ),
      ),
    );
  }
}