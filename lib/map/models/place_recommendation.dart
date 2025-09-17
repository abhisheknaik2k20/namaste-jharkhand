import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceRecommendation {
  final String placeId;
  final String name;
  final String address;
  final LatLng location;
  final double rating;
  final int priceLevel;
  final List<String> types;
  final String? photoReference;
  final bool openNow;
  final double recommendationScore;
  final String recommendationReason;
  final String? phoneNumber;
  final String? website;
  final String? vicinity;

  PlaceRecommendation({
    required this.placeId,
    required this.name,
    required this.address,
    required this.location,
    required this.rating,
    required this.priceLevel,
    required this.types,
    this.photoReference,
    required this.openNow,
    required this.recommendationScore,
    required this.recommendationReason,
    this.phoneNumber,
    this.website,
    this.vicinity,
  });

  PlaceRecommendation copyWith({
    String? placeId,
    String? name,
    String? address,
    LatLng? location,
    double? rating,
    int? priceLevel,
    List<String>? types,
    String? photoReference,
    bool? openNow,
    double? recommendationScore,
    String? recommendationReason,
    String? phoneNumber,
    String? website,
    String? vicinity,
  }) {
    return PlaceRecommendation(
      placeId: placeId ?? this.placeId,
      name: name ?? this.name,
      address: address ?? this.address,
      location: location ?? this.location,
      rating: rating ?? this.rating,
      priceLevel: priceLevel ?? this.priceLevel,
      types: types ?? this.types,
      photoReference: photoReference ?? this.photoReference,
      openNow: openNow ?? this.openNow,
      recommendationScore: recommendationScore ?? this.recommendationScore,
      recommendationReason: recommendationReason ?? this.recommendationReason,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      website: website ?? this.website,
      vicinity: vicinity ?? this.vicinity,
    );
  }
}

class TransitStop {
  final String stopId;
  final String stopName;
  final LatLng location;
  final int arrivalMinutes;
  final int departureMinutes;
  final bool isAccessible;
  final List<String> facilities; // 'elevator', 'escalator', 'restroom'
  final double crowdingLevel; // 0.0 to 1.0
  final List<String> nearbyLandmarks;
  final String zone;
  final bool isTransferPoint;
  final List<String> connectingRoutes;
  final String? delay; // null if on time, otherwise delay reason

  TransitStop({
    required this.stopId,
    required this.stopName,
    required this.location,
    required this.arrivalMinutes,
    required this.departureMinutes,
    required this.isAccessible,
    required this.facilities,
    required this.crowdingLevel,
    required this.nearbyLandmarks,
    required this.zone,
    required this.isTransferPoint,
    required this.connectingRoutes,
    this.delay,
  });
}

class ServiceAlert {
  final String id;
  final String severity; // 'info', 'warning', 'critical'
  final String title;
  final String description;
  final DateTime startTime;
  final DateTime? endTime;
  final List<String> affectedRoutes;
  final String icon;

  ServiceAlert({
    required this.id,
    required this.severity,
    required this.title,
    required this.description,
    required this.startTime,
    this.endTime,
    required this.affectedRoutes,
    required this.icon,
  });
}

class VehicleInfo {
  final String vehicleId;
  final String type; // 'bus', 'train', 'metro', 'tram'
  final String model;
  final int capacity;
  final int currentOccupancy;
  final bool isAccessible;
  final bool hasWifi;
  final bool hasAirConditioning;
  final List<String> amenities;
  final double batteryLevel; // for electric vehicles
  final String fuelType;
  final DateTime lastMaintenance;

  VehicleInfo({
    required this.vehicleId,
    required this.type,
    required this.model,
    required this.capacity,
    required this.currentOccupancy,
    required this.isAccessible,
    required this.hasWifi,
    required this.hasAirConditioning,
    required this.amenities,
    required this.batteryLevel,
    required this.fuelType,
    required this.lastMaintenance,
  });
}

class RoutePattern {
  final String patternId;
  final String direction;
  final String headsign;
  final List<TransitStop> stops;
  final double totalDistance;
  final int totalTravelTime;
  final String routeShape; // encoded polyline

  RoutePattern({
    required this.patternId,
    required this.direction,
    required this.headsign,
    required this.stops,
    required this.totalDistance,
    required this.totalTravelTime,
    required this.routeShape,
  });
}

class TransitInfo {
  final String routeId;
  final String routeName;
  final String shortName;
  final String longName;
  final VehicleInfo vehicleInfo;
  final String
  currentStatus; // 'on_time', 'delayed', 'approaching', 'boarding', 'in_transit'
  final LatLng currentLocation;
  final double bearing;
  final double speed; // km/h
  final TransitStop currentStop;
  final TransitStop nextStop;
  final List<TransitStop> upcomingStops;
  final List<TransitStop> allStops;
  final String operatorName;
  final String operatorLogo;
  final String lineColor;
  final String textColor;
  final RoutePattern routePattern;
  final List<ServiceAlert> serviceAlerts;
  final Map<String, dynamic> realtimeData;
  final int frequency; // minutes between vehicles
  final String operatingHours;
  final double fare;
  final String fareZone;
  final List<String> paymentMethods;
  final bool isElectric;
  final String accessibility;
  final List<String> alternativeRoutes;
  final Map<String, int> crowdingPrediction; // stop_id -> crowding level
  final String tripId;
  final String blockId;
  final DateTime scheduledDeparture;
  final DateTime? actualDeparture;
  final int delayMinutes;
  final String delayReason;
  final List<String> intermediateStops;
  final double co2Emissions;
  final String weatherImpact;
  final bool hasLiveTracking;

  TransitInfo({
    required this.routeId,
    required this.routeName,
    required this.shortName,
    required this.longName,
    required this.vehicleInfo,
    required this.currentStatus,
    required this.currentLocation,
    required this.bearing,
    required this.speed,
    required this.currentStop,
    required this.nextStop,
    required this.upcomingStops,
    required this.allStops,
    required this.operatorName,
    required this.operatorLogo,
    required this.lineColor,
    required this.textColor,
    required this.routePattern,
    required this.serviceAlerts,
    required this.realtimeData,
    required this.frequency,
    required this.operatingHours,
    required this.fare,
    required this.fareZone,
    required this.paymentMethods,
    required this.isElectric,
    required this.accessibility,
    required this.alternativeRoutes,
    required this.crowdingPrediction,
    required this.tripId,
    required this.blockId,
    required this.scheduledDeparture,
    this.actualDeparture,
    required this.delayMinutes,
    required this.delayReason,
    required this.intermediateStops,
    required this.co2Emissions,
    required this.weatherImpact,
    required this.hasLiveTracking,
  });
}
