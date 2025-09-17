import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusPosition {
  LatLng position;
  double bearing;
  BusPosition({required this.position, required this.bearing});
}
