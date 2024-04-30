import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce_app/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_app/features/personalization/screens/address/address.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_app/features/shop/screens/cart/cart.dart';
import 'package:e_commerce_app/features/shop/screens/order/order.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../../utils/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            MyPrimaryHeaderContainer(
                child: Column(
                  children: [
                    MyAppBar(
                      title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: MyColors.white),),
                    ),
                    /// user profile card
                   MyUserProfileTile(onPressed: () => Get.to(const ProfileScreen())),
                    const SizedBox(height: MySizes.spaceBtwSections,),
                  ],
                )
            ),
            /// body
            Padding(
                padding: const EdgeInsets.all(MySizes.defaultSpaces),
              child: Column(
                children: [
                  /// account settings
                  const MySectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: MySizes.spaceBtwItems),

                  MySettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'Set Shopping delivery address', onTap: () => Get.to(() => const UserAddressScreen())),
                  MySettingsMenuTile(icon: Iconsax.shopping_cart, title: 'MyCart', subTitle: 'Add, remove products and proceed to checkout', onTap: () => Get.to(() => const CartScreen())),
                  MySettingsMenuTile(icon: Iconsax.bag_tick, title: 'My orders', subTitle: 'In-progress and Completed orders', onTap: () => Get.to(() => const OrderScreen())),
                  const MySettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                  const MySettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List ll discount coupons'),
                  const MySettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message'),
                  const MySettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  /// app settings
                  const SizedBox(height: MySizes.spaceBtwSections,),
                  const MySectionHeading(title: 'App Settings', showActionButton: false,),
                  const SizedBox(height: MySizes.spaceBtwItems,),
                  const MySettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                  MySettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  MySettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  MySettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle: 'set image quality to be seen',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  const SizedBox(height: MySizes.spaceBtwSections,),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('logout')),
                  ),
                  const SizedBox(height: MySizes.spaceBtwSections * 2.5,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


