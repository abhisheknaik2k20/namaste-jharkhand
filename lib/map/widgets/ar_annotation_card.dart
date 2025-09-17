import 'package:flutter/material.dart';
import '../models/ar_annotation.dart';

class ARAnnotationCard extends StatelessWidget {
  const ARAnnotationCard({super.key, required this.annotation});
  final ARAnnotation annotation;

  @override
  Widget build(BuildContext context) {
    final distance = annotation.distanceFromUser;
    final (cardScale, cardWidth) = distance <= 100
        ? (1.0, 160.0)
        : distance <= 300
        ? (0.95, 150.0)
        : distance <= 500
        ? (0.9, 140.0)
        : (0.85, 130.0);

    return Transform.scale(
      scale: cardScale,
      child: Container(
        width: cardWidth,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Row(
            children: [
              _buildImage(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          annotation.placeName ?? annotation.type.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.1,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          if (annotation.placeInfo?.rating != null) ...[
                            Icon(
                              Icons.star,
                              color: Colors.amber[600],
                              size: 12,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              annotation.placeInfo!.rating!.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue[600],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.directions_walk,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    _formatDistance(distance),
                                    style: const TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          if (annotation.placeInfo?.openNow != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 1,
                              ),
                              decoration: BoxDecoration(
                                color: annotation.placeInfo!.openNow == true
                                    ? Colors.green[100]
                                    : Colors.red[100],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                annotation.placeInfo!.openNow == true
                                    ? 'Open'
                                    : 'Closed',
                                style: TextStyle(
                                  fontSize: 8,
                                  color: annotation.placeInfo!.openNow == true
                                      ? Colors.green[700]
                                      : Colors.red[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          if (annotation.placeInfo?.openNow != null &&
                              annotation.placeInfo?.types.isNotEmpty == true)
                            const SizedBox(width: 4),
                          if (annotation.placeInfo?.types.isNotEmpty == true)
                            Expanded(
                              child: Text(
                                _formatPlaceType(
                                  annotation.placeInfo!.types.first,
                                ),
                                style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    const imageWidth = 60.0;
    final hasPhoto = annotation.placeInfo?.photos.isNotEmpty == true;
    return hasPhoto
        ? SizedBox(
            width: imageWidth,
            height: 70,
            child: Image.network(
              'https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&photo_reference=${annotation.placeInfo!.photos.first.photoReference}&key=AIzaSyDiWZ3198smjFepUa0ZAoHePSnSxuhTzRU',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                  ? child
                  : Container(
                      width: imageWidth,
                      height: 70,
                      color: Colors.grey[100],
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
            ),
          )
        : _buildPlaceholder();
  }

  Widget _buildPlaceholder() => Container(
    width: 60,
    height: 70,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          annotation.type.color.withOpacity(0.2),
          annotation.type.color.withOpacity(0.4),
        ],
      ),
    ),
    child: Center(
      child: Icon(
        annotation.type.icon,
        size: 24,
        color: annotation.type.color.withOpacity(0.8),
      ),
    ),
  );

  String _formatDistance(double distance) => distance < 1000
      ? '${distance.toInt()}m'
      : '${(distance / 1000).toStringAsFixed(1)}km';

  String _formatPlaceType(String type) =>
      const {
        'restaurant': 'Restaurant',
        'lodging': 'Hotel',
        'gas_station': 'Gas Station',
        'hospital': 'Hospital',
        'pharmacy': 'Pharmacy',
        'bank': 'Bank',
        'atm': 'ATM',
        'shopping_mall': 'Shopping Mall',
        'tourist_attraction': 'Tourist Attraction',
        'point_of_interest': 'Point of Interest',
        'establishment': 'Business',
        'food': 'Food',
        'bar': 'Bar',
        'store': 'Store',
      }[type] ??
      type
          .replaceAll('_', ' ')
          .toLowerCase()
          .split(' ')
          .map((word) => word[0].toUpperCase() + word.substring(1))
          .join(' ');
}
