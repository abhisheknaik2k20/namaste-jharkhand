import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/formatting_utils.dart';

class NavigationInstruction {
  final String text;
  final double distance;
  final int time;
  final String sign;
  final LatLng coordinate;

  NavigationInstruction({
    required this.text,
    required this.distance,
    required this.time,
    required this.sign,
    required this.coordinate,
  });

  factory NavigationInstruction.fromJson(Map<String, dynamic> json) {
    return NavigationInstruction(
      text: json['text'] ?? '',
      distance: (json['distance'] ?? 0).toDouble(),
      time: json['time'] ?? 0,
      sign: json['sign']?.toString() ?? '0',
      coordinate: LatLng(
        (json['interval']?[0] != null) ? (json['interval'][0]).toDouble() : 0.0,
        (json['interval']?[1] != null) ? (json['interval'][1]).toDouble() : 0.0,
      ),
    );
  }
  String get instructionType {
    switch (sign) {
      case '0':
        return 'Continue';
      case '1':
        return 'Turn slight right';
      case '2':
        return 'Turn right';
      case '3':
        return 'Turn sharp right';
      case '4':
        return 'Turn around';
      case '-1':
        return 'Turn slight left';
      case '-2':
        return 'Turn left';
      case '-3':
        return 'Turn sharp left';
      case '5':
        return 'Finish';
      case '6':
        return 'Via point reached';
      default:
        return 'Continue';
    }
  }

  String get formattedDistance => FormattingUtils.formatDistance(distance);

  String get formattedTime => FormattingUtils.formatTime(time);
}
