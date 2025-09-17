import 'package:flutter/foundation.dart';

class ErrorHandler {
  // Centralized error logging
  static void logError(
    String context,
    dynamic error, [
    StackTrace? stackTrace,
  ]) {
    if (kDebugMode) {
      print('Error in $context: $error');
      if (stackTrace != null) {
        print('StackTrace: $stackTrace');
      }
    }
    // In production, you could send to crash reporting service like Firebase Crashlytics
  }

  // Handle API errors with user-friendly messages
  static String getAPIErrorMessage(dynamic error) {
    if (error.toString().contains('SocketException')) {
      return 'Network connection error. Please check your internet connection.';
    }
    if (error.toString().contains('TimeoutException')) {
      return 'Request timeout. Please try again.';
    }
    if (error.toString().contains('HandshakeException')) {
      return 'Connection security error. Please try again.';
    }
    if (error.toString().contains('HttpException')) {
      return 'Server error. Please try again later.';
    }
    if (error.toString().contains('FormatException')) {
      return 'Invalid data format received from server.';
    }
    // Default error message
    return 'An unexpected error occurred. Please try again.';
  }

  // Safe execution wrapper for async operations
  static Future<T?> safeAsyncCall<T>(
    String context,
    Future<T> Function() operation, {
    T? defaultValue,
    Function(String)? onError,
  }) async {
    try {
      return await operation();
    } catch (error, stackTrace) {
      logError(context, error, stackTrace);

      if (onError != null) {
        final errorMessage = getAPIErrorMessage(error);
        onError(errorMessage);
      }

      return defaultValue;
    }
  }

  // Safe execution wrapper for sync operations
  static T? safeSyncCall<T>(
    String context,
    T Function() operation, {
    T? defaultValue,
    Function(String)? onError,
  }) {
    try {
      return operation();
    } catch (error, stackTrace) {
      logError(context, error, stackTrace);

      if (onError != null) {
        final errorMessage = getAPIErrorMessage(error);
        onError(errorMessage);
      }

      return defaultValue;
    }
  }

  // Location service specific errors
  static String getLocationErrorMessage(dynamic error) {
    final errorStr = error.toString().toLowerCase();

    if (errorStr.contains('permission')) {
      return 'Location permission denied. Please enable location services.';
    }
    if (errorStr.contains('disabled')) {
      return 'Location services are disabled. Please enable them in settings.';
    }
    if (errorStr.contains('timeout')) {
      return 'Unable to get location. Please try again.';
    }

    return 'Location error: ${getAPIErrorMessage(error)}';
  }

  // Places API specific errors
  static String getPlacesErrorMessage(dynamic error) {
    final errorStr = error.toString().toLowerCase();

    if (errorStr.contains('quota')) {
      return 'Places API quota exceeded. Please try again later.';
    }
    if (errorStr.contains('key')) {
      return 'Invalid API key. Please contact support.';
    }
    if (errorStr.contains('not found')) {
      return 'No place information found for this location.';
    }

    return 'Places service error: ${getAPIErrorMessage(error)}';
  }

  // GraphHopper routing specific errors
  static String getRoutingErrorMessage(dynamic error) {
    final errorStr = error.toString().toLowerCase();

    if (errorStr.contains('no route')) {
      return 'No route found between the selected locations.';
    }
    if (errorStr.contains('quota') || errorStr.contains('limit')) {
      return 'Routing service temporarily unavailable. Please try again later.';
    }
    if (errorStr.contains('invalid')) {
      return 'Invalid location coordinates for routing.';
    }

    return 'Routing error: ${getAPIErrorMessage(error)}';
  }
}
