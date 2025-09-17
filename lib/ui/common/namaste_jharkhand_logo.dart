import 'package:flutter/material.dart';
import 'package:namste_jharkhand/assets.dart';

class APPLOGO extends StatelessWidget {
  const APPLOGO({super.key, this.width = 100, this.useImageProvider = false});
  final double width;
  final bool useImageProvider;
  @override
  Widget build(BuildContext context) {
    if (useImageProvider) {
      return Image(
          image: AssetImage(ImagePaths.appLogoPlain),
          width: width,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
          excludeFromSemantics: true);
    } else {
      return Image.asset(ImagePaths.appLogoPlain,
          width: width, fit: BoxFit.cover, filterQuality: FilterQuality.high, excludeFromSemantics: true);
    }
  }
}
