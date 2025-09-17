/// Manages AR widget instances to prevent multiple ArLocationWidget conflicts
class ARWidgetManager {
  static final ARWidgetManager _instance = ARWidgetManager._internal();
  factory ARWidgetManager() => _instance;
  ARWidgetManager._internal();

  bool _isExclusiveARActive = false;

  /// Set when dedicated AR screen (like ARExplorerScreen) is active
  void setExclusiveARActive(bool active) {
    _isExclusiveARActive = active;
  }

  /// Check if exclusive AR mode is active (should disable background AR)
  bool get isExclusiveARActive => _isExclusiveARActive;

  static ARWidgetManager get instance => _instance;
}
