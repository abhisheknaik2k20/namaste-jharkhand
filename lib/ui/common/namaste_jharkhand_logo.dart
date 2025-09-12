import 'package:flutter/material.dart';
import 'package:namste_jharkhand/assets.dart';

class APPLOGO extends StatelessWidget {
  const APPLOGO({super.key, this.width = 100});

  final double width;

  @override
  Widget build(BuildContext context) => Image.asset(ImagePaths.appLogoPlain,
      excludeFromSemantics: true, fit: BoxFit.cover, width: width, filterQuality: FilterQuality.high);
}
