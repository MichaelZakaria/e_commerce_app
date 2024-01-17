import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/features/shop/controllers/home_controller.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
            ),
            items: banners.map((e) =>
                MyRoundImage(imageUrl: e, border: Border.all(width: 0),))
                .toList(),
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
                () =>
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < banners.length; i++)
                      MyCircularContainer(
                          width: 20,
                          height: 4,
                          backGround: controller.carousalCurrentIndex == i
                              ? MyColors.primary
                              : MyColors.grey,
                          margin: const EdgeInsets.only(right: 10)),
                  ],
                ),
          ),
        )
      ],
    );
  }
}
