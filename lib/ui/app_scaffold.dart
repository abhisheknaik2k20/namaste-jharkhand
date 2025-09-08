import 'package:wonders/common_libs.dart';
import 'package:wonders/ui/common/app_scroll_behavior.dart';
import 'package:wonders/ui/common/persistent_overlay_widget.dart';

class WondersAppScaffold extends StatefulWidget {
  const WondersAppScaffold({super.key, required this.child});
  final Widget child;

  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();

  @override
  State<WondersAppScaffold> createState() => _WondersAppScaffoldState();
}

class _WondersAppScaffoldState extends State<WondersAppScaffold> with TickerProviderStateMixin {
  Offset _overlayPosition = const Offset(0, 0);
  Offset _lastPanVelocity = Offset.zero;
  late AnimationController _inertiaController;
  late Animation<Offset> _inertiaAnimation;
  bool _hasInitializedPosition = false;
  bool _isOverlayReady = false;

  @override
  void initState() {
    super.initState();
    _inertiaController = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _isOverlayReady = true);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasInitializedPosition) _initializeOverlayPosition();
  }

  @override
  void dispose() {
    _inertiaController.dispose();
    super.dispose();
  }

  void _initializeOverlayPosition() {
    final screenSize = MediaQuery.of(context).size;
    if (screenSize.width > 0 && screenSize.height > 0) {
      setState(() {
        _overlayPosition = Offset(screenSize.width - 150, screenSize.height - 150);
        _hasInitializedPosition = true;
      });
    }
  }

  void _handlePanUpdate(DragUpdateDetails details, Size screenSize) {
    setState(() => _overlayPosition = Offset(
        (_overlayPosition.dx + details.delta.dx).clamp(0.0, screenSize.width - 150),
        (_overlayPosition.dy + details.delta.dy).clamp(0.0, screenSize.height - 150)));
    _lastPanVelocity = details.delta;
  }

  void _handlePanEnd(Size screenSize) {
    final velocity = _lastPanVelocity;
    final magnitude = velocity.distance;
    if (magnitude > 2.0) {
      final inertiaDistance = magnitude * 20;
      final normalizedVelocity = velocity / magnitude;
      final targetPosition = Offset(
          (_overlayPosition.dx + normalizedVelocity.dx * inertiaDistance).clamp(0.0, screenSize.width - 150),
          (_overlayPosition.dy + normalizedVelocity.dy * inertiaDistance).clamp(0.0, screenSize.height - 150));
      _inertiaAnimation = Tween<Offset>(begin: _overlayPosition, end: targetPosition)
          .animate(CurvedAnimation(parent: _inertiaController, curve: Curves.decelerate));
      _inertiaController.reset();
      _inertiaController.forward();
      _inertiaAnimation.addListener(() {
        if (mounted) setState(() => _overlayPosition = _inertiaAnimation.value);
      });
    }
    _lastPanVelocity = Offset.zero;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenSize = mq.size;
    if (_hasInitializedPosition && screenSize.width > 0 && screenSize.height > 0) {
      final clampedPosition = Offset(_overlayPosition.dx.clamp(0.0, screenSize.width - 150),
          _overlayPosition.dy.clamp(0.0, screenSize.height - 150));
      if (clampedPosition != _overlayPosition) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() => _overlayPosition = clampedPosition);
        });
      }
    }
    if (!_hasInitializedPosition && screenSize.width > 0 && screenSize.height > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _initializeOverlayPosition());
    }
    appLogic.handleAppSizeChanged(screenSize);
    Animate.defaultDuration = WondersAppScaffold._style.times.fast;
    WondersAppScaffold._style =
        AppStyle(screenSize: context.sizePx, disableAnimations: mq.disableAnimations, highContrast: mq.highContrast);
    return KeyedSubtree(
        key: ValueKey($styles.scale),
        child: Theme(
            data: $styles.colors.toThemeData(),
            child: DefaultTextStyle(
                style: $styles.text.body,
                child: ScrollConfiguration(
                    behavior: AppScrollBehavior(),
                    child: Stack(children: [
                      widget.child,
                      if (_isOverlayReady)
                        Positioned(
                            left: _hasInitializedPosition ? _overlayPosition.dx : screenSize.width - 120,
                            top: _hasInitializedPosition ? _overlayPosition.dy : screenSize.height - 120,
                            child: GestureDetector(
                                onPanUpdate: (details) => _handlePanUpdate(details, screenSize),
                                onPanEnd: (_) => _handlePanEnd(screenSize),
                                child: const PersistentOverlayWidget()))
                    ])))));
  }
}
