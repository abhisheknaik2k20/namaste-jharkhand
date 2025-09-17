import 'package:flutter/material.dart';
import '../services/places_service.dart';
import '../utils/app_theme.dart';
import 'common_widgets.dart';

class PlaceInfoSheet extends StatelessWidget {
  final PlaceInfo place;

  const PlaceInfoSheet({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 36,
            height: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.dividerGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Image Section
                  if (place.photos.isNotEmpty) ...[
                    SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: PageView.builder(
                        itemCount: place.photos.length.clamp(0, 5),
                        itemBuilder: (context, index) {
                          final photo = place.photos[index];
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                    'https://maps.googleapis.com/maps/api/place/photo?maxwidth=800&photo_reference=${photo.photoReference}&key=AIzaSyDiWZ3198smjFepUa0ZAoHePSnSxuhTzRU',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return CommonWidgets.buildErrorPlaceholder(
                                        width: double.infinity,
                                        height: 180,
                                      );
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return CommonWidgets.buildLoadingPlaceholder(
                                            width: double.infinity,
                                            height: 180,
                                          );
                                        },
                                  ),
                                  if (place.photos.length > 1)
                                    Positioned(
                                      top: 12,
                                      right: 12,
                                      child:
                                          CommonWidgets.buildPhotoCounterBadge(
                                            index,
                                            place.photos.length,
                                          ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],

                  // Main Info Section
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Place Name
                        Text(
                          place.name,
                          style: AppTheme.titleText,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: 4),

                        // Rating and Reviews Row
                        if (place.rating != null) ...[
                          Row(
                            children: [
                              // Star Rating
                              Text(
                                place.rating!.toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 4),
                              CommonWidgets.buildRatingStars(
                                rating: place.rating!,
                              ),
                              SizedBox(width: 6),
                              if (place.userRatingsTotal != null)
                                Text(
                                  '(${place.userRatingsTotal})',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.primaryGrey,
                                  ),
                                ),
                              if (place.priceLevel != null) ...[
                                SizedBox(width: 8),
                                Text(
                                  '• ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.primaryGrey,
                                  ),
                                ),
                                Text(
                                  '\$' * place.priceLevel!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.secondaryGrey,
                                  ),
                                ),
                              ],
                            ],
                          ),
                          SizedBox(height: 4),
                        ],

                        // Category and Open Status
                        Row(
                          children: [
                            // Primary Category
                            if (place.types.isNotEmpty)
                              Text(
                                _getPrimaryCategory(place.types.first),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.primaryGrey,
                                ),
                              ),
                            if (place.openNow != null ||
                                place.permanentlyClosed == true) ...[
                              Text(
                                place.types.isNotEmpty ? ' • ' : '',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.primaryGrey,
                                ),
                              ),
                              Text(
                                place.permanentlyClosed == true
                                    ? 'Permanently closed'
                                    : place.openNow == true
                                    ? 'Open'
                                    : 'Closed',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: place.permanentlyClosed == true
                                      ? AppTheme.businessClosed
                                      : place.openNow == true
                                      ? AppTheme.businessOpen
                                      : AppTheme.businessClosingSoon,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ),

                        SizedBox(height: 16),

                        // Action Buttons Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CommonWidgets.buildActionButton(
                              icon: Icons.directions,
                              label: 'Directions',
                              onTap: () {},
                            ),
                            if (place.phoneNumber != null)
                              CommonWidgets.buildActionButton(
                                icon: Icons.phone,
                                label: 'Call',
                                onTap: () {},
                              ),
                            CommonWidgets.buildActionButton(
                              icon: Icons.bookmark_border,
                              label: 'Save',
                              onTap: () {},
                            ),
                            CommonWidgets.buildActionButton(
                              icon: Icons.share_outlined,
                              label: 'Share',
                              onTap: () {},
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        // Address Section
                        if (place.address.isNotEmpty) ...[
                          CommonWidgets.buildInfoRow(
                            icon: Icons.location_on_outlined,
                            text: place.address,
                          ),
                          SizedBox(height: 16),
                        ],

                        // Phone Section
                        if (place.phoneNumber != null) ...[
                          CommonWidgets.buildInfoRow(
                            icon: Icons.phone_outlined,
                            text: place.phoneNumber!,
                            isLink: true,
                          ),
                          SizedBox(height: 16),
                        ],

                        // Website Section
                        if (place.website != null) ...[
                          CommonWidgets.buildInfoRow(
                            icon: Icons.language_outlined,
                            text: _formatWebsite(place.website!),
                            isLink: true,
                          ),
                          SizedBox(height: 16),
                        ],

                        // Opening Hours Section
                        if (place.openingHours.isNotEmpty) ...[
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                size: 20,
                                color: AppTheme.primaryGrey,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hours',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    ...place.openingHours.map(
                                      (hour) => Padding(
                                        padding: EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          hour,
                                          style: AppTheme.bodyText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],

                        // About Section
                        if (place.types.isNotEmpty) ...[
                          Text(
                            'About',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: place.types.take(6).map((type) {
                              return CommonWidgets.buildRoundedContainer(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                child: Text(
                                  _getPrimaryCategory(type),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppTheme.secondaryGrey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],

                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getPrimaryCategory(String type) {
    final categoryMap = {
      'restaurant': 'Restaurant',
      'food': 'Food',
      'lodging': 'Hotel',
      'gas_station': 'Gas station',
      'hospital': 'Hospital',
      'pharmacy': 'Pharmacy',
      'bank': 'Bank',
      'atm': 'ATM',
      'shopping_mall': 'Shopping mall',
      'store': 'Store',
      'supermarket': 'Supermarket',
      'convenience_store': 'Convenience store',
      'bakery': 'Bakery',
      'cafe': 'Cafe',
      'bar': 'Bar',
      'night_club': 'Night club',
      'movie_theater': 'Movie theater',
      'gym': 'Gym',
      'park': 'Park',
      'tourist_attraction': 'Tourist attraction',
      'point_of_interest': 'Point of interest',
      'establishment': 'Business',
    };

    return categoryMap[type] ??
        type
            .replaceAll('_', ' ')
            .toLowerCase()
            .split(' ')
            .map((word) => word._capitalize())
            .join(' ');
  }

  String _formatWebsite(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      return url.replaceFirst(RegExp(r'https?://'), '');
    }
    return url;
  }
}

extension StringExtension on String {
  String _capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
