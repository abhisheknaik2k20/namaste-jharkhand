import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineUtils {
  static List<LatLng> decodePolyline(String encoded) {
    List<LatLng> points = [];
    int index = 0;
    int len = encoded.length;
    int lat = 0;
    int lng = 0;

    while (index < len) {
      int b;
      int shift = 0;
      int result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return points;
  }

  static String getSignDescription(int sign) {
    switch (sign) {
      case -98:
        return 'U-Turn';
      case -8:
        return 'U-Turn Left';
      case -7:
        return 'Keep Left';
      case -3:
        return 'Turn Sharp Left';
      case -2:
        return 'Turn Left';
      case -1:
        return 'Turn Slight Left';
      case 0:
        return 'Continue Straight';
      case 1:
        return 'Turn Slight Right';
      case 2:
        return 'Turn Right';
      case 3:
        return 'Turn Sharp Right';
      case 4:
        return 'Via Reached';
      case 5:
        return 'Destination Reached';
      case 6:
        return 'Exit Roundabout';
      case 7:
        return 'Keep Right';
      case 8:
        return 'U-Turn Right';
      default:
        return 'Continue';
    }
  }
}
