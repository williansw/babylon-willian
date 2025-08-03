import 'package:flutter/material.dart';

class CustomAssetImage extends StatelessWidget {
  final String imageName;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final Color? backgroundColor;

  const CustomAssetImage({
    super.key,
    required this.imageName,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
    this.color,
    this.borderRadius,
    this.onTap,
    this.border,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          border: border,
          borderRadius: borderRadius,
        ),
        child: Image.asset(
          imageName,
          height: height,
          width: width,
          fit: fit,
          color: color,
        ),
      ),
    );

    if (onTap != null) {
      image = GestureDetector(onTap: onTap, child: image);
    }
    return image;
  }
}
