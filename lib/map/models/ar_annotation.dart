import 'package:ar_location_view/ar_annotation.dart';
import 'package:flutter/material.dart';
import '../services/places_service.dart';

enum ARAnnotationType {
  pharmacy,
  hotel,
  library,
  restaurant,
  gasStation,
  bank,
  shopping,
  generic,
}

extension ARAnnotationTypeX on ARAnnotationType {
  String get name => const [
    'Pharmacy',
    'Hotel',
    'Library',
    'Restaurant',
    'Gas Station',
    'Bank',
    'Shopping',
    'Place',
  ][index];

  IconData get icon => const [
    Icons.local_pharmacy,
    Icons.hotel,
    Icons.local_library,
    Icons.restaurant,
    Icons.local_gas_station,
    Icons.account_balance,
    Icons.shopping_cart,
    Icons.place,
  ][index];

  Color get color => const [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.pink,
    Colors.grey,
  ][index];
}

class ARAnnotation extends ArAnnotation {
  final ARAnnotationType type;
  final String? placeName;
  final PlaceInfo? placeInfo;

  ARAnnotation({
    required super.uid,
    required super.position,
    required this.type,
    this.placeName,
    this.placeInfo,
  });
}
