import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class MyRoundImage extends StatelessWidget {
  const MyRoundImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkingImage = false,
    this.onPressed,
    this.borderRadius = MySizes.md,
    this.overlayColor,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkingImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final Color? overlayColor;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container (
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor , borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: isNetworkingImage
          ? CachedNetworkImage(
              fit: fit,
              imageUrl: imageUrl,
              color: overlayColor,
              errorWidget: (context, url, error) => const Icon(Icons.error),
          )

          :Image(
            image: AssetImage(imageUrl),
            fit: fit,
          ),
        ),
      ),
    );
  }
}