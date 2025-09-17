import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/tourist_destination.dart';

class JharkhandLocations {
  static const LatLng mockCurrentLocation = LatLng(23.3193983, 85.3229433);
  static final List<TouristDestination> destinations = [
    TouristDestination(
      name: 'Hundru Falls',
      description: 'Beautiful waterfall near Ranchi, 98m high cascade',
      location: LatLng(23.4242, 85.5853),
      clusterColor: Colors.blue,
      radius: 8000,
      category: 'Waterfall',
    ),
    TouristDestination(
      name: 'Betla National Park',
      description:
          'Wildlife sanctuary in Latehar district with tigers and elephants',
      location: LatLng(23.9047, 84.1808),
      clusterColor: Colors.green,
      radius: 12000,
      category: 'National Park',
    ),
    TouristDestination(
      name: 'Deoghar',
      description: 'Sacred city famous for Baba Baidyanath Temple',
      location: LatLng(24.4845, 86.6999),
      clusterColor: Colors.orange,
      radius: 10000,
      category: 'Religious',
    ),
    TouristDestination(
      name: 'Jagannath Temple',
      description: 'Historic temple in Ranchi with beautiful architecture',
      location: LatLng(23.3775, 85.3185),
      clusterColor: Colors.red,
      radius: 6000,
      category: 'Religious',
    ),
    TouristDestination(
      name: 'Patratu Valley',
      description: 'Scenic valley with hills, forests and Patratu Dam',
      location: LatLng(23.5400, 85.1850),
      clusterColor: Colors.purple,
      radius: 9000,
      category: 'Valley',
    ),
    TouristDestination(
      name: 'Parasnath Hill',
      description: 'Highest peak in Jharkhand, sacred Jain pilgrimage site',
      location: LatLng(23.9633, 86.1617),
      clusterColor: Colors.yellow,
      radius: 7000,
      category: 'Hill Station',
    ),
    TouristDestination(
      name: 'Tapovan Caves',
      description: 'Ancient caves with hot springs, meditation site',
      location: LatLng(24.0547, 85.4367),
      clusterColor: Colors.cyan,
      radius: 5000,
      category: 'Caves',
    ),
    TouristDestination(
      name: 'Tagore Hills',
      description: 'Scenic hills in Ranchi, popular picnic spot',
      location: LatLng(23.3703, 85.3347),
      clusterColor: Colors.teal,
      radius: 4000,
      category: 'Hill Station',
    ),
  ];

  // Get all destinations as markers
  static Set<Marker> getDestinationMarkers() {
    return destinations.map((destination) => destination.toMarker()).toSet();
  }

  // Get all destination clusters as circles
  static Set<Circle> getDestinationClusters() {
    return destinations
        .map((destination) => destination.toClusterCircle())
        .toSet();
  }

  // Get destination by name
  static TouristDestination? getDestinationByName(String name) {
    try {
      return destinations.firstWhere(
        (dest) => dest.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  // Get destinations by category
  static List<TouristDestination> getDestinationsByCategory(String category) {
    return destinations.where((dest) => dest.category == category).toList();
  }
}
