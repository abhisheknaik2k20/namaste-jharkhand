import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OSMSearchResult {
  final String displayName;
  final double latitude;
  final double longitude;
  final String type;
  final String importance;

  OSMSearchResult({
    required this.displayName,
    required this.latitude,
    required this.longitude,
    required this.type,
    required this.importance,
  });

  factory OSMSearchResult.fromJson(Map<String, dynamic> json) {
    return OSMSearchResult(
      displayName: json['display_name'] ?? '',
      latitude: double.tryParse(json['lat'] ?? '0') ?? 0.0,
      longitude: double.tryParse(json['lon'] ?? '0') ?? 0.0,
      type: json['type'] ?? '',
      importance: json['importance']?.toString() ?? '0',
    );
  }

  LatLng get location => LatLng(latitude, longitude);
}

class OSMSearchService {
  static final OSMSearchService _instance = OSMSearchService._internal();
  factory OSMSearchService() => _instance;
  OSMSearchService._internal();
  static const String _baseUrl = 'https://nominatim.openstreetmap.org/search';
  static const Duration _timeout = Duration(seconds: 10);
  Future<List<OSMSearchResult>> searchLocations(
    String query, {
    String? countryCode = 'IN',
    String? state = 'Jharkhand',
    int limit = 5,
  }) async {
    if (query.trim().isEmpty) return [];

    try {
      String searchQuery = query;
      if (state != null) {
        searchQuery += ', $state';
      }
      if (countryCode != null) {
        searchQuery += ', India';
      }

      final uri = Uri.parse(_baseUrl).replace(
        queryParameters: {
          'q': searchQuery,
          'format': 'json',
          'addressdetails': '1',
          'limit': limit.toString(),
          'countrycodes': countryCode ?? 'in',
          'accept-language': 'en',
          'dedupe': '1',
        },
      );

      final response = await http
          .get(
            uri,
            headers: {
              'User-Agent': 'JharkhandNavigationApp/1.0 (Flutter)',
              'Accept': 'application/json',
            },
          )
          .timeout(_timeout);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        List<OSMSearchResult> results = data
            .map((item) => OSMSearchResult.fromJson(item))
            .where(
              (result) =>
                  result.displayName.toLowerCase().contains('jharkhand') ||
                  result.displayName.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();

        results.sort(
          (a, b) =>
              double.parse(b.importance).compareTo(double.parse(a.importance)),
        );

        return results;
      } else {
        throw Exception('Failed to search locations: ${response.statusCode}');
      }
    } catch (e) {
      return [];
    }
  }

  Future<OSMSearchResult?> reverseGeocode(LatLng location) async {
    try {
      final uri = Uri.parse('https://nominatim.openstreetmap.org/reverse')
          .replace(
            queryParameters: {
              'lat': location.latitude.toString(),
              'lon': location.longitude.toString(),
              'format': 'json',
              'addressdetails': '1',
              'accept-language': 'en',
            },
          );

      final response = await http
          .get(
            uri,
            headers: {
              'User-Agent': 'JharkhandNavigationApp/1.0 (Flutter)',
              'Accept': 'application/json',
            },
          )
          .timeout(_timeout);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return OSMSearchResult.fromJson(data);
      }
    } catch (e) {
      //
    }
    return null;
  }
}
