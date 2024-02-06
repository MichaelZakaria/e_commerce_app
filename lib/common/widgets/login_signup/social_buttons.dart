import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class MySocialButtons extends StatelessWidget {
  const MySocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: MyColors.grey), borderRadius: BorderRadius.circular(100) ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              image: AssetImage(MyImages.google),
              width: MySizes.iconMd,
              height: MySizes.iconMd,
            ),
          ),
        ),
        const SizedBox(width: MySizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: MyColors.grey), borderRadius: BorderRadius.circular(100) ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(MyImages.facebook),
              width: MySizes.iconMd,
              height: MySizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}