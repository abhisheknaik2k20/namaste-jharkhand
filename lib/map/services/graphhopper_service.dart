import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/route_info.dart';
import '../models/navigation_instruction.dart';
import '../utils/constants.dart';
import '../utils/polyline_utils.dart';
import '../utils/error_handler.dart';

class GraphHopperService {
  static final GraphHopperService _instance = GraphHopperService._internal();
  factory GraphHopperService() => _instance;
  GraphHopperService._internal();
  Future<RouteInfo> getRoute(LatLng start, LatLng end) async {
    return await ErrorHandler.safeAsyncCall(
          'GraphHopperService.getRoute',
          () async {
            final String url = _buildUrl(start, end);
            final response = await http
                .get(
                  Uri.parse(url),
                  headers: {'Content-Type': 'application/json'},
                )
                .timeout(AppConstants.apiTimeout);

            if (response.statusCode == 200) {
              return _parseResponse(response.body, start);
            } else {
              _handleErrorResponse(response);
              throw Exception('Failed to get route: ${response.statusCode}');
            }
          },
          onError: (error) {
            throw Exception(ErrorHandler.getRoutingErrorMessage(error));
          },
        ) ??
        RouteInfo(
          polylinePoints: [],
          distanceInMeters: 0,
          timeInMilliseconds: 0,
          instructions: [],
        );
  }

  String _buildUrl(LatLng start, LatLng end) =>
      '${AppConstants.graphHopperBaseUrl}'
      '?point=${start.latitude},${start.longitude}'
      '&point=${end.latitude},${end.longitude}'
      '&vehicle=car'
      '&debug=true'
      '&calc_points=true'
      '&instructions=true'
      '&locale=en'
      '&type=json'
      '&key=${AppConstants.graphHopperApiKey}';

  RouteInfo _parseResponse(String responseBody, LatLng start) {
    final Map<String, dynamic> data = json.decode(responseBody);
    if (data['paths'] != null && data['paths'].isNotEmpty) {
      final path = data['paths'][0];
      List<LatLng> decodedPoints = [];
      List<NavigationInstruction> instructions = [];
      if (path['points'] != null) {
        final String encodedPolyline = path['points'];
        decodedPoints = PolylineUtils.decodePolyline(encodedPolyline);
      }

      if (path['instructions'] != null) {
        instructions = _parseInstructions(
          path['instructions'],
          decodedPoints,
          start,
        );
      }
      double totalDistance = (path['distance'] ?? 0.0).toDouble();
      int totalTime = (path['time'] ?? 0).toInt();
      return RouteInfo(
        polylinePoints: decodedPoints,
        instructions: instructions,
        distanceInMeters: totalDistance,
        timeInMilliseconds: totalTime,
      );
    }
    throw Exception('No route found between the specified points');
  }

  List<NavigationInstruction> _parseInstructions(
    List instructionsList,
    List<LatLng> decodedPoints,
    LatLng start,
  ) {
    return instructionsList.map((instruction) {
      double distanceMeters = (instruction['distance'] ?? 0.0).toDouble();
      int timeMs = (instruction['time'] ?? 0).toInt();
      String text = instruction['text'] ?? 'Continue';
      int signNumber = instruction['sign'] ?? 0;
      String sign = PolylineUtils.getSignDescription(signNumber);
      LatLng coordinate = start;
      if (instruction['interval'] != null &&
          instruction['interval'].isNotEmpty &&
          instruction['interval'][0] < decodedPoints.length) {
        int pointIndex = instruction['interval'][0];
        coordinate = decodedPoints[pointIndex];
      }
      return NavigationInstruction(
        text: text,
        distance: distanceMeters,
        time: timeMs,
        sign: sign,
        coordinate: coordinate,
      );
    }).toList();
  }

  void _handleErrorResponse(http.Response response) {
    switch (response.statusCode) {
      case 401:
        throw Exception(
          'Invalid API key. Please check your GraphHopper API key.',
        );
      case 429:
        throw Exception('Rate limit exceeded. Please try again later.');
      default:
        throw Exception('GraphHopper API error: ${response.statusCode}');
    }
  }
}
