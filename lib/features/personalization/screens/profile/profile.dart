import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const MyAppBar(title: Text('Profile'), showBackArrow: true,),
      /// body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(MySizes.defaultSpaces),
        child: Column(
          children: [
            /// profile picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx( () {
                    final networkImage = controller.user.value.profilePicture;
                    final image = networkImage.isNotEmpty ? networkImage : MyImages.user;
                    return controller.imageUploading.value
                      ? const CircularProgressIndicator()
                      :MyRoundImage(imageUrl: image, width: 80, height: 80, isNetworkingImage: networkImage.isNotEmpty, borderRadius: 80,);
                  }
                  ),
                  TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                ],
              ),
            ),
            /// details
            const SizedBox(height: MySizes.spaceBtwItems / 2,),
            const Divider(),
            const SizedBox(height: MySizes.spaceBtwItems,),

            /// heading profile info
            const MySectionHeading(title: 'Profile Information', showActionButton: false,),
            const SizedBox(height: MySizes.spaceBtwItems),

            MyProfileMenu(title: 'Name', value: controller.user.value.fullName, onPressed: () => Get.to(const ChangeName()),),
            MyProfileMenu(title: 'UserName', value: controller.user.value.userName, onPressed: () { },),

            const SizedBox(height: MySizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: MySizes.spaceBtwItems),

            /// heading personal info
            const MySectionHeading(title: 'Personal Information', showActionButton: false,),
            const SizedBox(height: MySizes.spaceBtwItems),

            MyProfileMenu(title: 'User ID', value: controller.user.value.id, onPressed: () { }, icon: Iconsax.copy),
            MyProfileMenu(title: 'Email', value: controller.user.value.email, onPressed: () { },),
            MyProfileMenu(title: 'Phone', value: controller.user.value.phoneNumber, onPressed: () { },),
            MyProfileMenu(title: 'Gender', value: 'Male', onPressed: () { },),
            MyProfileMenu(title: 'Date of Birth', value: '23-8-1920', onPressed: () { },),
            const Divider(),
            const SizedBox(height: MySizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Close Account', style: TextStyle(color: Colors.red),),
              ),
            )
          ],
        ),
      ),
    );
  }
}


