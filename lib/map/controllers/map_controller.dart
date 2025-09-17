import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/route_info.dart';
import '../models/navigation_instruction.dart';
import '../models/bus_position.dart';
import '../services/location_service.dart';
import '../services/graphhopper_service.dart';
import '../utils/constants.dart';
import '../utils/jharkhand_locations.dart';
import '../widgets/custom_location_marker.dart';

class MapController extends ChangeNotifier {
  final LocationService _locationService = LocationService();
  final GraphHopperService _graphHopperService = GraphHopperService();

  // State variables
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  final Set<Circle> _circles = {}; // Added for destination clusters
  List<NavigationInstruction> _currentInstructions = [];
  LatLng? _currentLocation;
  LatLng _destination = JharkhandLocations.mockCurrentLocation;
  bool _isLoading = false;
  String? _errorMessage;
  bool _showTouristDestinations = true;
  BitmapDescriptor? _busIcon; // Cache for bus icon

  // Getters
  Set<Marker> get markers => _markers;
  Set<Polyline> get polylines => _polylines;
  Set<Circle> get circles => _circles; // Added getter for circles
  List<NavigationInstruction> get currentInstructions => _currentInstructions;
  LatLng? get currentLocation => _currentLocation;
  LatLng get destination => _destination;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasInstructions => _currentInstructions.isNotEmpty;
  bool get showTouristDestinations => _showTouristDestinations;

  void setMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  void setDestination(LatLng newDestination) {
    _destination = newDestination;
    _updateDestinationMarker();
    notifyListeners();
  }

  Future<void> initializeLocation() async {
    _setLoading(true);
    _clearError();

    try {
      // Initialize bus icon first
      await _initializeBusIcon();

      await _locationService.initializeLocation();
      final locationData = _locationService.currentLocation;

      if (locationData != null) {
        _currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
        await updateLocationMarker();
        _loadTouristDestinations(); // Load Jharkhand destinations

        if (_mapController != null) {
          _mapController!.animateCamera(CameraUpdate.newLatLngZoom(_currentLocation!, 14.0));
        }

        notifyListeners();
      }
    } catch (e) {
      _setError('Failed to get location: $e');
    } finally {
      _setLoading(false);
    }
  }

  /// Initialize the bus icon from assets
  Future<void> _initializeBusIcon() async {
    try {
      _busIcon = await BitmapDescriptor.asset(const ImageConfiguration(size: Size(48, 48)), 'assets/bus.png');
    } catch (e) {
      print('Failed to load bus icon: $e');
      // Fallback to default marker if bus.png fails to load
      _busIcon = BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    }
  }

  Future<void> createRoute() async {
    if (_currentLocation == null) {
      _setError('Current location not available');
      return;
    }

    _setLoading(true);
    _clearError();

    try {
      final RouteInfo routeInfo = await _graphHopperService.getRoute(_currentLocation!, _destination);

      if (routeInfo.hasRoute) {
        _polylines.clear();
        _polylines.add(
          Polyline(
            polylineId: PolylineId('graphhopper_route'),
            color: Colors.blue,
            width: AppConstants.polylineWidth,
            points: routeInfo.polylinePoints,
          ),
        );

        _currentInstructions = routeInfo.instructions;
        _fitMarkersOnMap();
      } else {
        _createSimpleRoute();
        _setError('Could not find route using GraphHopper');
      }
    } catch (e) {
      _createSimpleRoute();
      _setError('GraphHopper API unavailable. Showing direct route.');
      // Log error internally but keep GUI functionality
    } finally {
      _setLoading(false);
    }
  }

  void clearRoute() {
    _polylines.clear();
    _currentInstructions.clear();
    _clearError();
    notifyListeners();
  }

  Future<void> updateLocationMarker() async {
    if (_currentLocation != null) {
      _markers.removeWhere(
        (marker) =>
            marker.markerId.value == 'current_location' || marker.markerId.value == 'current_location_jharkhand',
      );
      _circles.removeWhere((circle) => circle.circleId.value == 'current_location_accuracy');

      final customMarker = await JharkhandLocationMarker.createCurrentLocationMarker(_currentLocation!);
      _markers.add(customMarker);

      _circles.add(
        JharkhandLocationMarker.createLocationAccuracyCircle(
          _currentLocation!,
          accuracy: 150.0, // 150 meter accuracy radius
        ),
      );
    }
  }

  void _updateDestinationMarker() {
    _markers.removeWhere((marker) => marker.markerId.value == 'destination');
    _markers.add(
      Marker(
        markerId: MarkerId('destination'),
        position: _destination,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: 'Destination'),
      ),
    );
  }

  void _createSimpleRoute() {
    if (_currentLocation != null) {
      _polylines.clear();
      _polylines.add(
        Polyline(
          polylineId: PolylineId('simple_route'),
          color: Colors.red,
          width: AppConstants.polylineWidth,
          points: [_currentLocation!, _destination],
        ),
      );
      _currentInstructions.clear();
    }
  }

  void _fitMarkersOnMap() {
    if (_mapController != null && _currentLocation != null) {
      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          _currentLocation!.latitude < _destination.latitude ? _currentLocation!.latitude : _destination.latitude,
          _currentLocation!.longitude < _destination.longitude ? _currentLocation!.longitude : _destination.longitude,
        ),
        northeast: LatLng(
          _currentLocation!.latitude > _destination.latitude ? _currentLocation!.latitude : _destination.latitude,
          _currentLocation!.longitude > _destination.longitude ? _currentLocation!.longitude : _destination.longitude,
        ),
      );

      _mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 100.0));
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }

  void _loadTouristDestinations() {
    if (_showTouristDestinations) {
      _markers.addAll(JharkhandLocations.getDestinationMarkers());
      _circles.addAll(JharkhandLocations.getDestinationClusters());
      print('Loaded ${JharkhandLocations.destinations.length} tourist destinations in Jharkhand');
    }
  }

  // Toggle tourist destinations visibility
  void toggleTouristDestinations() {
    _showTouristDestinations = !_showTouristDestinations;
    if (_showTouristDestinations) {
      _loadTouristDestinations();
    } else {
      _clearTouristDestinations();
    }
    notifyListeners();
  }

  // Clear tourist destinations from map
  void _clearTouristDestinations() {
    // Remove tourist destination markers (keep current location and destination markers)
    _markers.removeWhere(
      (marker) => marker.markerId.value != 'current_location_jharkhand' && marker.markerId.value != 'destination',
    );
    // Remove destination cluster circles (keep location accuracy circle)
    _circles.removeWhere((circle) => circle.circleId.value != 'current_location_accuracy');
  }

  // Set destination to a tourist spot
  void setDestinationToTouristSpot(String destinationName) {
    final destination = JharkhandLocations.getDestinationByName(destinationName);
    if (destination != null) {
      setDestination(destination.location);
    }
  }

  // Get list of all tourist destinations
  List<String> getTouristDestinationNames() {
    return JharkhandLocations.destinations.map((dest) => dest.name).toList();
  }

  /// Add or update bus markers on the map
  void updateBusMarkers(Map<String, BusPosition> buses) {
    // Only update if there are actual changes to prevent unnecessary rebuilds
    bool hasChanges = false;

    // Check if we need to update (basic change detection)
    final currentBusMarkers = _markers.where((m) => m.markerId.value.startsWith('bus_')).length;
    if (currentBusMarkers != buses.length) {
      hasChanges = true;
    }

    if (!hasChanges) {
      // Quick position change detection for first bus
      if (buses.isNotEmpty) {
        final firstBus = buses.values.first;
        final existingBusMarker = _markers.firstWhere(
          (m) => m.markerId.value == 'bus_${buses.keys.first}',
          orElse: () => const Marker(markerId: MarkerId('none')),
        );
        if (existingBusMarker.markerId.value != 'none') {
          final distance =
              (existingBusMarker.position.latitude - firstBus.position.latitude).abs() +
              (existingBusMarker.position.longitude - firstBus.position.longitude).abs();
          hasChanges = distance > 0.0001; // Only update if moved significantly
        }
      }
    }

    if (!hasChanges) return; // Skip update if no significant changes

    // Remove old bus markers
    _markers.removeWhere((marker) => marker.markerId.value.startsWith('bus_'));

    // Add new bus markers with custom bus icon
    for (final entry in buses.entries) {
      final busId = entry.key;
      final busPosition = entry.value;

      _markers.add(
        Marker(
          markerId: MarkerId('bus_$busId'),
          position: LatLng(busPosition.position.latitude, busPosition.position.longitude),
          icon: _busIcon ?? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          rotation: busPosition.bearing,
          infoWindow: InfoWindow(title: 'Bus ${busId.toUpperCase()}'),
        ),
      );
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}
