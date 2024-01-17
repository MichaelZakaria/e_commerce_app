import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_function.dart';

class MyTermsAndConditionsCheckbox extends StatelessWidget {
  const MyTermsAndConditionsCheckbox({super.key,});

  @override
  Widget build(BuildContext context) {

    final dark = MyHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(height: 24, width: 24, child: Checkbox(value: true, onChanged: (value) {})),
        const SizedBox(width: MySizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: '${MyText.iAgreeTo} ' , style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: '${MyText.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? MyColors.white : MyColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? MyColors.white : MyColors.primary,
                  )),
                  TextSpan(text: '${MyText.and} ', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: '${MyText.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? MyColors.white : MyColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? MyColors.white : MyColors.primary,
                  )),
                ]
            ),
          ),
        ),
      ],
    );
  }
}