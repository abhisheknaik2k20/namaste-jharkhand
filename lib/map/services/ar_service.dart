import 'dart:convert';
import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../models/ar_annotation.dart';
import 'places_service.dart';

class ARService {
  static const String _apiKey = 'AIzaSyDiWZ3198smjFepUa0ZAoHePSnSxuhTzRU';
  static const List<String> _placeTypes = [
    'restaurant',
    'gas_station',
    'hospital',
    'pharmacy',
    'bank',
    'atm',
    'shopping_mall',
    'hotel',
    'tourist_attraction',
  ];

  static const List<int> _radiuses = [100, 500, 1000];
  static Future<List<ARAnnotation>> fetchRealPlaces(Position position) async {
    // If API key is empty or null, immediately return fallback annotations
    // to avoid unnecessary HTTP request delays
    if (_apiKey.isEmpty) {
      print('Google Places API key is empty, using fallback annotations');
      return generateFallbackAnnotations(position, 8);
    }

    List<ARAnnotation> realAnnotations = [];

    try {
      for (final radius in _radiuses) {
        for (final placeType in _placeTypes) {
          final places = await _searchNearbyPlaces(
            position.latitude,
            position.longitude,
            placeType,
            radius,
          );
          for (final place in places) {
            if (!realAnnotations.any((a) => a.placeName == place.name)) {
              realAnnotations.add(
                ARAnnotation(
                  uid: const Uuid().v4(),
                  position: Position(
                    latitude: place.latitude,
                    longitude: place.longitude,
                    timestamp: DateTime.now(),
                    accuracy: 1,
                    altitude: position.altitude,
                    heading: 1,
                    speed: 1,
                    speedAccuracy: 1,
                    altitudeAccuracy: 0,
                    headingAccuracy: 0,
                  ),
                  type: _mapPlaceType(placeType),
                  placeName: place.name,
                  placeInfo: place,
                ),
              );
            }
            if (realAnnotations.length >= 15) break;
          }
          if (realAnnotations.length >= 15) break;
        }
        if (realAnnotations.length >= 15) break;
      }

      // Add fallback annotations if we don't have enough
      if (realAnnotations.length < 5) {
        realAnnotations.addAll(
          generateFallbackAnnotations(position, 5 - realAnnotations.length),
        );
      }
    } catch (e) {
      print('Error fetching real places: $e');
      return generateFallbackAnnotations(position, 8);
    }
    return realAnnotations;
  }

  /// Searches for nearby places using Google Places API
  static Future<List<PlaceInfo>> _searchNearbyPlaces(
    double lat,
    double lng,
    String placeType,
    int radius,
  ) async {
    try {
      final response = await http
          .get(
            Uri.parse(
              'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=$radius&type=$placeType&key=$_apiKey',
            ),
          )
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () => throw Exception('Request timeout'),
          );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'REQUEST_DENIED') {
          print('Google Places API request denied: ${data['error_message']}');
          return [];
        }
        return data['results']
                ?.map<PlaceInfo>((result) => PlaceInfo.fromJson(result))
                .take(3)
                .toList() ??
            [];
      } else {
        print('HTTP error ${response.statusCode}: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Error searching nearby places: $e');
    }
    return [];
  }

  /// Maps a Google Places API place type to an AR annotation type
  static ARAnnotationType _mapPlaceType(String placeType) =>
      const {
        'pharmacy': ARAnnotationType.pharmacy,
        'hospital': ARAnnotationType.pharmacy,
        'hotel': ARAnnotationType.hotel,
        'lodging': ARAnnotationType.hotel,
        'library': ARAnnotationType.library,
        'school': ARAnnotationType.library,
        'university': ARAnnotationType.library,
        'restaurant': ARAnnotationType.restaurant,
        'food': ARAnnotationType.restaurant,
        'gas_station': ARAnnotationType.gasStation,
        'bank': ARAnnotationType.bank,
        'atm': ARAnnotationType.bank,
        'shopping_mall': ARAnnotationType.shopping,
        'store': ARAnnotationType.shopping,
      }[placeType.toLowerCase()] ??
      ARAnnotationType.generic;

  /// Generates fallback annotations when API fails or returns insufficient results
  static List<ARAnnotation> generateFallbackAnnotations(
    Position position,
    int count,
  ) {
    const types = [
      ARAnnotationType.pharmacy,
      ARAnnotationType.hotel,
      ARAnnotationType.library,
      ARAnnotationType.restaurant,
      ARAnnotationType.gasStation,
    ];
    final random = Random();

    return List.generate(
      count,
      (i) => ARAnnotation(
        uid: const Uuid().v4(),
        position: Position(
          latitude: position.latitude + (random.nextDouble() - 0.5) * 0.01,
          longitude: position.longitude + (random.nextDouble() - 0.5) * 0.01,
          timestamp: DateTime.now(),
          accuracy: 1,
          altitude: 1,
          heading: 1,
          speed: 1,
          speedAccuracy: 1,
          altitudeAccuracy: 0,
          headingAccuracy: 0,
        ),
        type: types[random.nextInt(types.length)],
        placeName:
            'Generated ${types[random.nextInt(types.length)].name} ${i + 1}',
      ),
    );
  }

  /// Checks location permission
  static Future<bool> checkLocationPermission() async {
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    return permission != LocationPermission.denied &&
        permission != LocationPermission.deniedForever;
  }
}
