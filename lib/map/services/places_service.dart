import 'dart:convert';
import 'package:http/http.dart' as http;

class PlacesService {
  static const String _apiKey = 'AIzaSyDiWZ3198smjFepUa0ZAoHePSnSxuhTzRU';
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api/place';

  static Future<PlaceInfo?> getPlaceFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      // Use nearby search with comprehensive fields
      final url =
          '$_baseUrl/nearbysearch/json?location=$latitude,$longitude&radius=50&key=$_apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'] != null && data['results'].isNotEmpty) {
          final place = data['results'][0];
          return PlaceInfo.fromJson(place);
        }
      }

      // Fallback to geocoding API for basic address info
      return await _getAddressFromCoordinates(latitude, longitude);
    } catch (e) {
      print('Error getting place from coordinates: $e');
      return null;
    }
  }

  // Fallback method using geocoding API
  static Future<PlaceInfo?> _getAddressFromCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$_apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['results'] != null && data['results'].isNotEmpty) {
          final result = data['results'][0];
          return PlaceInfo(
            name: result['formatted_address'] ?? 'Unknown Location',
            address: result['formatted_address'] ?? '',
            rating: null,
            phoneNumber: null,
            website: null,
            openingHours: [],
            types: (result['types'] as List<dynamic>?)?.cast<String>() ?? [],
            latitude: latitude,
            longitude: longitude,
          );
        }
      }
    } catch (e) {
      print('Error getting address from coordinates: $e');
    }
    return null;
  }

  // Get detailed place information
  static Future<PlaceInfo?> getPlaceDetails(String placeId) async {
    try {
      const fields =
          'name,formatted_address,rating,formatted_phone_number,website,'
          'opening_hours,types,geometry,business_status,price_level,'
          'user_ratings_total,photos,icon,icon_background_color,'
          'icon_mask_base_uri,place_id,plus_code,reference,scope,'
          'vicinity,permanently_closed';

      final url =
          '$_baseUrl/details/json?place_id=$placeId&fields=$fields&key=$_apiKey';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['result'] != null) {
          return PlaceInfo.fromJson(data['result']);
        }
      }
    } catch (e) {
      print('Error getting place details: $e');
    }
    return null;
  }
}

class PlaceInfo {
  final String name;
  final String address;
  final String? vicinity;
  final double? rating;
  final int? userRatingsTotal;
  final int? priceLevel;
  final String? phoneNumber;
  final String? website;
  final List<String> openingHours;
  final List<String> types;
  final double latitude;
  final double longitude;
  final String? businessStatus;
  final bool? openNow;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final List<PlacePhoto> photos;
  final String? placeId;
  final String? reference;
  final String? scope;
  final PlusCode? plusCode;
  final bool? permanentlyClosed;

  PlaceInfo({
    required this.name,
    required this.address,
    this.vicinity,
    this.rating,
    this.userRatingsTotal,
    this.priceLevel,
    this.phoneNumber,
    this.website,
    this.openingHours = const [],
    this.types = const [],
    required this.latitude,
    required this.longitude,
    this.businessStatus,
    this.openNow,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.photos = const [],
    this.placeId,
    this.reference,
    this.scope,
    this.plusCode,
    this.permanentlyClosed,
  });

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    final geometry = json['geometry']?['location'];
    final openingHours = json['opening_hours'];

    return PlaceInfo(
      name: json['name'] ?? json['formatted_address'] ?? 'Unknown Location',
      address: json['formatted_address'] ?? json['vicinity'] ?? '',
      vicinity: json['vicinity'],
      rating: json['rating']?.toDouble(),
      userRatingsTotal: json['user_ratings_total'],
      priceLevel: json['price_level'],
      phoneNumber: json['formatted_phone_number'],
      website: json['website'],
      openingHours:
          json['opening_hours']?['weekday_text']?.cast<String>() ?? [],
      types: json['types']?.cast<String>() ?? [],
      latitude: geometry?['lat']?.toDouble() ?? 0.0,
      longitude: geometry?['lng']?.toDouble() ?? 0.0,
      businessStatus: json['business_status'],
      openNow: openingHours?['open_now'],
      icon: json['icon'],
      iconBackgroundColor: json['icon_background_color'],
      iconMaskBaseUri: json['icon_mask_base_uri'],
      photos: json['photos'] != null
          ? (json['photos'] as List)
                .map((photo) => PlacePhoto.fromJson(photo))
                .toList()
          : [],
      placeId: json['place_id'],
      reference: json['reference'],
      scope: json['scope'],
      plusCode: json['plus_code'] != null
          ? PlusCode.fromJson(json['plus_code'])
          : null,
      permanentlyClosed: json['permanently_closed'],
    );
  }
}

class PlacePhoto {
  final int height;
  final int width;
  final String photoReference;
  final List<String> htmlAttributions;

  PlacePhoto({
    required this.height,
    required this.width,
    required this.photoReference,
    required this.htmlAttributions,
  });

  factory PlacePhoto.fromJson(Map<String, dynamic> json) {
    return PlacePhoto(
      height: json['height'] ?? 0,
      width: json['width'] ?? 0,
      photoReference: json['photo_reference'] ?? '',
      htmlAttributions:
          (json['html_attributions'] as List<dynamic>?)?.cast<String>() ?? [],
    );
  }
}

class PlusCode {
  final String? compoundCode;
  final String? globalCode;

  PlusCode({this.compoundCode, this.globalCode});

  factory PlusCode.fromJson(Map<String, dynamic> json) {
    return PlusCode(
      compoundCode: json['compound_code'],
      globalCode: json['global_code'],
    );
  }
}
