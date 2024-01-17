import 'package:e_commerce_app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class MyChoiceShip extends StatelessWidget {
  const MyChoiceShip({super.key,
    required this.text,
    required this.selected,
    this.onSelected});

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = MyHelperFunctions.getColor(text) != null;

    return ChoiceChip(
      label: isColor ? const SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? MyColors.white : null),
      avatar: isColor ? MyCircularContainer(height: 50, width: 50, backGround: MyHelperFunctions.getColor(text)!) : null,
      labelPadding: isColor ? const EdgeInsets.all(0) : null,
      padding: isColor ? const EdgeInsets.all(0) : null,
      shape: isColor ?  const CircleBorder() : null,
      backgroundColor: isColor ? MyHelperFunctions.getColor(text) : null,

    );
  }
}
