import 'package:e_commerce_app/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_app/common/widgets/images/my_rounded_image.dart';
import 'package:e_commerce_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: Text('Profile'), showBackArrow: true,),
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
                  const MyRoundImage(imageUrl: MyImages.user, width: 80, height: 80,),
                  TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
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

            MyProfileMenu(title: 'Name', value: 'Michael', onPressed: () { },),
            MyProfileMenu(title: 'UserName', value: 'Michael', onPressed: () { },),

            const SizedBox(height: MySizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: MySizes.spaceBtwItems),

            /// heading personal info
            const MySectionHeading(title: 'Personal Information', showActionButton: false,),
            const SizedBox(height: MySizes.spaceBtwItems),

            MyProfileMenu(title: 'User ID', value: '860155', onPressed: () { }, icon: Iconsax.copy),
            MyProfileMenu(title: 'Email', value: 'michael@yahoo.com', onPressed: () { },),
            MyProfileMenu(title: 'Phone', value: '+20125467891', onPressed: () { },),
            MyProfileMenu(title: 'Gender', value: 'Male', onPressed: () { },),
            MyProfileMenu(title: 'Date of Birth', value: '23-8-1920', onPressed: () { },),
            const Divider(),
            const SizedBox(height: MySizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () {  },
                child: const Text('Close Account', style: TextStyle(color: Colors.red),),
              ),
            )
          ],
        ),
      ),
    );
  }
}


