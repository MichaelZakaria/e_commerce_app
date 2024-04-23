import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/shop/controllers/product/image_controller.dart';
import 'package:e_commerce_app/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edge/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/my_circular_icon.dart';
import '../../../../../common/widgets/images/my_rounded_image.dart';
import '../../../../../common/widgets/products/favourite_icon/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class MyProductImageSlider extends StatelessWidget {
  const MyProductImageSlider({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(ImageController());
    final images = controller.getAllPRoductImages(product);
    final dark = MyHelperFunctions.isDarkMode(context);

    return MyCurvedEdgesWidget(
      child: Container(
        color: dark? MyColors.darkerGrey : MyColors.light,
        child: Stack(
          children: [
            /// main large image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(MySizes.productImageRadius * 2),
                child: Center(child: Obx(() => GestureDetector(
                  onTap: () => controller.showEnlargedImage(controller.selectedProductImage.value),
                  child: CachedNetworkImage(
                    imageUrl: controller.selectedProductImage.value,
                    progressIndicatorBuilder: (_, __, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress, color: MyColors.primary,),
                  ),
                ))),
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
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: MySizes.spaceBtwItems,),
                  itemBuilder: (_, int index) => Obx( () {
                    final imageSelected = controller.selectedProductImage.value == images[index];
                    return MyRoundImage(
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      isNetworkingImage: true,
                      imageUrl: images[index],
                      width: 80,
                      border: Border.all(color: imageSelected ? MyColors.primary : Colors.transparent),
                      padding: const EdgeInsets.all(MySizes.sm),
                      backgroundColor: dark ? MyColors.dark : MyColors.white,
                    );
                  }
                  ),
                ),
              ),
            ),
            MyAppBar(
              showBackArrow: true,
              actions: [
                MyFavouriteIcon(productId: product.id,)
              ],
            )
          ],
        ),
      ),
    );
  }
}