import 'package:e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/prices/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class MyProductAttributes extends StatelessWidget {
  const MyProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = MyHelperFunctions.isDarkMode(context);

    return SingleChildScrollView(
      child: Obx(
            () => Column(
          children: [
            /// selected attributes pricing and description
            // Display variation price and stock when some variation is selected
            if (controller.selectedVariation.value.id.isNotEmpty)
              MyCircularContainer(
              padding: const EdgeInsets.all(MySizes.md),
              backGround: dark ? MyColors.darkerGrey : MyColors.grey,
              child: Column(
                children: [
                  /// title, price & stock status
                  Row(
                    children: [
                      const MySectionHeading(title: 'Variation', showActionButton: false,),
                      const SizedBox(width: MySizes.spaceBtwItems,),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const MyProductTitleText(title: 'Price  :   ', smallSize: true,),
                              Column(
                                children: [
                                  /// actual price
                                  if (controller.selectedVariation.value.salePrice > 0)
                                  Text('\$${controller.selectedVariation.value.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                                  /// sale price
                                  MyProductPriceText(price: '\$${controller.getVariationPrice()}',),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: MySizes.spaceBtwItems / 10),
                          /// stock
                          Row(
                            children: [
                              const MyProductTitleText(title: 'Stock :  ', smallSize: true,),
                              Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium,),
                              const SizedBox(height: MySizes.spaceBtwSections),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  /// variation Description
                  MyProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            /// attributes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!.map((attribute) =>
                  Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MySectionHeading(title: attribute.name ?? '', showActionButton: false),
                      const SizedBox(height: MySizes.spaceBtwItems / 2,),

                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {

                            final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                            final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                                .contains(attributeValue);

                            return MyChoiceShip(text: attributeValue, selected: isSelected, onSelected: available ? (selected) {
                              if (selected && available) {
                                controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                              }
                            } : null);
                          }).toList()
                        ),
                      ),
                    ],
                  )
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
