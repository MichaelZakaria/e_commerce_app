
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_button.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:e_commerce_app/utils/constants/image_strings.dart';
import 'package:e_commerce_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/controllers_onboarding.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // to instantiate the on boarding controller
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: MyImages.onBoardingImage1 ,
                title: MyText.onBoardingTitle1 ,
                subtitle: MyText.onBoardingSubTitle1,
              ),
              OnBoardingPage(image: MyImages.onBoardingImage1 ,
                title: MyText.onBoardingTitle2 ,
                subtitle: MyText.onBoardingSubTitle2,
              ),
              OnBoardingPage(image: MyImages.onBoardingImage1 ,
                title: MyText.onBoardingTitle3 ,
                subtitle: MyText.onBoardingSubTitle3,
              ),
            ],
          ),
          /// skip button
          const OnBoardingSkip(),
          /// Dot Navigation SmoothPageIndicator
          const OnBoardingNavigation(),
          /// circular button
          const OnBoardingButton(),
        ],
      ),
    );
  }
}


