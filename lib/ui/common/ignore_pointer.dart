import 'package:flutter/rendering.dart';
import 'package:namste_jharkhand/common_libs.dart';

class IgnorePointerKeepSemantics extends SingleChildRenderObjectWidget {
  const IgnorePointerKeepSemantics({super.key, super.child});

  @override
  RenderIgnorePointerKeepSemantics createRenderObject(BuildContext context) => RenderIgnorePointerKeepSemantics();
}

class RenderIgnorePointerKeepSemantics extends RenderProxyBox {
  RenderIgnorePointerKeepSemantics();
  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) => false;
}

class IgnorePointerAndSemantics extends StatelessWidget {
  final Widget child;
  const IgnorePointerAndSemantics({super.key, required this.child});

  @override
  Widget build(BuildContext context) => ExcludeSemantics(child: IgnorePointer(child: child));
}
