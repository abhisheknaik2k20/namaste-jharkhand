import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Helper class to create custom markers for Jharkhand locations
class JharkhandLocationMarker {
  static Future<Marker> createCurrentLocationMarker(LatLng position) async {
    final customIcon = await _createCustomUserMarkerIcon();

    return Marker(
      markerId: MarkerId('current_location_jharkhand'),
      position: position,
      icon: customIcon,
      infoWindow: InfoWindow(
        title: 'Your Current Location',
        snippet: 'Ranchi, Jharkhand, India',
      ),
      anchor: Offset(0.5, 0.5),
    );
  }

  // Create a custom circular user marker with pulse effect
  static Future<BitmapDescriptor> _createCustomUserMarkerIcon() async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final double size = 120.0;

    // Outer pulse circle (light blue)
    final Paint pulsePaint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2, pulsePaint);

    // Middle circle (blue)
    final Paint middlePaint = Paint()
      ..color = Colors.blue.withOpacity(0.7)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 3, middlePaint);

    // Inner circle (dark blue)
    final Paint innerPaint = Paint()
      ..color = Colors.blue.shade800
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 6, innerPaint);

    // White dot in center
    final Paint centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 12, centerPaint);

    // Border around middle circle
    final Paint borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;
    canvas.drawCircle(Offset(size / 2, size / 2), size / 3, borderPaint);

    final ui.Picture picture = pictureRecorder.endRecording();
    final ui.Image image = await picture.toImage(size.toInt(), size.toInt());
    final ByteData? byteData = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  static Circle createLocationAccuracyCircle(
    LatLng position, {
    double accuracy = 100.0,
  }) {
    return Circle(
      circleId: CircleId('current_location_accuracy'),
      center: position,
      radius: accuracy,
      fillColor: Colors.blue.withOpacity(0.1),
      strokeColor: Colors.blue.withOpacity(0.3),
      strokeWidth: 1,
    );
  }

  static Marker createTouristDestinationMarker({
    required String id,
    required LatLng position,
    required String title,
    required String snippet,
    required Color color,
  }) {
    double hue = BitmapDescriptor.hueRed;
    if (color == Colors.blue) {
      hue = BitmapDescriptor.hueBlue;
    } else if (color == Colors.green)
      hue = BitmapDescriptor.hueGreen;
    else if (color == Colors.orange)
      hue = BitmapDescriptor.hueOrange;
    else if (color == Colors.purple)
      hue = BitmapDescriptor.hueViolet;
    else if (color == Colors.yellow)
      hue = BitmapDescriptor.hueYellow;
    else if (color == Colors.cyan)
      hue = BitmapDescriptor.hueCyan;
    else if (color == Colors.teal)
      hue = BitmapDescriptor.hueAzure;

    return Marker(
      markerId: MarkerId(id),
      position: position,
      icon: BitmapDescriptor.defaultMarkerWithHue(hue),
      infoWindow: InfoWindow(title: title, snippet: snippet),
      anchor: Offset(0.5, 1.0),
    );
  }
}
