import 'dart:async';
import 'dart:ui';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/ui/common/modals/fullscreen_video_viewer.dart';
import 'package:namste_jharkhand/ui/common/utils/page_routes.dart';

class AppLogic {
  Size _appSize = Size.zero;
  bool isBootstrapComplete = false;
  List<Axis> supportedOrientations = [Axis.vertical, Axis.horizontal];
  List<Axis>? _supportedOrientationsOverride;
  set supportedOrientationsOverride(List<Axis>? value) {
    if (_supportedOrientationsOverride != value) {
      _supportedOrientationsOverride = value;
      _updateSystemOrientation();
    }
  }

  Future<void> bootstrap() async {
    await AppBitmaps.init();
    await FlutterDisplayMode.setHighRefreshRate();
    await settingsLogic.load();
    await localeLogic.load();
    wondersLogic.init();
    collectiblesLogic.init();
    await collectiblesLogic.load();
    await Future.delayed(1.milliseconds);
    isBootstrapComplete = true;
    final currentUser = FirebaseAuth.instance.currentUser;
    final isAuthenticated = currentUser != null;
    if (isAuthenticated) {
      appRouter.go(initialDeeplink ?? ScreenPaths.home);
    } else {
      appRouter.go(ScreenPaths.login);
    }
  }

  Future<T?> showFullscreenDialogRoute<T>(BuildContext context, Widget child, {bool transparent = false}) async =>
      await Navigator.of(context).push<T>(PageRoutes.dialog<T>(child, duration: $styles.times.pageTransition));

  void handleAppSizeChanged(Size appSize) {
    bool isSmall = display.size.shortestSide / display.devicePixelRatio < 600;
    supportedOrientations = isSmall ? [Axis.vertical] : [Axis.vertical, Axis.horizontal];
    _updateSystemOrientation();
    _appSize = appSize;
  }

  Display get display => PlatformDispatcher.instance.displays.first;
  bool shouldUseNavRail() => _appSize.width > _appSize.height && _appSize.height > 250;
  void _updateSystemOrientation() {
    final axisList = _supportedOrientationsOverride ?? supportedOrientations;
    final orientations = <DeviceOrientation>[];
    if (axisList.contains(Axis.vertical)) {
      orientations.addAll([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
    if (axisList.contains(Axis.horizontal)) {
      orientations.addAll([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
    SystemChrome.setPreferredOrientations(orientations);
  }

  void precacheWonderImages(BuildContext context) {
    final List<String> urls = [
      'assets/images/_common/google.png',
      'assets/images/chichen_itza/chichen.png',
      'assets/images/chichen_itza/foreground-left.png',
      'assets/images/chichen_itza/foreground-right.png',
      'assets/images/christ_the_redeemer/redeemer.png',
      'assets/images/christ_the_redeemer/foreground-left.png',
      'assets/images/christ_the_redeemer/foreground-right.png',
      'assets/images/ParasnathHill/ParasnathHill.png',
      'assets/images/ParasnathHill/foreground-left.png',
      'assets/images/ParasnathHill/foreground-right.png',
      'assets/images/great_wall_of_china/great-wall.png',
      'assets/images/great_wall_of_china/foreground-left.png',
      'assets/images/great_wall_of_china/foreground-right.png',
      'assets/images/machu_picchu/machu-picchu.png',
      'assets/images/machu_picchu/foreground-back.png',
      'assets/images/machu_picchu/foreground-front.png',
      'assets/images/TapovanCaves/TapovanCaves.png',
      'assets/images/TapovanCaves/foreground-left.png',
      'assets/images/TapovanCaves/foreground-right.png',
      'assets/images/pyramids/pyramids.png',
      'assets/images/pyramids/foreground-back.png',
      'assets/images/pyramids/foreground-front.png',
      'assets/images/taj_mahal/taj-mahal.png',
      'assets/images/taj_mahal/foreground-left.png',
      'assets/images/taj_mahal/foreground-right.png',
    ];
    for (var url in urls) {
      precacheImage(AssetImage(url), context, onError: (error, stackTrace) {});
    }
  }
}

class AppImageCache extends WidgetsFlutterBinding {
  @override
  ImageCache createImageCache() {
    this.imageCache.maximumSizeBytes = 250 << 20;
    return super.createImageCache();
  }
}
