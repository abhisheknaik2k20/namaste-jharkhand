import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'navigation_instruction.dart';
import '../utils/formatting_utils.dart';

class RouteInfo {
  final List<LatLng> polylinePoints;
  final List<NavigationInstruction> instructions;
  final double distanceInMeters;
  final int timeInMilliseconds;

  RouteInfo({
    required this.polylinePoints,
    required this.instructions,
    required this.distanceInMeters,
    required this.timeInMilliseconds,
  });

  String get formattedDistance =>
      FormattingUtils.formatDistance(distanceInMeters);

  String get formattedTime => FormattingUtils.formatTime(timeInMilliseconds);

  bool get hasInstructions => instructions.isNotEmpty;
  bool get hasRoute => polylinePoints.isNotEmpty;
}
