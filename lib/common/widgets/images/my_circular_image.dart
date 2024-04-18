import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class MuCircularImage extends StatelessWidget {
  const MuCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor = Colors.transparent,
    this.width = 56,
    this.height = 56,
    this.padding = MySizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (MyHelperFunctions.isDarkMode(context)? MyColors.black : MyColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: isNetworkImage ? CachedNetworkImage(
        imageUrl: image,
        color:  overlayColor ?? (MyHelperFunctions.isDarkMode(context)? MyColors.white : MyColors.dark),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (_, __, downloadProgress) =>
            Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: MyColors.primary,)),
      )
          :Image(
        image: AssetImage(image),
      ),

      // Old ##########################################################################################3
      // Image(
      //   image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
      //   color: overlayColor ?? (MyHelperFunctions.isDarkMode(context)? MyColors.white : MyColors.dark),
      //   fit: fit,
      // ),
    );
  }
}