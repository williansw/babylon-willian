import 'package:flutter/material.dart';
import '../../../../../style/styte.dart';
import '../base/custom_imagem.dart';

class AppLogoIcon extends StatelessWidget {
  final double size;

  const AppLogoIcon({this.size = Spacing.x14, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAssetImage(
      width: size,
      height: size,
      imageName: AppImage.babylonIcon,
    );
  }
}
