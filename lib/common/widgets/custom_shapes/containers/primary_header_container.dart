import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edge/curved_edges_widget.dart';
import 'circular_container.dart';


class MyPrimaryHeaderContainer extends StatelessWidget {
  const MyPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MyCurvedEdgesWidget(
      child: Container(
        color: MyColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            /// background custom shapes
            Positioned(top: -150, right: -250, child: MyCircularContainer(radius: 400, width: 400, height: 400, backGround: MyColors.textWhite.withOpacity(0.1),)),
            Positioned(top: 100, right: -300, child: MyCircularContainer(radius: 400, width: 400, height: 400, backGround: MyColors.textWhite.withOpacity(0.1),)),
            child,
          ],
        ),
      ),
    );
  }
}