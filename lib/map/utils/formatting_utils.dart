class FormattingUtils {
  /// Formats distance in meters to human-readable string
  static String formatDistance(double distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters.round()}m';
    } else {
      return '${(distanceInMeters / 1000).toStringAsFixed(1)}km';
    }
  }

  /// Formats time in milliseconds to human-readable string
  static String formatTime(int timeInMilliseconds) {
    int minutes = (timeInMilliseconds / 60000).round();
    if (minutes < 60) {
      return '${minutes}min';
    } else {
      int hours = (minutes / 60).floor();
      int remainingMinutes = minutes % 60;
      return '${hours}h ${remainingMinutes}min';
    }
  }
}
