import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class TouristDestination {
  final String name;
  final String description;
  final LatLng location;
  final Color clusterColor;
  final double radius;
  final String category;

  TouristDestination({
    required this.name,
    required this.description,
    required this.location,
    required this.clusterColor,
    this.radius = 10000.0,
    required this.category,
  });

  Marker toMarker() => Marker(
    markerId: MarkerId(name.toLowerCase().replaceAll(' ', '_')),
    position: location,
    icon: BitmapDescriptor.defaultMarkerWithHue(_getMarkerHue()),
    infoWindow: InfoWindow(title: name, snippet: description),
  );

  double _getMarkerHue() {
    if (clusterColor == Colors.red) return BitmapDescriptor.hueRed;
    if (clusterColor == Colors.blue) return BitmapDescriptor.hueBlue;
    if (clusterColor == Colors.green) return BitmapDescriptor.hueGreen;
    if (clusterColor == Colors.orange) return BitmapDescriptor.hueOrange;
    if (clusterColor == Colors.purple) return BitmapDescriptor.hueViolet;
    if (clusterColor == Colors.yellow) return BitmapDescriptor.hueYellow;
    if (clusterColor == Colors.cyan) return BitmapDescriptor.hueCyan;
    return BitmapDescriptor.hueRose;
  }

  Circle toClusterCircle() {
    return Circle(
      circleId: CircleId('${name.toLowerCase().replaceAll(' ', '_')}_cluster'),
      center: location,
      radius: radius,
      fillColor: clusterColor.withOpacity(0.2),
      strokeColor: clusterColor,
      strokeWidth: 2,
    );
  }
}
