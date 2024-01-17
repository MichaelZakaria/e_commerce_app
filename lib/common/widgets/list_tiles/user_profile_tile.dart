import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/my_rounded_image.dart';

class MyUserProfileTile extends StatelessWidget {
  const MyUserProfileTile({
    super.key, this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const MyRoundImage(
        imageUrl: MyImages.user,
        height: 55,
        width: 55,
        padding: EdgeInsets.zero,
      ),
      title: Text('Michael', style: Theme.of(context).textTheme.headlineMedium!.apply(color: MyColors.white),),
      subtitle: Text('michael@yahoo.com', style: Theme.of(context).textTheme.bodyMedium!.apply(color: MyColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: MyColors.white,),),
    );
  }
}