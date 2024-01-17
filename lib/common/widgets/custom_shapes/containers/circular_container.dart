import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';

class MyCircularContainer extends StatelessWidget {
  const MyCircularContainer({
    super.key,
    this.width,
    this.height,
    this.radius = MySizes.cardRadiusLg,
    this.backGround = MyColors.white,
    this.child,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.borderColor = MyColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double radius;
  final Color backGround;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color borderColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: borderColor) : null ,
          color: backGround
      ),
      child: child,
    );
  }
}