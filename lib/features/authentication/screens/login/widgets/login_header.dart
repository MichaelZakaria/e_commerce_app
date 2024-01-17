import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_function.dart';

class MyLoginHeader extends StatelessWidget {
  const MyLoginHeader({super.key});


  @override
  Widget build(BuildContext context) {

    final dark = MyHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(dark ? MyImages.lightAppLogo : MyImages.darkAppLogo),
          height: 150,
        ),
        Text(MyText.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: MySizes.sm,),
        Text(MyText.loginSubtitle, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}