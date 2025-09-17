import 'package:flutter/material.dart';
import '../controllers/map_controller.dart';
import '../utils/app_theme.dart';

class GoogleMapsStyleControls extends StatelessWidget {
  final MapController mapController;

  const GoogleMapsStyleControls({super.key, required this.mapController});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 16,
      bottom: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Layers button
          Container(
            width: 48,
            height: 48,
            margin: EdgeInsets.only(bottom: 8),
            child: FloatingActionButton(
              heroTag: "layers",
              backgroundColor: Colors.white,
              elevation: 4,
              onPressed: () {
                mapController.toggleTouristDestinations();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      mapController.showTouristDestinations
                          ? 'Tourist destinations shown'
                          : 'Tourist destinations hidden',
                    ),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Icon(
                mapController.showTouristDestinations
                    ? Icons.layers
                    : Icons.layers_outlined,
                color: AppTheme.secondaryGrey,
                size: 24,
              ),
            ),
          ),
          Container(
            width: 48,
            height: 48,
            margin: EdgeInsets.only(bottom: 8),
            child: FloatingActionButton(
              heroTag: "location",
              backgroundColor: Colors.white,
              elevation: 4,
              onPressed: () {
                if (mapController.currentLocation != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Focusing on your location in Jharkhand'),
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.blue.shade600,
                    ),
                  );
                }
              },
              child: Icon(
                Icons.my_location,
                color: Colors.blue.shade600,
                size: 24,
              ),
            ),
          ),
          if (mapController.currentLocation != null)
            SizedBox(
              width: 48,
              height: 48,
              child: FloatingActionButton(
                heroTag: "directions",
                backgroundColor: Colors.blue.shade600,
                elevation: 4,
                onPressed: () async => await mapController.createRoute(),
                child: Icon(Icons.directions, color: Colors.white, size: 24),
              ),
            ),
        ],
      ),
    );
  }
}
