import 'package:flutter/material.dart';
import '../models/ar_annotation.dart';
import '../services/ar_data_manager.dart';

/// AR Controller that delegates to the singleton ARDataManager
/// This ensures all AR data is shared across the app
class ARController extends ChangeNotifier {
  late final ARDataManager _dataManager;

  ARController() {
    _dataManager = ARDataManager.instance;
    _dataManager.addListener(_onDataManagerUpdate);
  }

  // Delegate all getters to the data manager
  List<ARAnnotation> get annotations => _dataManager.annotations;
  bool get isLoading => _dataManager.isLoading;
  bool get hasPermission => _dataManager.hasPermission;
  String? get errorMessage => _dataManager.errorMessage;
  bool get hasData => _dataManager.hasData;

  /// Initialize AR data (delegates to data manager)
  Future<void> initialize() async {
    try {
      await _dataManager.initialize();
    } catch (e) {
      debugPrint('AR Controller initialize error: $e');
    }
  }

  /// Force refresh AR data (delegates to data manager)
  Future<void> refresh() async {
    try {
      await _dataManager.forceRefresh();
    } catch (e) {
      debugPrint('AR Controller refresh error: $e');
    }
  }

  /// Check if data is stale
  bool isDataStale() => _dataManager.isDataStale();

  /// Get human readable data age
  String getDataAge() => _dataManager.getDataAge();

  void _onDataManagerUpdate() {
    try {
      notifyListeners(); // Forward data manager updates to our listeners
    } catch (e) {
      debugPrint('AR Controller update error: $e');
    }
  }

  @override
  void dispose() {
    try {
      _dataManager.removeListener(_onDataManagerUpdate);
      // Don't dispose the data manager as it's a singleton used by other controllers
    } catch (e) {
      debugPrint('AR Controller dispose error: $e');
    }
    super.dispose();
  }
}
