import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class MySpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: MySizes.appBarHeight,
    left: MySizes.defaultSpaces,
    right: MySizes.defaultSpaces,
    bottom: MySizes.defaultSpaces,
  );
}