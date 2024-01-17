import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edge/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/my_circular_icon.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class MyProductImageSlider extends StatelessWidget {
  const MyProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);
    return MyCurvedEdgesWidget(
      child: Container(
        color: dark? MyColors.darkerGrey : MyColors.light,
        child: Stack(
          children: [
            /// main large image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(MySizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(MyImages.iphone15ProMaxNaturalTitanium))),
              ),
            ),
            /// image slider
            Positioned(
              bottom: 30,
              left: MySizes.defaultSpaces,
              right: 0,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: MySizes.spaceBtwItems,),
                  itemBuilder: (_, int index) => MyRoundImage(
                    imageUrl: MyImages.iphone15ProMaxNaturalTitanium,
                    width: 80,
                    border: Border.all(color: MyColors.primary),
                    padding: const EdgeInsets.all(MySizes.sm),
                    backgroundColor: dark ? MyColors.dark : MyColors.white,
                  ),
                ),
              ),
            ),
            const MyAppBar(
              showBackArrow: true,
              actions: [
                MyCircularIcon(icon: Iconsax.heart5, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }
}