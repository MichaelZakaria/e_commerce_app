import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';
import '../../../controllers/controllers_onboarding.dart';


class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Positioned(
        top: MyDeviceUtils.getAppBarHeight(),
        right: MySizes.defaultSpaces,
        child: TextButton(
          onPressed: ()  => OnBoardingController.instance.skipPage(),
          child: const Text('skip'),)
    );
  }
}
