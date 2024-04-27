import 'package:e_commerce_app/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce_app/features/shop/screens/product_details/product_details.dart';
import 'package:e_commerce_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return InkWell(
      onTap: () {
        // If the product have variations then show the product details for variation selection
        // Else add product to the cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(ProductDetailScreen(product: product));
        }
      },
      child: Obx(
         () {
           final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

            return Container(
              decoration: BoxDecoration(
                  color: productQuantityInCart > 0 ? MyColors.primary : MyColors.dark,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(MySizes.cardRadiusMd),
                    bottomRight: Radius.circular(MySizes.productImageRadius),
                  )
              ),
              child:SizedBox(
                width: MySizes.iconLg * 1.2,
                height: MySizes.iconLg * 1.2,
                child: productQuantityInCart > 0
                    ? Center(child: Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: MyColors.white),))
                    : const Center(child: Icon(Iconsax.add, color: MyColors.white,),),
              ),
            );
         }
         ),
    );
  }
}