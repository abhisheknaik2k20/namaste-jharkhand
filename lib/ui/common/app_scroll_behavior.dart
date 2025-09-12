import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/common/platform_info.dart';

class AppScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices {
    final devices = Set<PointerDeviceKind>.from(super.dragDevices);
    devices.add(PointerDeviceKind.mouse);
    return devices;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const BouncingScrollPhysics();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) {
    if (PlatformInfo.isMobile) return child;
    return RawScrollbar(
      controller: details.controller,
      thumbVisibility: PlatformInfo.isDesktopOrWeb,
      thickness: 8,
      interactive: true,
      child: child,
    );
  }
}
