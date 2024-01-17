import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/device/device_utility.dart';

class MyRatingProgressIndicator extends StatelessWidget {
  const MyRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text, style: Theme.of(context).textTheme.bodySmall,)),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: MyDeviceUtils.getScreenWidth() * 0.5,
            child: LinearProgressIndicator(
              value:value,
              minHeight: 11,
              backgroundColor: MyColors.grey,
              valueColor: const AlwaysStoppedAnimation(MyColors.primary),
            ),
          ),
        )
      ],
    );
  }
}