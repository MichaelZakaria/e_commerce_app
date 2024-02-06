import 'package:e_commerce_app/features/authentication/screens/login/login.dart';
import 'package:e_commerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce_app/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_app/features/personalization/screens/address/address.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/personalization/screens/settings/settings/settings.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:e_commerce_app/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_app/features/shop/screens/home/home.dart';
import 'package:e_commerce_app/features/shop/screens/order/order.dart';
import 'package:e_commerce_app/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_commerce_app/features/shop/screens/store/store.dart';
import 'package:e_commerce_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce_app/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: MyRoutes.home, page: () => const HomeScreen()),
    GetPage(name: MyRoutes.store, page: () => const StoreScreen()),
    GetPage(name: MyRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: MyRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: MyRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: MyRoutes.order, page: () => const OrderScreen()),
    GetPage(name: MyRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: MyRoutes.cart, page: () => const CartScreen()),
    GetPage(name: MyRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: MyRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: MyRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: MyRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: MyRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: MyRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: MyRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}