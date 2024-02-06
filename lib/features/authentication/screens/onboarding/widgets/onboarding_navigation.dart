import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/onboarding/controllers_onboarding.dart';


class OnBoardingNavigation extends StatelessWidget {
  const OnBoardingNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = MyHelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: MyDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: MySizes.defaultSpaces,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigatorClick,
          count: 3,
          effect: ExpandingDotsEffect(activeDotColor: dark ? MyColors.light : MyColors.dark, dotHeight: 6),
        )
    );
  }
}