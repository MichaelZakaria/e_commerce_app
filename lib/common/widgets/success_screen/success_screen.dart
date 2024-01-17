import 'package:e_commerce_app/common/styles/spacing_style.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MySpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// image
              Image(image: AssetImage(image),),
              const SizedBox(height: MySizes.spaceBtwSections,),
              /// title amd subtitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwItems,),
              Text(subtitle, style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center,),
              const SizedBox(height: MySizes.spaceBtwSections,),
              /// buttons
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (onPressed), child: const Text(MyText.mcontinue)),),
              const SizedBox(height: MySizes.spaceBtwSections,),
            ],
          ),
        ),
      ),
    );
  }
}
