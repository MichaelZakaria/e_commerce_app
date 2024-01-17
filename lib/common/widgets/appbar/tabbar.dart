import 'package:e_commerce_app/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';

class MyTabBar extends StatelessWidget implements PreferredSizeWidget{
  /// to add a background color to tabs you have to wrap them in a material widget
  /// to do that you need a [PreferredSizeWidget] widget so you need to create a custom class that implements [PreferredSizeWidget]
  const MyTabBar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? MyColors.black : MyColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: MyColors.primary,
        unselectedLabelColor: MyColors.darkGrey,
        labelColor: dark ? MyColors.white : MyColors.primary,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MyDeviceUtils.getAppBarHeight());
}