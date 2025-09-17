import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../utils/constants.dart';
import '../utils/jharkhand_locations.dart';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();
  final Location _location = Location();
  LocationData? _currentLocation;
  bool _useMockLocation = true;
  LocationData? get currentLocation => _currentLocation;
  Future<void> initializeLocation() async {
    try {
      if (_useMockLocation) {
        _currentLocation = LocationData.fromMap({
          'latitude': JharkhandLocations.mockCurrentLocation.latitude,
          'longitude': JharkhandLocations.mockCurrentLocation.longitude,
          'accuracy': 10.0,
          'altitude': 651.0,
          'bearing': 0.0,
          'speed': 0.0,
          'time': DateTime.now().millisecondsSinceEpoch.toDouble(),
        });
        return;
      }

      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          throw Exception('Location service is disabled');
        }
      }

      PermissionStatus permissionGranted = await _location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await _location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          throw Exception('Location permission denied');
        }
      }

      await _location.changeSettings(
        accuracy: LocationAccuracy.high,
        interval: AppConstants.locationUpdateInterval.inMilliseconds,
        distanceFilter: AppConstants.locationAccuracy,
      );
      _currentLocation = await _location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'SERVICE_STATUS_ERROR') {
        await Future.delayed(Duration(seconds: 2));
        return initializeLocation(); // Retry
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateCurrentLocation() async {
    try {
      if (_useMockLocation) {
        _currentLocation = LocationData.fromMap({
          "latitude": JharkhandLocations.mockCurrentLocation.latitude,
          "longitude": JharkhandLocations.mockCurrentLocation.longitude,
        });
      }
      _currentLocation = await _location.getLocation();
    } catch (e) {
      rethrow;
    }
  }

  LatLng? getCurrentLatLng() {
    if (_currentLocation != null) {
      return LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
    }
    return null;
  }

  Stream<LocationData> getLocationStream() => _location.onLocationChanged;
  void setMockLocationMode(bool useMock) => _useMockLocation = useMock;
  bool get isUsingMockLocation => _useMockLocation;
}
