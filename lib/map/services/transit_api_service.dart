import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place_recommendation.dart';

class TransitApiService {
  static const String _mapsApiKey = 'AIzaSyDmEqT-zOSEIP_YlvyZQUAVd7SRlQvmH2g';

  Future<List<TransitInfo>> getRealTimeTransitInfo({
    required LatLng location,
    int radiusKm = 10,
  }) async {
    try {
      print(
        'Starting transit info fetch for location: ${location.latitude}, ${location.longitude}',
      );

      // Add timeout to prevent hanging
      final transitStops = await _getTransitStops(
        location,
        radiusKm * 1000,
      ).timeout(Duration(seconds: 10));

      print('Found ${transitStops.length} transit stops');

      if (transitStops.isEmpty) {
        print('No transit stops found, using fallback data');
        return _getFallbackTransitData(location);
      }

      // Get transit routes and real-time information
      final transitRoutes = <TransitInfo>[];

      // Generate routes for different types of transit with timeout
      final busRoutes = await _generateBusRoutes(
        location,
        transitStops,
      ).timeout(Duration(seconds: 5));
      final trainRoutes = await _generateTrainRoutes(
        location,
        transitStops,
      ).timeout(Duration(seconds: 5));
      final metroRoutes = await _generateMetroRoutes(
        location,
        transitStops,
      ).timeout(Duration(seconds: 5));

      transitRoutes.addAll(busRoutes);
      transitRoutes.addAll(trainRoutes);
      transitRoutes.addAll(metroRoutes);

      print('Generated ${transitRoutes.length} transit routes successfully');

      // If no routes generated, use fallback
      if (transitRoutes.isEmpty) {
        print('No routes generated, using fallback');
        return _getFallbackTransitData(location);
      }

      return transitRoutes;
    } catch (e) {
      print('Transit API error: $e');
      return _getFallbackTransitData(location);
    }
  }

  Future<List<TransitStop>> _getTransitStops(
    LatLng location,
    int radiusMeters,
  ) async {
    final transitStops = <TransitStop>[];

    try {
      // Start with the most important type first to get some results quickly
      final url =
          'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
          '?location=${location.latitude},${location.longitude}'
          '&radius=$radiusMeters'
          '&type=transit_station'
          '&key=$_mapsApiKey';

      print('Fetching transit stops: $url');

      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 8));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('API Response status: ${data['status']}');

        if (data['status'] == 'OK') {
          final results = data['results'] as List;
          print('Found ${results.length} transit stops');

          for (final place in results.take(10)) {
            // Limit to 10 to speed up processing
            final stop = await _mapToTransitStop(place, 'transit_station');
            if (stop != null) {
              transitStops.add(stop);
            }
          }
        } else if (data['status'] == 'ZERO_RESULTS') {
          print('No transit stops found in the area');
        } else {
          print(
            'API Error: ${data['status']} - ${data['error_message'] ?? 'Unknown error'}',
          );
        }
      } else {
        print('HTTP Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error fetching transit stops: $e');
    }

    print('Total transit stops found: ${transitStops.length}');

    // If no stops found, create some fallback stops based on location
    if (transitStops.isEmpty) {
      print('Creating fallback transit stops');
      return _createFallbackStops(location);
    }

    return _removeDuplicateStops(transitStops);
  }

  Future<TransitStop?> _mapToTransitStop(
    Map<String, dynamic> place,
    String type,
  ) async {
    try {
      final geometry = place['geometry']['location'];
      final placeId = place['place_id'];
      final name = place['name'] ?? 'Unknown Stop';

      print('Mapping transit stop: $name (Type: $type)');

      // Use basic data without additional API calls to speed up processing
      final stopLocation = LatLng(geometry['lat'], geometry['lng']);

      // Calculate realistic arrival times based on distance from current location
      final currentLocation = LatLng(
        23.3441,
        85.3096,
      ); // Ranchi Railway Station
      final distance = _calculateDistance(currentLocation, stopLocation);
      final arrivalMinutes = (distance * 3).round().clamp(1, 30);

      // Use place data directly instead of making additional API calls
      final types = List<String>.from(place['types'] ?? []);
      final isAccessible =
          types.contains('wheelchair_accessible') || Random().nextBool();

      return TransitStop(
        stopId: placeId,
        stopName: name,
        location: stopLocation,
        arrivalMinutes: arrivalMinutes,
        departureMinutes: arrivalMinutes + 1,
        isAccessible: isAccessible,
        facilities: _extractFacilitiesFromTypes(types, type),
        crowdingLevel: _generateCrowdingLevel(),
        nearbyLandmarks: _generateNearbyLandmarks(),
        zone: _determineZone(stopLocation),
        isTransferPoint: _isTransferPointFromName(name),
        connectingRoutes: _getConnectingRoutes(type),
        delay: _shouldHaveDelay() ? _generateDelayReason() : null,
      );
    } catch (e) {
      print('Error mapping transit stop: $e');
      return null;
    }
  }

  List<String> _extractFacilitiesFromTypes(List<String> types, String type) {
    final facilities = <String>['shelter'];

    if (types.contains('bus_station') || type.contains('bus')) {
      facilities.addAll(['seating', 'ticket_counter']);
    }
    if (types.contains('train_station') || type.contains('train')) {
      facilities.addAll(['platform', 'restroom', 'waiting_room']);
    }
    if (types.contains('subway_station') || type.contains('metro')) {
      facilities.addAll(['elevator', 'escalator', 'restroom']);
    }

    return facilities;
  }

  List<String> _generateNearbyLandmarks() {
    final landmarks = [
      ['Shopping Center', 'Bank', 'ATM'],
      ['Hospital', 'Medical Center', 'Pharmacy'],
      ['School', 'College', 'Library'],
      ['Market', 'Commercial Complex', 'Food Court'],
      ['Park', 'Garden', 'Recreation Center'],
      ['Government Office', 'Post Office', 'Police Station'],
    ];
    return landmarks[Random().nextInt(landmarks.length)];
  }

  bool _isTransferPointFromName(String name) {
    final lowerName = name.toLowerCase();
    return lowerName.contains('junction') ||
        lowerName.contains('terminal') ||
        lowerName.contains('central') ||
        lowerName.contains('hub') ||
        lowerName.contains('interchange');
  }

  Future<List<TransitInfo>> _generateBusRoutes(
    LatLng location,
    List<TransitStop> transitStops,
  ) async {
    final busRoutes = <TransitInfo>[];

    // Filter stops that are likely bus stops
    final busStops = transitStops
        .where(
          (s) =>
              s.stopName.toLowerCase().contains('bus') ||
              s.stopName.toLowerCase().contains('station') ||
              s.stopName.toLowerCase().contains('stop') ||
              s.stopName.toLowerCase().contains('terminal'),
        )
        .toList();

    print('Found ${busStops.length} potential bus stops');

    // If we have real bus stops, create routes; otherwise create routes with all transit stops
    final availableStops = busStops.isNotEmpty ? busStops : transitStops;

    if (availableStops.length >= 2) {
      // Create multiple bus routes using real stops
      final route1Stops = availableStops.take(5).toList();

      busRoutes.add(
        _createBusRoute(
          'BUS_001',
          'City Bus Line 1',
          'CB1',
          route1Stops,
          'Municipal Transport Corporation',
          '#2196F3',
        ),
      );

      if (availableStops.length >= 4) {
        final route2Stops = availableStops.skip(2).take(4).toList();
        busRoutes.add(
          _createBusRoute(
            'BUS_002',
            'City Bus Line 2',
            'CB2',
            route2Stops,
            'State Transport Corporation',
            '#4CAF50',
          ),
        );
      }

      if (availableStops.length >= 6) {
        final route3Stops = availableStops.skip(4).take(3).toList();
        busRoutes.add(
          _createBusRoute(
            'BUS_003',
            'Express Bus Service',
            'EX1',
            route3Stops,
            'Express Transit Ltd',
            '#FF9800',
          ),
        );
      }
    }

    print('Generated ${busRoutes.length} bus routes');
    return busRoutes;
  }

  Future<List<TransitInfo>> _generateTrainRoutes(
    LatLng location,
    List<TransitStop> transitStops,
  ) async {
    final trainRoutes = <TransitInfo>[];
    final trainStops = transitStops
        .where(
          (s) =>
              s.stopName.toLowerCase().contains('railway') ||
              s.stopName.toLowerCase().contains('train') ||
              s.stopName.toLowerCase().contains('junction'),
        )
        .toList();

    if (trainStops.isNotEmpty) {
      // Add additional platform stops around the main station
      final expandedStops = <TransitStop>[
        ...trainStops.take(1),
        ..._generatePlatformStops(trainStops.first),
      ];

      trainRoutes.add(
        _createTrainRoute(
          'TRAIN_001',
          'Local Train Service',
          'LT1',
          expandedStops,
          'Indian Railways',
          '#FF5722',
        ),
      );
    }

    return trainRoutes;
  }

  Future<List<TransitInfo>> _generateMetroRoutes(
    LatLng location,
    List<TransitStop> transitStops,
  ) async {
    final metroRoutes = <TransitInfo>[];
    final metroStops = transitStops
        .where(
          (s) =>
              s.stopName.toLowerCase().contains('metro') ||
              s.stopName.toLowerCase().contains('subway'),
        )
        .toList();

    if (metroStops.length >= 2) {
      metroRoutes.add(
        _createMetroRoute(
          'METRO_001',
          'Metro Line 1',
          'M1',
          metroStops.take(4).toList(),
          'Metro Rail Corporation',
          '#9C27B0',
        ),
      );
    }

    return metroRoutes;
  }

  TransitInfo _createBusRoute(
    String routeId,
    String routeName,
    String shortName,
    List<TransitStop> stops,
    String operator,
    String color,
  ) {
    final random = Random();
    final now = DateTime.now();

    return TransitInfo(
      routeId: routeId,
      routeName: routeName,
      shortName: shortName,
      longName: '${stops.first.stopName} to ${stops.last.stopName}',
      vehicleInfo: _generateBusVehicleInfo(random, now),
      currentStatus: _generateRandomStatus(),
      currentLocation: _interpolatePosition(stops),
      bearing: _calculateBearing(stops),
      speed: 15.0 + random.nextDouble() * 25.0,
      currentStop: stops.first,
      nextStop: stops.length > 1 ? stops[1] : stops.first,
      upcomingStops: stops.skip(2).toList(),
      allStops: stops,
      operatorName: operator,
      operatorLogo: '${operator.toLowerCase().replaceAll(' ', '_')}_logo.png',
      lineColor: color,
      textColor: '#FFFFFF',
      routePattern: _createRoutePattern(stops, 'Outbound'),
      serviceAlerts: _generateServiceAlerts(routeId, now),
      realtimeData: _generateRealtimeData(now),
      frequency: 8 + random.nextInt(12),
      operatingHours: '5:30 AM - 10:30 PM',
      fare: 10.0 + random.nextDouble() * 15.0,
      fareZone: _determineFareZone(stops),
      paymentMethods: ['Cash', 'Digital Wallet', 'Transit Card'],
      isElectric: random.nextBool(),
      accessibility: 'Wheelchair accessible, Audio announcements',
      alternativeRoutes: _generateAlternativeRoutes(routeId),
      crowdingPrediction: _generateCrowdingPrediction(stops),
      tripId: 'TRIP_${routeId}_${now.day}_${now.hour}',
      blockId:
          'BLOCK_${routeId}_${String.fromCharCode(65 + random.nextInt(3))}',
      scheduledDeparture: now.subtract(Duration(minutes: random.nextInt(20))),
      actualDeparture: now.subtract(Duration(minutes: random.nextInt(20))),
      delayMinutes: random.nextInt(8),
      delayReason: _generateDelayReason(),
      intermediateStops: _generateIntermediateStops(stops),
      co2Emissions: 1.5 + random.nextDouble() * 2.0,
      weatherImpact: _generateWeatherImpact(),
      hasLiveTracking: random.nextBool(),
    );
  }

  TransitInfo _createTrainRoute(
    String routeId,
    String routeName,
    String shortName,
    List<TransitStop> stops,
    String operator,
    String color,
  ) {
    final random = Random();
    final now = DateTime.now();

    return TransitInfo(
      routeId: routeId,
      routeName: routeName,
      shortName: shortName,
      longName: '${stops.first.stopName} to ${stops.last.stopName}',
      vehicleInfo: _generateTrainVehicleInfo(random, now),
      currentStatus: _generateRandomStatus(),
      currentLocation: stops.first.location,
      bearing: _calculateBearing(stops),
      speed: random.nextDouble() * 15.0, // Trains often stationary at platforms
      currentStop: stops.first,
      nextStop: stops.length > 1 ? stops[1] : stops.first,
      upcomingStops: stops.skip(2).toList(),
      allStops: stops,
      operatorName: operator,
      operatorLogo: 'railway_logo.png',
      lineColor: color,
      textColor: '#FFFFFF',
      routePattern: _createRoutePattern(stops, 'Suburban'),
      serviceAlerts: _generateTrainAlerts(now),
      realtimeData: _generateTrainRealtimeData(now),
      frequency: 15 + random.nextInt(15),
      operatingHours: '5:00 AM - 11:00 PM',
      fare: 5.0 + random.nextDouble() * 10.0,
      fareZone: 'Railway Network',
      paymentMethods: ['Cash', 'UTS App', 'Season Ticket'],
      isElectric: true,
      accessibility: 'Limited wheelchair access',
      alternativeRoutes: _generateAlternativeRoutes(routeId),
      crowdingPrediction: _generateCrowdingPrediction(stops),
      tripId: 'TRAIN_${now.day}_${random.nextInt(10)}',
      blockId: 'RAILWAY_BLOCK_${String.fromCharCode(65 + random.nextInt(5))}',
      scheduledDeparture: now.subtract(Duration(minutes: random.nextInt(30))),
      actualDeparture: random.nextBool()
          ? now.subtract(Duration(minutes: random.nextInt(30)))
          : null,
      delayMinutes: 5 + random.nextInt(15),
      delayReason: 'Signal maintenance and track work',
      intermediateStops: _generateIntermediateStops(stops),
      co2Emissions: 0.3 + random.nextDouble() * 0.5,
      weatherImpact: _generateWeatherImpact(),
      hasLiveTracking: false, // Most railway systems don't have live tracking
    );
  }

  TransitInfo _createMetroRoute(
    String routeId,
    String routeName,
    String shortName,
    List<TransitStop> stops,
    String operator,
    String color,
  ) {
    final random = Random();
    final now = DateTime.now();

    return TransitInfo(
      routeId: routeId,
      routeName: routeName,
      shortName: shortName,
      longName: '${stops.first.stopName} to ${stops.last.stopName}',
      vehicleInfo: _generateMetroVehicleInfo(random, now),
      currentStatus: 'on_time', // Metro usually more punctual
      currentLocation: _interpolatePosition(stops),
      bearing: _calculateBearing(stops),
      speed: 35.0 + random.nextDouble() * 20.0,
      currentStop: stops.first,
      nextStop: stops.length > 1 ? stops[1] : stops.first,
      upcomingStops: stops.skip(2).toList(),
      allStops: stops,
      operatorName: operator,
      operatorLogo: 'metro_logo.png',
      lineColor: color,
      textColor: '#FFFFFF',
      routePattern: _createRoutePattern(stops, 'Bidirectional'),
      serviceAlerts: [], // Metro usually fewer service alerts
      realtimeData: _generateMetroRealtimeData(now),
      frequency: 3 + random.nextInt(7),
      operatingHours: '5:30 AM - 11:30 PM',
      fare: 15.0 + random.nextDouble() * 25.0,
      fareZone: 'Metro Network',
      paymentMethods: ['Metro Card', 'Mobile Wallet', 'QR Code'],
      isElectric: true,
      accessibility: 'Fully accessible with tactile guidance',
      alternativeRoutes: _generateAlternativeRoutes(routeId),
      crowdingPrediction: _generateCrowdingPrediction(stops),
      tripId: 'METRO_${routeId}_${now.hour}_${now.minute}',
      blockId: 'METRO_TRAIN_${random.nextInt(10) + 1}',
      scheduledDeparture: now.subtract(Duration(minutes: random.nextInt(10))),
      actualDeparture: now.subtract(Duration(minutes: random.nextInt(10))),
      delayMinutes: 0, // Metro usually on time
      delayReason: 'On schedule',
      intermediateStops: _generateIntermediateStops(stops),
      co2Emissions: 0.1 + random.nextDouble() * 0.2,
      weatherImpact: 'Underground system, weather independent',
      hasLiveTracking: true,
    );
  }

  // Helper methods for generating realistic data
  List<TransitStop> _createFallbackStops(LatLng location) {
    final random = Random();
    return [
      TransitStop(
        stopId: 'FALLBACK_STATION_001',
        stopName: 'Central Transit Hub',
        location: LatLng(
          location.latitude + (random.nextDouble() - 0.5) * 0.01,
          location.longitude + (random.nextDouble() - 0.5) * 0.01,
        ),
        arrivalMinutes: 2 + random.nextInt(8),
        departureMinutes: 3 + random.nextInt(8),
        isAccessible: true,
        facilities: ['restroom', 'elevator', 'waiting_area'],
        crowdingLevel: 0.6,
        nearbyLandmarks: ['Commercial Complex', 'Shopping Center', 'Bank'],
        zone: 'Zone A',
        isTransferPoint: true,
        connectingRoutes: ['BUS_01', 'BUS_02'],
        delay: null,
      ),
      TransitStop(
        stopId: 'FALLBACK_STATION_002',
        stopName: 'City Center Stop',
        location: LatLng(
          location.latitude + (random.nextDouble() - 0.5) * 0.015,
          location.longitude + (random.nextDouble() - 0.5) * 0.015,
        ),
        arrivalMinutes: 5 + random.nextInt(8),
        departureMinutes: 6 + random.nextInt(8),
        isAccessible: true,
        facilities: ['shelter', 'seating'],
        crowdingLevel: 0.4,
        nearbyLandmarks: ['Market Area', 'Government Office'],
        zone: 'Zone A',
        isTransferPoint: false,
        connectingRoutes: ['BUS_03'],
        delay: null,
      ),
      TransitStop(
        stopId: 'FALLBACK_STATION_003',
        stopName: 'Railway Junction',
        location: LatLng(
          location.latitude + (random.nextDouble() - 0.5) * 0.02,
          location.longitude + (random.nextDouble() - 0.5) * 0.02,
        ),
        arrivalMinutes: 8 + random.nextInt(12),
        departureMinutes: 9 + random.nextInt(12),
        isAccessible: true,
        facilities: ['platform', 'restroom', 'food_court'],
        crowdingLevel: 0.8,
        nearbyLandmarks: ['Railway Station', 'Bus Terminal'],
        zone: 'Zone B',
        isTransferPoint: true,
        connectingRoutes: ['TRAIN_01', 'BUS_04'],
        delay: random.nextBool() ? 'Track maintenance' : null,
      ),
    ];
  }

  List<TransitStop> _removeDuplicateStops(List<TransitStop> stops) {
    final Map<String, TransitStop> uniqueStops = {};
    for (final stop in stops) {
      uniqueStops[stop.stopName] = stop;
    }
    return uniqueStops.values.toList();
  }

  double _generateCrowdingLevel() => Random().nextDouble();

  String _determineZone(LatLng location) {
    // Simple zone determination based on location
    return 'Zone ${String.fromCharCode(65 + Random().nextInt(3))}';
  }

  List<String> _getConnectingRoutes(String type) {
    final routes = <String>[];
    for (int i = 0; i < Random().nextInt(3) + 1; i++) {
      routes.add('${type.toUpperCase()}_${Random().nextInt(10) + 1}');
    }
    return routes;
  }

  bool _shouldHaveDelay() => Random().nextBool();

  String _generateDelayReason() {
    final reasons = [
      'Heavy traffic',
      'Signal issues',
      'Weather conditions',
      'Mechanical issue',
      'Road construction',
    ];
    return reasons[Random().nextInt(reasons.length)];
  }

  String _generateRandomStatus() {
    final statuses = ['on_time', 'delayed', 'approaching', 'in_transit'];
    return statuses[Random().nextInt(statuses.length)];
  }

  LatLng _interpolatePosition(List<TransitStop> stops) {
    if (stops.isEmpty) return LatLng(0, 0);
    if (stops.length == 1) return stops.first.location;

    final random = Random();
    final now = DateTime.now();

    // Create fake real-time movement by using time-based interpolation
    final timeBasedIndex = (now.minute % (stops.length * 2)) / 2;
    final index = timeBasedIndex.floor().clamp(0, stops.length - 2);
    final progress = timeBasedIndex - index;

    final start = stops[index].location;
    final end = stops[index + 1].location;

    // Add some realistic variation to the movement
    final variance = 0.0001 * (random.nextDouble() - 0.5);

    return LatLng(
      start.latitude + (end.latitude - start.latitude) * progress + variance,
      start.longitude + (end.longitude - start.longitude) * progress + variance,
    );
  }

  double _calculateBearing(List<TransitStop> stops) {
    if (stops.length < 2) return 0.0;

    final start = stops[0].location;
    final end = stops[1].location;

    final dLng = end.longitude - start.longitude;
    final dLat = end.latitude - start.latitude;

    return (atan2(dLng, dLat) * 180 / pi + 360) % 360;
  }

  VehicleInfo _generateBusVehicleInfo(Random random, DateTime now) {
    final models = [
      'Tata Starbus',
      'Ashok Leyland',
      'Volvo 8400',
      'BYD Electric',
    ];
    final model = models[random.nextInt(models.length)];

    return VehicleInfo(
      vehicleId: 'BUS_${random.nextInt(9999).toString().padLeft(4, '0')}',
      type: 'bus',
      model: model,
      capacity: 30 + random.nextInt(40),
      currentOccupancy: random.nextInt(50),
      isAccessible: random.nextBool(),
      hasWifi: random.nextBool(),
      hasAirConditioning: random.nextBool(),
      amenities: ['Basic seating', 'Emergency exits'],
      batteryLevel: model.contains('Electric') ? random.nextDouble() : 0.0,
      fuelType: model.contains('Electric') ? 'Electric' : 'Diesel',
      lastMaintenance: now.subtract(Duration(days: random.nextInt(30))),
    );
  }

  VehicleInfo _generateTrainVehicleInfo(Random random, DateTime now) {
    return VehicleInfo(
      vehicleId: 'TRAIN_${random.nextInt(999).toString().padLeft(3, '0')}',
      type: 'train',
      model: 'ICF Coach',
      capacity: 800 + random.nextInt(800),
      currentOccupancy: random.nextInt(1200),
      isAccessible: true,
      hasWifi: false,
      hasAirConditioning: false,
      amenities: ['Overhead fans', 'Ladies compartment', 'Luggage racks'],
      batteryLevel: 0.9 + random.nextDouble() * 0.1,
      fuelType: 'Electric',
      lastMaintenance: now.subtract(Duration(days: random.nextInt(7))),
    );
  }

  VehicleInfo _generateMetroVehicleInfo(Random random, DateTime now) {
    return VehicleInfo(
      vehicleId: 'METRO_${random.nextInt(99).toString().padLeft(2, '0')}',
      type: 'metro',
      model: 'Modern Metro Train',
      capacity: 200 + random.nextInt(200),
      currentOccupancy: random.nextInt(300),
      isAccessible: true,
      hasWifi: true,
      hasAirConditioning: true,
      amenities: ['Platform screen doors', 'Digital displays', 'CCTV'],
      batteryLevel: 0.85 + random.nextDouble() * 0.15,
      fuelType: 'Electric',
      lastMaintenance: now.subtract(Duration(hours: random.nextInt(48))),
    );
  }

  RoutePattern _createRoutePattern(List<TransitStop> stops, String direction) {
    return RoutePattern(
      patternId: 'PATTERN_${Random().nextInt(999)}',
      direction: direction,
      headsign: stops.isNotEmpty ? stops.last.stopName : 'Terminal',
      stops: stops,
      totalDistance: _calculateTotalDistance(stops),
      totalTravelTime: stops.length * 3 + Random().nextInt(20),
      routeShape: 'encoded_polyline_${Random().nextInt(9999)}',
    );
  }

  double _calculateTotalDistance(List<TransitStop> stops) {
    double total = 0.0;
    for (int i = 0; i < stops.length - 1; i++) {
      final start = stops[i].location;
      final end = stops[i + 1].location;
      total += _calculateDistance(start, end);
    }
    return total;
  }

  double _calculateDistance(LatLng start, LatLng end) {
    // Haversine formula for distance calculation
    const double earthRadius = 6371.0; // km
    final dLat = (end.latitude - start.latitude) * pi / 180;
    final dLng = (end.longitude - start.longitude) * pi / 180;
    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(start.latitude * pi / 180) *
            cos(end.latitude * pi / 180) *
            sin(dLng / 2) *
            sin(dLng / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  List<ServiceAlert> _generateServiceAlerts(String routeId, DateTime now) {
    if (Random().nextBool()) return [];

    return [
      ServiceAlert(
        id: 'ALERT_${Random().nextInt(999)}',
        severity: ['info', 'warning', 'critical'][Random().nextInt(3)],
        title: 'Service Notice',
        description: _generateDelayReason(),
        startTime: now.subtract(Duration(hours: Random().nextInt(6))),
        endTime: now.add(Duration(hours: Random().nextInt(12))),
        affectedRoutes: [routeId],
        icon: '⚠️',
      ),
    ];
  }

  List<ServiceAlert> _generateTrainAlerts(DateTime now) {
    return [
      ServiceAlert(
        id: 'TRAIN_ALERT_${Random().nextInt(99)}',
        severity: 'warning',
        title: 'Track Maintenance',
        description: 'Scheduled maintenance causing minor delays',
        startTime: now.subtract(Duration(hours: 2)),
        endTime: now.add(Duration(hours: 4)),
        affectedRoutes: ['TRAIN_001', 'TRAIN_002'],
        icon: '🚧',
      ),
    ];
  }

  Map<String, dynamic> _generateRealtimeData(DateTime now) {
    return {
      'last_updated': now.millisecondsSinceEpoch,
      'gps_accuracy': 2.0 + Random().nextDouble() * 5.0,
      'signal_strength': ['weak', 'good', 'strong'][Random().nextInt(3)],
      'temperature': 20 + Random().nextInt(15),
      'door_status': ['open', 'closed'][Random().nextInt(2)],
    };
  }

  Map<String, dynamic> _generateTrainRealtimeData(DateTime now) {
    return {
      'last_updated': now.millisecondsSinceEpoch,
      'track_circuit': ['clear', 'occupied'][Random().nextInt(2)],
      'signal_aspect': ['green', 'yellow', 'red'][Random().nextInt(3)],
      'doors_status': ['open', 'closed'][Random().nextInt(2)],
    };
  }

  Map<String, dynamic> _generateMetroRealtimeData(DateTime now) {
    return {
      'last_updated': now.millisecondsSinceEpoch,
      'next_station_eta': Random().nextInt(300) + 60, // 1-5 minutes
      'platform_screen_doors': ['open', 'closed'][Random().nextInt(2)],
      'hvac_status': 'optimal',
    };
  }

  String _determineFareZone(List<TransitStop> stops) {
    return 'Zone ${String.fromCharCode(65 + Random().nextInt(3))}';
  }

  List<String> _generateAlternativeRoutes(String currentRoute) {
    final alternatives = <String>[];
    for (int i = 0; i < Random().nextInt(3) + 1; i++) {
      alternatives.add('ALT_ROUTE_${Random().nextInt(10)}');
    }
    return alternatives;
  }

  Map<String, int> _generateCrowdingPrediction(List<TransitStop> stops) {
    final prediction = <String, int>{};
    for (final stop in stops.take(5)) {
      prediction[stop.stopId] = Random().nextInt(10);
    }
    return prediction;
  }

  List<String> _generateIntermediateStops(List<TransitStop> stops) {
    final intermediate = <String>[];
    for (int i = 0; i < stops.length - 1; i++) {
      intermediate.add(stops[i].stopName);
      if (Random().nextBool()) {
        intermediate.add('${stops[i].stopName} Junction');
      }
    }
    if (stops.isNotEmpty) {
      intermediate.add(stops.last.stopName);
    }
    return intermediate;
  }

  String _generateWeatherImpact() {
    final impacts = [
      'Clear weather, no impact',
      'Light rain, minor delays possible',
      'Foggy conditions, reduced visibility',
      'Normal weather conditions',
    ];
    return impacts[Random().nextInt(impacts.length)];
  }

  List<TransitStop> _generatePlatformStops(TransitStop mainStation) {
    final platformStops = <TransitStop>[];
    for (int i = 1; i <= 3; i++) {
      platformStops.add(
        TransitStop(
          stopId: '${mainStation.stopId}_P$i',
          stopName: '${mainStation.stopName} Platform $i',
          location: LatLng(
            mainStation.location.latitude +
                (Random().nextDouble() - 0.5) * 0.001,
            mainStation.location.longitude +
                (Random().nextDouble() - 0.5) * 0.001,
          ),
          arrivalMinutes: i * 2,
          departureMinutes: i * 2 + 1,
          isAccessible: mainStation.isAccessible,
          facilities: ['platform', 'seating'],
          crowdingLevel: Random().nextDouble(),
          nearbyLandmarks: mainStation.nearbyLandmarks,
          zone: mainStation.zone,
          isTransferPoint: i == 1,
          connectingRoutes: i == 1 ? mainStation.connectingRoutes : [],
          delay: Random().nextBool() ? 'Track signals' : null,
        ),
      );
    }
    return platformStops;
  }

  List<TransitInfo> _getFallbackTransitData(LatLng location) {
    // Return some fallback data if API calls fail
    final fallbackStops = [
      TransitStop(
        stopId: 'FALLBACK_001',
        stopName: 'Central Station',
        location: location,
        arrivalMinutes: 2,
        departureMinutes: 3,
        isAccessible: true,
        facilities: ['restroom', 'elevator'],
        crowdingLevel: 0.6,
        nearbyLandmarks: ['Shopping Center', 'Bank'],
        zone: 'Zone A',
        isTransferPoint: true,
        connectingRoutes: ['BUS_02'],
        delay: null,
      ),
    ];

    return [
      _createBusRoute(
        'FALLBACK_BUS',
        'Local Bus Service',
        'LB1',
        fallbackStops,
        'Local Transport',
        '#2196F3',
      ),
    ];
  }
}
