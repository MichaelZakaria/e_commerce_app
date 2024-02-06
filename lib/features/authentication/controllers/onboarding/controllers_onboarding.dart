import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {

  // to get the same instance of the onboarding controller
  static OnBoardingController get instance => Get.find();

  /// variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

 /// update current index when page scroll
 void updatePageIndicator(index) => currentPageIndex.value = index;

 /// jump to the specific dot selected page
 void dotNavigatorClick(index) {
   currentPageIndex.value = index;
   pageController.jumpTo(index);
 }

 /// update current index and jump to next page
 void nextPage() {
   if(currentPageIndex.value == 2) {

     // access local storage to remove onboarding screens from future app launches
     final storage = GetStorage();
     storage.write('IsFirstTime', false);

     Get.offAll(const LoginScreen());
   } else {
     int page = currentPageIndex.value + 1;
     pageController.jumpToPage(page);
   }
 }

 /// update current index and jump to last page
 void skipPage() {

   // access local storage to remove onboarding screens from future app launches
   final storage = GetStorage();
   storage.write('IsFirstTime', false);

   Get.offAll(const LoginScreen());
 }
}