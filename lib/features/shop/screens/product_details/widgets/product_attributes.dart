import 'package:e_commerce_app/common/widgets/chips/choice_chip.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/common/widgets/prices/product_price_text.dart';
import 'package:e_commerce_app/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MyProductAttributes extends StatelessWidget {
  const MyProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context); 
    
    return SingleChildScrollView(
      child: Column(
        children: [
          /// selected attributes pricing and description
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
                                Text('\$1299.99', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                                /// sale price
                                const MyProductPriceText(price: '1199.99',),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: MySizes.spaceBtwItems / 10),
                        /// stock
                        Row(
                          children: [
                            const MyProductTitleText(title: 'Stock :  ', smallSize: true,),
                            Text('In Stock', style: Theme.of(context).textTheme.titleMedium,),
                            const SizedBox(height: MySizes.spaceBtwSections),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                /// variation Description
                const MyProductTitleText(
                  title: 'This is the Description of the product and it can go up to max 4 lines',
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
            children: [
              const MySectionHeading(title: 'Colors', showActionButton: false),
              const SizedBox(height: MySizes.spaceBtwItems / 2,),
              Wrap(
                spacing: 8,
                children: [
                  MyChoiceShip(text: 'Black', selected: false, onSelected: (value) {}),
                  MyChoiceShip(text: 'Blue', selected: false, onSelected: (value) {}),
                  MyChoiceShip(text: 'White', selected: false, onSelected: (value) {}),
                  MyChoiceShip(text: 'Grey', selected: true, onSelected: (value) {}),
                ],
              ),
              const MySectionHeading(title: 'Storage', showActionButton: false),
              const SizedBox(height: MySizes.spaceBtwItems / 2,),
              Wrap(
                spacing: 8,
                children: [
                  MyChoiceShip(text: '512 GB', selected: true, onSelected: (value) {}),
                  MyChoiceShip(text: '1 TB', selected: false, onSelected: (value) {}),
                  MyChoiceShip(text: '256 GB', selected: false, onSelected: (value) {}),
                ],
              ),
            ],
          ),
          const SizedBox(height: MySizes.spaceBtwSections,),
        ],
      ),
    );
  }
}
