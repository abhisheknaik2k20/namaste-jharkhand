import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';
import '../utils/jharkhand_locations.dart';
import '../utils/app_theme.dart';

class MapView extends StatelessWidget {
  final MapController mapController;
  final Function(GoogleMapController) onMapCreated;
  final Function(LatLng)? onTap;

  const MapView({
    super.key,
    required this.mapController,
    required this.onMapCreated,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: onMapCreated,
          onTap: onTap, // Add the tap handler
          initialCameraPosition: CameraPosition(
            target:
                mapController.currentLocation ??
                JharkhandLocations.mockCurrentLocation,
            zoom:
                13.0, // Good zoom level to see current location and nearby attractions
          ),
          markers: mapController
              .markers, // This includes both current location and tourist destinations
          polylines: mapController.polylines,
          circles: mapController
              .circles, // This includes both location accuracy and destination clusters
          myLocationEnabled: false, // We use our custom location marker instead
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
          buildingsEnabled: true, // Enable buildings for more Google Maps feel
          trafficEnabled: false,
          tiltGesturesEnabled: true, // Allow 3D tilt
          compassEnabled: true,
          rotateGesturesEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          mapType: MapType.normal,
          // Google Maps style customization
          style: '''
          [
            {
              "featureType": "poi.business",
              "stylers": [{"visibility": "off"}]
            },
            {
              "featureType": "poi.park",
              "elementType": "labels.text",
              "stylers": [{"visibility": "off"}]
            }
          ]
          ''',
        ),

        // Loading overlay with Jharkhand styling
        if (mapController.isLoading)
          Container(
            color: Colors.white.withOpacity(0.9),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.green.shade700,
                      ),
                      strokeWidth: 3,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Exploring Jharkhand...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.green.shade800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Finding the best routes for you',
                    style: TextStyle(fontSize: 14, color: AppTheme.primaryGrey),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
