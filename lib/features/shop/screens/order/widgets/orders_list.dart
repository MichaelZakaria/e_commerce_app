import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class MyOrderListItem extends StatelessWidget {
  const MyOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = MyHelperFunctions.isDarkMode(context);

    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_,__) => const SizedBox(height: MySizes.spaceBtwItems,),
      itemBuilder: (_,index) => MyCircularContainer(
        showBorder: true,
        padding: const EdgeInsets.all(MySizes.md),
        backGround: dark ? MyColors.dark : MyColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// row 1
            Row(
              children: [
                /// 1 - icon
                const Icon(Iconsax.ship),
                const SizedBox(width: MySizes.spaceBtwItems / 2,),
                /// 2 - status & date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: MyColors.primary, fontWeightDelta: 1),),
                      Text('23 Dec 2024', style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ),
                /// 3 - icon
                IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: MySizes.iconSm,)),
              ],
            ),
            const SizedBox(height: MySizes.spaceBtwItems,),

            /// row 2
            Row(
              children: [
                Expanded(
                    child: Row(
                      children: [
                        /// 1 - icon
                        const Icon(Iconsax.tag),
                        const SizedBox(width: MySizes.spaceBtwItems / 2,),
                        /// 2 - status & date
                        Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('order', style: Theme.of(context).textTheme.labelMedium,),
                                Text('[#045198]', style: Theme.of(context).textTheme.titleMedium,),
                              ],
                            )
                        ),
                      ],
                    ),
                ),

                Expanded(
                  child: Row(
                    children: [
                      /// 1 - icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: MySizes.spaceBtwItems / 2,),
                      /// 2 - status & date
                      Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium,),
                              Text('23 Dec 2025', style: Theme.of(context).textTheme.titleMedium,),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
