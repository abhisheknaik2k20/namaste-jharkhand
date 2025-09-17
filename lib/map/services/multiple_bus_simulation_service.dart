import 'dart:async';
import 'dart:math' as math;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/bus_position.dart';

class MultipleBusPosition {
  final Map<String, BusPosition> buses;
  MultipleBusPosition({required this.buses});
}

class BusRouteState {
  int targetWaypointIndex;
  double progressToTarget;
  LatLng currentPosition;
  double currentBearing;

  BusRouteState({
    required this.targetWaypointIndex,
    required this.progressToTarget,
    required this.currentPosition,
    required this.currentBearing,
  });
}

class MultipleBusSimulationService {
  static final MultipleBusSimulationService _instance =
      MultipleBusSimulationService._internal();
  factory MultipleBusSimulationService() => _instance;
  MultipleBusSimulationService._internal();
  final _controller = StreamController<MultipleBusPosition>.broadcast();
  Stream<MultipleBusPosition> get busStream => _controller.stream;
  final Map<String, BusRouteState> _busStates = {};
  Timer? _singleTimer;
  static const double _busSpeedKmH = 30.0;
  static const int _updateIntervalMs =
      2000; // Update every 2 seconds (much less frequent)
  static const double _speedDegreesPerUpdate =
      (_busSpeedKmH / 3600) * (_updateIntervalMs / 1000) / 111.0;
  final Map<String, List<LatLng>> _routes = {
    'bus1': [
      LatLng(23.350925, 85.371159),
      LatLng(23.3550, 85.3650),
      LatLng(23.3600, 85.3600),
      LatLng(23.3650, 85.3550),
      LatLng(23.3700, 85.3500), // far NE
      LatLng(23.3750, 85.3450),
      LatLng(23.3700, 85.3500),
      LatLng(23.3650, 85.3550),
      LatLng(23.3600, 85.3600),
      LatLng(23.3550, 85.3650),
      LatLng(23.350925, 85.371159),
    ],

    'bus2': [
      // East-West route, maybe along some connecting road west of Ranchi
      LatLng(23.3400, 85.3200),
      LatLng(23.3400, 85.3300),
      LatLng(23.3400, 85.3400),
      LatLng(23.3400, 85.3500),
      LatLng(23.3400, 85.3600),
      LatLng(23.3400, 85.3700),
      // back
      LatLng(23.3400, 85.3600),
      LatLng(23.3400, 85.3500),
      LatLng(23.3400, 85.3400),
      LatLng(23.3400, 85.3300),
      LatLng(23.3400, 85.3200),
    ],

    'bus3': [
      // Diagonal, following maybe NH-320 / SH roads, SW → NE
      LatLng(23.3200, 85.3000),
      LatLng(23.3250, 85.3100),
      LatLng(23.3300, 85.3200),
      LatLng(23.3350, 85.3300),
      LatLng(23.3400, 85.3400),
      LatLng(23.3450, 85.3500),
      LatLng(23.3500, 85.3600),
      LatLng(23.3550, 85.3700),
      LatLng(23.3500, 85.3600),
      LatLng(23.3450, 85.3500),
      LatLng(23.3400, 85.3400),
      LatLng(23.3350, 85.3300),
      LatLng(23.3300, 85.3200),
      LatLng(23.3250, 85.3100),
      LatLng(23.3200, 85.3000),
    ],
  };

  void start() {
    final busIds = _routes.keys.toList();
    for (int i = 0; i < busIds.length; i++) {
      final busId = busIds[i];
      final route = _routes[busId]!;
      final startIndex = (i * 3) % (route.length - 1);
      final targetIndex = (startIndex + 1) % route.length;
      final startProgress = (i * 0.3) % 1.0;
      _busStates[busId] = BusRouteState(
        targetWaypointIndex: targetIndex,
        progressToTarget: startProgress,
        currentPosition: _interpolatePosition(
          route[startIndex],
          route[targetIndex],
          startProgress,
        ),
        currentBearing: _calculateBearing(
          route[startIndex],
          route[targetIndex],
        ),
      );
    }

    // Use single efficient timer for all buses
    _singleTimer?.cancel();
    _singleTimer = Timer.periodic(
      Duration(milliseconds: _updateIntervalMs),
      (_) => _updateAllBuses(),
    );

    // Emit initial positions
    _emitCurrentPositions();
  }

  void stop() => _singleTimer?.cancel();

  void _updateAllBuses() {
    for (final busId in _busStates.keys) {
      _updateBusPosition(busId);
    }
    _emitCurrentPositions();
  }

  void _updateBusPosition(String busId) {
    final route = _routes[busId];
    final state = _busStates[busId];
    if (route == null || state == null) return;
    final currentWaypoint = route[state.targetWaypointIndex - 1];
    final targetWaypoint = route[state.targetWaypointIndex];
    final totalDistance = _calculateDistance(currentWaypoint, targetWaypoint);
    final progressIncrement = _speedDegreesPerUpdate / totalDistance;
    state.progressToTarget += progressIncrement;

    if (state.progressToTarget >= 1.0) {
      state.progressToTarget = 0.0;
      state.targetWaypointIndex =
          (state.targetWaypointIndex + 1) % route.length;
      final nextWaypoint = route[state.targetWaypointIndex];
      state.currentBearing = _calculateBearing(targetWaypoint, nextWaypoint);
      state.currentPosition = targetWaypoint;
    } else {
      state.currentPosition = _interpolatePosition(
        currentWaypoint,
        targetWaypoint,
        state.progressToTarget,
      );
      state.currentBearing = _calculateBearing(currentWaypoint, targetWaypoint);
    }
  }

  void _emitCurrentPositions() {
    final buses = <String, BusPosition>{};
    for (final entry in _busStates.entries) {
      final busId = entry.key;
      final state = entry.value;
      buses[busId] = BusPosition(
        position: state.currentPosition,
        bearing: state.currentBearing,
      );
    }
    _controller.add(MultipleBusPosition(buses: buses));
  }

  LatLng _interpolatePosition(LatLng from, LatLng to, double progress) {
    final lat = from.latitude + (to.latitude - from.latitude) * progress;
    final lng = from.longitude + (to.longitude - from.longitude) * progress;
    return LatLng(lat, lng);
  }

  double _calculateDistance(LatLng from, LatLng to) {
    const double earthRadius = 6371000;
    final lat1Rad = from.latitude * math.pi / 180;
    final lat2Rad = to.latitude * math.pi / 180;
    final dLat = (to.latitude - from.latitude) * math.pi / 180;
    final dLng = (to.longitude - from.longitude) * math.pi / 180;
    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(lat1Rad) *
            math.cos(lat2Rad) *
            math.sin(dLng / 2) *
            math.sin(dLng / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c / 111000;
  }

  double _calculateBearing(LatLng from, LatLng to) {
    final lat1 = from.latitude * math.pi / 180.0;
    final lat2 = to.latitude * math.pi / 180.0;
    final dLon = (to.longitude - from.longitude) * math.pi / 180.0;
    final y = math.sin(dLon) * math.cos(lat2);
    final x =
        math.cos(lat1) * math.sin(lat2) -
        math.sin(lat1) * math.cos(lat2) * math.cos(dLon);
    return (math.atan2(y, x) * 180.0 / math.pi + 360.0) % 360.0;
  }

  Map<String, BusPosition> get currentPositions {
    final positions = <String, BusPosition>{};
    for (final entry in _busStates.entries) {
      final busId = entry.key;
      final state = entry.value;
      positions[busId] = BusPosition(
        position: state.currentPosition,
        bearing: state.currentBearing,
      );
    }
    return positions;
  }

  static MultipleBusSimulationService get instance => _instance;
}
