import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as latlng2;

enum ViewMode { map, street, ar }

class AppState extends ChangeNotifier {
  ViewMode _viewMode = ViewMode.map;
  latlng2.LatLng? _destination;

  ViewMode get viewMode => _viewMode;
  bool get isMapMode => _viewMode == ViewMode.map;
  bool get isStreetViewMode => _viewMode == ViewMode.street;
  bool get isARViewMode => _viewMode == ViewMode.ar;

  latlng2.LatLng? get destination => _destination;

  void setViewMode(ViewMode mode) {
    if (_viewMode != mode) {
      try {
        final previousMode = _viewMode;
        _viewMode = mode;
        debugPrint('View mode changed from $previousMode to $mode');
        notifyListeners();
      } catch (e) {
        debugPrint('Error changing view mode: $e');
        // Reset to map mode on error
        _viewMode = ViewMode.map;
        notifyListeners();
      }
    }
  }

  void toggleStreetView() {
    try {
      setViewMode(isStreetViewMode ? ViewMode.map : ViewMode.street);
    } catch (e) {
      debugPrint('Error toggling street view: $e');
      setViewMode(ViewMode.map);
    }
  }

  void toggleARView() {
    try {
      setViewMode(isARViewMode ? ViewMode.map : ViewMode.ar);
    } catch (e) {
      debugPrint('Error toggling AR view: $e');
      setViewMode(ViewMode.map);
    }
  }

  void setDestination(latlng2.LatLng? dest) {
    if (_destination != dest) {
      _destination = dest;
      notifyListeners();
    }
  }
}

class AppStateScope extends InheritedNotifier<AppState> {
  const AppStateScope({super.key, required super.notifier, required super.child});

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'AppStateScope not found in widget tree');
    return scope!.notifier!;
  }
}
