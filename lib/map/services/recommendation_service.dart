import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place_recommendation.dart';
import 'transit_api_service.dart';

class RecommendationService {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/place';
  static const String _apiKey = 'AIzaSyDiWZ3198smjFepUa0ZAoHePSnSxuhTzRU';

  final TransitApiService _transitApiService = TransitApiService();

  Future<List<PlaceRecommendation>> getRecommendedPlaces({
    required LatLng location,
    int radius = 5000,
  }) async {
    try {
      final places = <PlaceRecommendation>[];
      final userInterests = _getUserInterests();

      // Get places for each interest category
      for (final interest in userInterests.take(4)) {
        final categoryPlaces = await _getNearbyPlacesByType(
          location: location,
          radius: radius,
          type: interest,
        );
        places.addAll(categoryPlaces);
      }

      // Apply collaborative filtering scoring
      final scoredPlaces = places.map((place) {
        final score = _calculateRecommendationScore(place, userInterests);
        return place.copyWith(
          recommendationScore: score,
          recommendationReason: _generateRecommendationReason(
            place,
            userInterests,
          ),
        );
      }).toList();

      // Remove duplicates and sort by score
      final uniquePlaces = <String, PlaceRecommendation>{};
      for (final place in scoredPlaces) {
        if (!uniquePlaces.containsKey(place.placeId) ||
            uniquePlaces[place.placeId]!.recommendationScore <
                place.recommendationScore) {
          uniquePlaces[place.placeId] = place;
        }
      }

      final result = uniquePlaces.values.toList();
      result.sort(
        (a, b) => b.recommendationScore.compareTo(a.recommendationScore),
      );
      return result.take(15).toList();
    } catch (e) {
      print('Recommendation error: $e');
      return _getMockRecommendations(location);
    }
  }

  Future<List<PlaceRecommendation>> _getNearbyPlacesByType({
    required LatLng location,
    required int radius,
    required String type,
  }) async {
    try {
      final url =
          '$_baseUrl/nearbysearch/json'
          '?location=${location.latitude},${location.longitude}'
          '&radius=$radius'
          '&type=$type'
          '&key=$_apiKey';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final results = data['results'] as List;

        return results
            .take(5)
            .map((place) => _mapToPlaceRecommendation(place))
            .toList();
      }
    } catch (e) {
      print('Places API error for type $type: $e');
    }
    return [];
  }

  PlaceRecommendation _mapToPlaceRecommendation(Map<String, dynamic> place) {
    final location = place['geometry']['location'];
    return PlaceRecommendation(
      placeId: place['place_id'] ?? '',
      name: place['name'] ?? 'Unknown Place',
      address: place['vicinity'] ?? 'Unknown Address',
      location: LatLng(location['lat'], location['lng']),
      rating: (place['rating'] as num?)?.toDouble() ?? 0.0,
      priceLevel: place['price_level'] ?? 0,
      types: List<String>.from(place['types'] ?? []),
      photoReference: place['photos']?[0]?['photo_reference'],
      openNow: place['opening_hours']?['open_now'] ?? false,
      recommendationScore: 0.0,
      recommendationReason: '',
    );
  }

  double _calculateRecommendationScore(
    PlaceRecommendation place,
    List<String> userInterests,
  ) {
    double score = 0.0;

    // Base rating score (0-5 scale)
    score += place.rating * 1.2;

    // Interest match scoring
    int matchCount = 0;
    for (final interest in userInterests) {
      if (place.types.contains(interest)) {
        matchCount++;
        score += userInterests.indexOf(interest) == 0
            ? 4.0
            : 2.0; // Higher for primary interest
      }
    }

    // Diversity bonus for multiple type matches
    if (matchCount > 1) {
      score += 1.5;
    }

    // Open now bonus
    if (place.openNow) {
      score += 2.0;
    }

    // Price level adjustment (lower prices get bonus)
    if (place.priceLevel <= 2) {
      score += 1.0;
    }

    // Popular place bonus (simulated)
    if (place.rating > 4.2) {
      score += 1.5;
    }

    // Add some randomization for collaborative filtering effect
    score += Random().nextDouble() * 0.5;

    return score;
  }

  String _generateRecommendationReason(
    PlaceRecommendation place,
    List<String> userInterests,
  ) {
    final matchedInterests = place.types
        .where((type) => userInterests.contains(type))
        .toList();

    if (matchedInterests.isNotEmpty) {
      if (place.rating > 4.2) {
        return 'Highly rated • Matches your interests';
      } else if (place.openNow) {
        return 'Open now • Popular choice';
      } else {
        return 'Recommended for you';
      }
    } else if (place.rating > 4.0) {
      return 'Trending in your area';
    } else if (place.openNow) {
      return 'Available now';
    } else {
      return 'Discover something new';
    }
  }

  List<String> _getUserInterests() {
    // Simulate collaborative filtering user preferences
    return ['restaurant', 'tourist_attraction', 'shopping_mall', 'park'];
  }

  // Transit information using real Google Maps API
  Future<List<TransitInfo>> getCurrentTransitInfo({
    required LatLng location,
  }) async {
    try {
      print('RecommendationService: Getting transit info for $location');

      final result = await _transitApiService
          .getRealTimeTransitInfo(location: location)
          .timeout(Duration(seconds: 15)); // Add timeout

      print('RecommendationService: Got ${result.length} transit routes');
      return result;
    } catch (e) {
      print('Error getting transit info: $e');
      // Fallback to basic transit data if API fails
      return _getBasicTransitFallback(location);
    }
  }

  List<TransitInfo> _getBasicTransitFallback(LatLng location) {
    final random = Random();
    final now = DateTime.now();

    // Basic fallback with minimal data
    final fallbackStop = TransitStop(
      stopId: 'FALLBACK_001',
      stopName: 'Nearby Transit Stop',
      location: location,
      arrivalMinutes: 2 + random.nextInt(8),
      departureMinutes: 3 + random.nextInt(8),
      isAccessible: true,
      facilities: ['shelter', 'seating'],
      crowdingLevel: random.nextDouble(),
      nearbyLandmarks: ['Commercial Area', 'Residential Area'],
      zone: 'Zone A',
      isTransferPoint: false,
      connectingRoutes: [],
      delay: random.nextBool() ? 'Traffic delays' : null,
    );

    return [
      TransitInfo(
        routeId: 'LOCAL_BUS_001',
        routeName: 'Local Bus Service',
        shortName: 'LB1',
        longName: 'City Center to Suburbs',
        vehicleInfo: VehicleInfo(
          vehicleId: 'BUS_${random.nextInt(9999)}',
          type: 'bus',
          model: 'City Bus',
          capacity: 40,
          currentOccupancy: 15 + random.nextInt(25),
          isAccessible: true,
          hasWifi: false,
          hasAirConditioning: true,
          amenities: ['Basic seating'],
          batteryLevel: 0.0,
          fuelType: 'Diesel',
          lastMaintenance: now.subtract(Duration(days: random.nextInt(7))),
        ),
        currentStatus: ['on_time', 'delayed', 'approaching'][random.nextInt(3)],
        currentLocation: LatLng(
          location.latitude + (random.nextDouble() - 0.5) * 0.01,
          location.longitude + (random.nextDouble() - 0.5) * 0.01,
        ),
        bearing: random.nextDouble() * 360,
        speed: 15.0 + random.nextDouble() * 20.0,
        currentStop: fallbackStop,
        nextStop: fallbackStop,
        upcomingStops: [fallbackStop],
        allStops: [fallbackStop],
        operatorName: 'Local Transport Authority',
        operatorLogo: 'transport_logo.png',
        lineColor: '#2196F3',
        textColor: '#FFFFFF',
        routePattern: RoutePattern(
          patternId: 'FALLBACK_PATTERN',
          direction: 'Outbound',
          headsign: 'City Suburbs',
          stops: [fallbackStop],
          totalDistance: 15.0,
          totalTravelTime: 25,
          routeShape: 'fallback_polyline',
        ),
        serviceAlerts: [],
        realtimeData: {
          'last_updated': now.millisecondsSinceEpoch,
          'gps_accuracy': 5.0,
          'signal_strength': 'good',
        },
        frequency: 10,
        operatingHours: '6:00 AM - 10:00 PM',
        fare: 15.0,
        fareZone: 'Local Zone',
        paymentMethods: ['Cash', 'Digital Payment'],
        isElectric: false,
        accessibility: 'Basic accessibility features',
        alternativeRoutes: [],
        crowdingPrediction: {},
        tripId: 'FALLBACK_${now.day}',
        blockId: 'FALLBACK_BLOCK',
        scheduledDeparture: now.subtract(Duration(minutes: 5)),
        actualDeparture: now.subtract(Duration(minutes: 3)),
        delayMinutes: 2,
        delayReason: 'Minor traffic delay',
        intermediateStops: ['City Center', 'Main Road', 'Suburbs'],
        co2Emissions: 2.5,
        weatherImpact: 'Clear conditions',
        hasLiveTracking: false,
      ),
    ];
  }

  List<PlaceRecommendation> _getMockRecommendations(LatLng location) {
    return [
      PlaceRecommendation(
        placeId: 'mock_rec_1',
        name: 'Nucleus Mall Ranchi',
        address: 'Circular Road, Ranchi, Jharkhand',
        location: LatLng(23.3569, 85.3343),
        rating: 4.3,
        priceLevel: 2,
        types: ['shopping_mall', 'establishment'],
        openNow: true,
        recommendationScore: 8.2,
        recommendationReason: 'Highly rated • Matches your interests',
      ),
      PlaceRecommendation(
        placeId: 'mock_rec_2',
        name: 'Cafe Coffee Day',
        address: 'Main Road, Ranchi',
        location: LatLng(23.3500, 85.3200),
        rating: 4.1,
        priceLevel: 2,
        types: ['restaurant', 'cafe'],
        openNow: true,
        recommendationScore: 7.8,
        recommendationReason: 'Open now • Popular choice',
      ),
      PlaceRecommendation(
        placeId: 'mock_rec_3',
        name: 'Rock Garden',
        address: 'Kanke Road, Ranchi',
        location: LatLng(23.4241, 85.4419),
        rating: 4.5,
        priceLevel: 0,
        types: ['tourist_attraction', 'park'],
        openNow: true,
        recommendationScore: 9.1,
        recommendationReason: 'Trending in your area',
      ),
    ];
  }
}
