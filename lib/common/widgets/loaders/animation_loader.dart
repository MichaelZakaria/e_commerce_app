import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/// A widget for displaying an animated loading indicator with optional text and action button
class MyAnimationLoaderWidget extends StatelessWidget {
  /// Default constructor for the MyAnimationLoaderWidget
  ///
  /// Parameters
  ///   - text: The text to be displayed below the animation
  ///   - animation: The path to the lottie animation file
  ///   - showAction: Whether to show an action button below the text
  ///   - actionText: The text to be displayed on the action button
  ///   - onActionPressed: Callback function to be executed when the action button is pressed
  const MyAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), // display lottie animation
          const SizedBox(height: MySizes.defaultSpaces,),
          Text(text, style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
          const SizedBox(height: MySizes.defaultSpaces,),
          showAction ? SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: MyColors.dark),
              child: Text(actionText!, style: Theme.of(context).textTheme.bodyMedium!.apply(color: MyColors.light)),
            ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}
