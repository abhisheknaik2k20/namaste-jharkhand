import 'package:namste_jharkhand/common_libs.dart';

class PreviousNextNavigation extends StatefulWidget {
  const PreviousNextNavigation(
      {super.key,
      required this.onPreviousPressed,
      required this.onNextPressed,
      required this.child,
      this.maxWidth = 1000,
      this.nextBtnColor,
      this.previousBtnColor,
      this.listenToMouseWheel = true});
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final Color? nextBtnColor;
  final Color? previousBtnColor;
  final Widget child;
  final double? maxWidth;
  final bool listenToMouseWheel;

  @override
  State<PreviousNextNavigation> createState() => _PreviousNextNavigationState();
}

class _PreviousNextNavigationState extends State<PreviousNextNavigation> {
  @override
  Widget build(BuildContext context) => widget.child;
}
