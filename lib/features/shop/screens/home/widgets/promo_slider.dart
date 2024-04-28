import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/features/shop/controllers/banner_controller.dart';
import 'package:e_commerce_app/features/shop/controllers/home_controller.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(
      () {
        // Loader
        if (controller.isLoading.value) return const CircularProgressIndicator();

        // No Data found
        if (controller.banners.isEmpty) {
          return const Center(child: Text('No Data Found!'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
                items: controller.banners.map((banner) =>
                    MyRoundImage(
                      imageUrl: banner.imageUrl,
                      border: Border.all(width: 0),
                      isNetworkingImage: true,
                      onPressed: // () => Get.toNamed(banner.targetScreen),
                                    () =>   NavigationController.instance.selectedIndex.value = 1
                    )
                ).toList(),
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
                          for (int i = 0; i < controller.banners.length; i++)
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
    );
  }
}
