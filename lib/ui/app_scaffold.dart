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

  // Define the overlay size as a constant to ensure consistency
  static const double overlaySize = 120.0;
  static const EdgeInsets safeMargin = EdgeInsets.all(.5); // Margin from screen edges

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
    final safePadding = MediaQuery.of(context).padding;

    if (screenSize.width > 0 && screenSize.height > 0) {
      // Position overlay in bottom-right with safe margins
      final initialX = (screenSize.width - overlaySize - safeMargin.right - safePadding.right)
          .clamp(safeMargin.left + safePadding.left, screenSize.width - overlaySize);
      final initialY = (screenSize.height - overlaySize - safeMargin.bottom - safePadding.bottom)
          .clamp(safeMargin.top + safePadding.top, screenSize.height - overlaySize);

      setState(() {
        _overlayPosition = Offset(initialX, initialY);
        _hasInitializedPosition = true;
      });
    }
  }

  // Helper method to clamp position within safe bounds
  Offset _clampToSafeBounds(Offset position, Size screenSize) {
    final safePadding = MediaQuery.of(context).padding;

    final minX = safeMargin.left + safePadding.left;
    final maxX = screenSize.width - overlaySize - safeMargin.right - safePadding.right;
    final minY = safeMargin.top + safePadding.top;
    final maxY = screenSize.height - overlaySize - safeMargin.bottom - safePadding.bottom;

    return Offset(
      position.dx.clamp(minX, maxX),
      position.dy.clamp(minY, maxY),
    );
  }

  void _handlePanUpdate(DragUpdateDetails details, Size screenSize) {
    final newPosition = Offset(
      _overlayPosition.dx + details.delta.dx,
      _overlayPosition.dy + details.delta.dy,
    );

    final clampedPosition = _clampToSafeBounds(newPosition, screenSize);

    setState(() => _overlayPosition = clampedPosition);
    _lastPanVelocity = details.delta;
  }

  void _handlePanEnd(Size screenSize) {
    final velocity = _lastPanVelocity;
    final magnitude = velocity.distance;

    if (magnitude > 2.0) {
      final inertiaDistance = magnitude * 20;
      final normalizedVelocity = velocity / magnitude;

      // Calculate target position with inertia
      final targetPosition = Offset(
        _overlayPosition.dx + normalizedVelocity.dx * inertiaDistance,
        _overlayPosition.dy + normalizedVelocity.dy * inertiaDistance,
      );

      // Ensure target position is within bounds
      final clampedTargetPosition = _clampToSafeBounds(targetPosition, screenSize);

      _inertiaAnimation = Tween<Offset>(begin: _overlayPosition, end: clampedTargetPosition)
          .animate(CurvedAnimation(parent: _inertiaController, curve: Curves.decelerate));

      _inertiaController.reset();
      _inertiaController.forward();

      _inertiaAnimation.addListener(() {
        if (mounted) {
          // Double-check bounds during animation to prevent any edge cases
          final animationPosition = _clampToSafeBounds(_inertiaAnimation.value, screenSize);
          setState(() => _overlayPosition = animationPosition);
        }
      });
    }

    _lastPanVelocity = Offset.zero;
  }

  // Method to handle screen size changes (rotation, etc.)
  void _handleScreenSizeChange(Size newScreenSize) {
    if (_hasInitializedPosition) {
      final clampedPosition = _clampToSafeBounds(_overlayPosition, newScreenSize);
      if (clampedPosition != _overlayPosition) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) setState(() => _overlayPosition = clampedPosition);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenSize = mq.size;

    // Handle screen size changes
    if (_hasInitializedPosition && screenSize.width > 0 && screenSize.height > 0) {
      _handleScreenSizeChange(screenSize);
    }

    // Initialize position if not done yet
    if (!_hasInitializedPosition && screenSize.width > 0 && screenSize.height > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _initializeOverlayPosition());
    }

    appLogic.handleAppSizeChanged(screenSize);
    Animate.defaultDuration = WondersAppScaffold._style.times.fast;
    WondersAppScaffold._style = AppStyle(
      screenSize: context.sizePx,
      disableAnimations: mq.disableAnimations,
      highContrast: mq.highContrast,
    );

    return KeyedSubtree(
      key: ValueKey($styles.scale),
      child: Theme(
        data: $styles.colors.toThemeData(),
        child: DefaultTextStyle(
          style: $styles.text.body,
          child: ScrollConfiguration(
            behavior: AppScrollBehavior(),
            child: Stack(
              children: [
                widget.child,
                if (_isOverlayReady)
                  Positioned(
                    left: _hasInitializedPosition
                        ? _overlayPosition.dx
                        : _clampToSafeBounds(
                            Offset(screenSize.width - overlaySize - 20, screenSize.height - overlaySize - 20),
                            screenSize,
                          ).dx,
                    top: _hasInitializedPosition
                        ? _overlayPosition.dy
                        : _clampToSafeBounds(
                            Offset(screenSize.width - overlaySize - 20, screenSize.height - overlaySize - 20),
                            screenSize,
                          ).dy,
                    child: SizedBox(
                      width: overlaySize,
                      height: overlaySize,
                      child: GestureDetector(
                        onPanUpdate: (details) => _handlePanUpdate(details, screenSize),
                        onPanEnd: (_) => _handlePanEnd(screenSize),
                        child: const PersistentOverlayWidget(),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
