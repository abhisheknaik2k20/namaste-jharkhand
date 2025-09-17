import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../models/ar_annotation.dart';
import 'ar_service.dart';

/// Singleton class to manage AR data across the entire app
/// Ensures API calls are made only once and data is shared between screens
class ARDataManager extends ChangeNotifier {
  static final ARDataManager _instance = ARDataManager._internal();
  factory ARDataManager() => _instance;
  ARDataManager._internal();

  List<ARAnnotation> _annotations = [];
  bool _isLoading = false;
  bool _hasPermission = false;
  String? _errorMessage;
  Position? _lastPosition;
  DateTime? _lastFetchTime;
  Timer? _backgroundRefreshTimer;

  // Cache duration - refresh data every 5 minutes
  static const Duration _cacheExpiry = Duration(minutes: 5);
  // Minimum distance change to trigger refresh (in meters)
  static const double _minDistanceForRefresh = 500.0;

  List<ARAnnotation> get annotations => List.unmodifiable(_annotations);
  bool get isLoading => _isLoading;
  bool get hasPermission => _hasPermission;
  String? get errorMessage => _errorMessage;
  bool get hasData => _annotations.isNotEmpty;

  /// Initialize AR data manager
  Future<void> initialize() async {
    if (_isLoading) return; // Prevent multiple simultaneous initializations

    _setLoading(true);
    _clearError();

    try {
      final permission = await ARService.checkLocationPermission();
      _hasPermission = permission;

      if (permission) {
        await _loadAnnotations();
        _startBackgroundRefresh();
      } else {
        _setLoading(false);
      }
    } catch (e) {
      debugPrint('AR initialization error: $e');
      _setError('Failed to initialize AR: $e');
      _setLoading(false);
    }
  }

  /// Load AR annotations from current location
  Future<void> _loadAnnotations() async {
    try {
      final position = await Geolocator.getCurrentPosition().timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Location timeout'),
      );

      // Check if we need to refresh based on location or time
      if (!_shouldRefresh(position)) {
        _setLoading(false);
        return;
      }

      final fetchedAnnotations = await ARService.fetchRealPlaces(
        position,
      ).timeout(const Duration(seconds: 15), onTimeout: () => throw Exception('Places fetch timeout'));

      _annotations = fetchedAnnotations;
      _lastPosition = position;
      _lastFetchTime = DateTime.now();
      _setLoading(false);

      debugPrint('AR Data Manager: Loaded ${_annotations.length} annotations');
    } catch (e) {
      _setError('Failed to load AR annotations: $e');
      _setLoading(false);
    }
  }

  /// Check if we should refresh data based on location change or time
  bool _shouldRefresh(Position currentPosition) {
    // Always refresh if we have no data
    if (_annotations.isEmpty || _lastPosition == null || _lastFetchTime == null) {
      return true;
    }

    // Check if cache has expired
    final timeSinceLastFetch = DateTime.now().difference(_lastFetchTime!);
    if (timeSinceLastFetch > _cacheExpiry) {
      debugPrint('AR Data Manager: Cache expired, refreshing');
      return true;
    }

    // Check if location has changed significantly
    final distance = Geolocator.distanceBetween(
      _lastPosition!.latitude,
      _lastPosition!.longitude,
      currentPosition.latitude,
      currentPosition.longitude,
    );

    if (distance > _minDistanceForRefresh) {
      debugPrint('AR Data Manager: Location changed by ${distance.toInt()}m, refreshing');
      return true;
    }

    return false;
  }

  /// Start background refresh timer
  void _startBackgroundRefresh() {
    _backgroundRefreshTimer?.cancel();
    _backgroundRefreshTimer = Timer.periodic(const Duration(minutes: 2), (timer) async {
      if (_hasPermission) {
        await _refreshIfNeeded();
      }
    });
  }

  /// Refresh data only if needed (location changed or cache expired)
  Future<void> _refreshIfNeeded() async {
    if (!_hasPermission || _isLoading) return;

    try {
      final position = await Geolocator.getCurrentPosition();
      if (_shouldRefresh(position)) {
        debugPrint('AR Data Manager: Background refresh triggered');
        await _loadAnnotations();
      }
    } catch (e) {
      debugPrint('AR Data Manager: Background refresh error: $e');
    }
  }

  /// Public method to refresh if needed
  Future<void> refreshIfNeeded() async {
    await _refreshIfNeeded();
  }

  /// Handle location changes from AR widget
  void onLocationChanged(Position position) {
    // Check if we should refresh based on significant location change
    if (_lastPosition != null) {
      final distance = Geolocator.distanceBetween(
        _lastPosition!.latitude,
        _lastPosition!.longitude,
        position.latitude,
        position.longitude,
      );

      // Trigger refresh if moved significantly
      if (distance > _minDistanceForRefresh) {
        refreshIfNeeded();
      }
    }
  }

  /// Force refresh data regardless of cache status
  Future<void> forceRefresh() async {
    if (!_hasPermission) {
      await initialize();
      return;
    }

    _setLoading(true);
    _lastFetchTime = null; // Force refresh by clearing last fetch time
    await _loadAnnotations();
  }

  /// Check if data is stale and needs refreshing
  bool isDataStale() {
    if (_lastFetchTime == null) return true;
    final timeSinceLastFetch = DateTime.now().difference(_lastFetchTime!);
    return timeSinceLastFetch > _cacheExpiry;
  }

  /// Get data age as a human readable string
  String getDataAge() {
    if (_lastFetchTime == null) return 'Never updated';
    final age = DateTime.now().difference(_lastFetchTime!);
    if (age.inMinutes < 1) return 'Just now';
    if (age.inMinutes == 1) return '1 minute ago';
    if (age.inMinutes < 60) return '${age.inMinutes} minutes ago';
    if (age.inHours == 1) return '1 hour ago';
    return '${age.inHours} hours ago';
  }

  void _setLoading(bool loading) {
    if (_isLoading != loading) {
      _isLoading = loading;
      notifyListeners();
    }
  }

  void _setError(String error) {
    _errorMessage = error;
    debugPrint('AR Data Manager Error: $error');
    notifyListeners();
  }

  void _clearError() {
    if (_errorMessage != null) {
      _errorMessage = null;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _backgroundRefreshTimer?.cancel();
    super.dispose();
  }

  /// Get singleton instance
  static ARDataManager get instance => _instance;
}
