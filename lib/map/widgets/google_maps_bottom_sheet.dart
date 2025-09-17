import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';
import '../utils/jharkhand_locations.dart';
import '../utils/app_theme.dart';
import '../services/recommendation_service.dart';
import '../models/place_recommendation.dart';
import 'place_details_sheet.dart';

class GoogleMapsStyleBottomSheet extends StatefulWidget {
  final MapController mapController;

  const GoogleMapsStyleBottomSheet({super.key, required this.mapController});

  @override
  State<GoogleMapsStyleBottomSheet> createState() =>
      _GoogleMapsStyleBottomSheetState();
}

class _GoogleMapsStyleBottomSheetState extends State<GoogleMapsStyleBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final RecommendationService _recommendationService = RecommendationService();
  List<PlaceRecommendation> _recommendations = [];
  List<TransitInfo> _transitInfo = [];
  bool _isLoadingRecommendations = false;
  bool _isLoadingTransit = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // Updated to 5 tabs
    _loadRecommendations();
    _loadTransitInfo();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadRecommendations() async {
    setState(() {
      _isLoadingRecommendations = true;
    });

    try {
      final currentLocation = widget.mapController.currentLocation;
      if (currentLocation != null) {
        final recommendations = await _recommendationService
            .getRecommendedPlaces(location: currentLocation, radius: 5000);
        setState(() {
          _recommendations = recommendations;
        });
      }
    } catch (e) {
      print('Error loading recommendations: $e');
    } finally {
      setState(() {
        _isLoadingRecommendations = false;
      });
    }
  }

  Future<void> _loadTransitInfo() async {
    print('_loadTransitInfo: Starting to load transit info');

    if (!mounted) {
      print('_loadTransitInfo: Widget not mounted, returning');
      return;
    }

    setState(() {
      _isLoadingTransit = true;
    });

    print('_loadTransitInfo: Set loading state to true');

    try {
      final currentLocation = widget.mapController.currentLocation;
      print('_loadTransitInfo: Current location: $currentLocation');

      if (currentLocation != null) {
        print('_loadTransitInfo: Calling recommendation service');

        final transitInfo = await _recommendationService.getCurrentTransitInfo(
          location: currentLocation,
        );

        print('_loadTransitInfo: Got ${transitInfo.length} transit info items');

        if (mounted) {
          setState(() {
            _transitInfo = transitInfo;
            _isLoadingTransit = false;
          });
          print('_loadTransitInfo: Updated state with transit info');
        }
      } else {
        print('_loadTransitInfo: No current location available');
        if (mounted) {
          setState(() {
            _isLoadingTransit = false;
          });
        }
      }
    } catch (e) {
      print('Error loading transit info: $e');
      if (mounted) {
        setState(() {
          _isLoadingTransit = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Handle
          Container(
            margin: EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.dividerGrey,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Header
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.location_on, color: Colors.green.shade700),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore Jharkhand',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Discover amazing destinations',
                        style: TextStyle(
                          color: AppTheme.primaryGrey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    // Close bottom sheet
                  },
                ),
              ],
            ),
          ),
          // Tabs
          TabBar(
            controller: _tabController,
            labelColor: Colors.green.shade700,
            unselectedLabelColor: AppTheme.primaryGrey,
            indicatorColor: Colors.green.shade700,
            isScrollable: true,
            tabs: [
              Tab(text: 'Destinations'),
              Tab(text: 'Live Transit'),
              Tab(text: 'For You'),
              Tab(text: 'Categories'),
              Tab(text: 'Nearby'),
            ],
          ),
          // Tab Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildDestinationsTab(),
                _buildLiveTransitTab(),
                _buildRecommendationsTab(),
                _buildCategoriesTab(),
                _buildNearbyTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationsTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: JharkhandLocations.destinations.length,
      itemBuilder: (context, index) {
        final destination = JharkhandLocations.destinations[index];
        return Card(
          margin: EdgeInsets.only(bottom: 8),
          elevation: 2,
          child: ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: destination.clusterColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getIconForCategory(destination.category),
                color: destination.clusterColor,
                size: 24,
              ),
            ),
            title: Text(
              destination.name,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              destination.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12),
            ),
            trailing: IconButton(
              icon: Icon(Icons.directions),
              onPressed: () {
                widget.mapController.setDestinationToTouristSpot(
                  destination.name,
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Getting directions to ${destination.name}'),
                    backgroundColor: destination.clusterColor,
                  ),
                );
              },
            ),
            onTap: () {
              widget.mapController.setDestinationToTouristSpot(
                destination.name,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCategoriesTab() {
    final categories = <String, List<String>>{};
    for (final dest in JharkhandLocations.destinations) {
      if (!categories.containsKey(dest.category)) {
        categories[dest.category] = [];
      }
      categories[dest.category]!.add(dest.name);
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories.keys.elementAt(index);
        final destinations = categories[category]!;

        return Card(
          margin: EdgeInsets.only(bottom: 8),
          child: ExpansionTile(
            leading: Icon(_getIconForCategory(category)),
            title: Text(category),
            subtitle: Text('${destinations.length} destinations'),
            children: destinations.map((dest) {
              return ListTile(
                title: Text(dest),
                onTap: () {
                  widget.mapController.setDestinationToTouristSpot(dest);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildNearbyTab() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.near_me, color: Colors.orange.shade700),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nearby Places',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Discover places around you',
                    style: TextStyle(color: AppTheme.primaryGrey, fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '5 km',
                  style: TextStyle(
                    color: Colors.orange.shade700,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Nearby Places List
          Expanded(
            child: ListView.builder(
              itemCount: _getNearbyPlaces().length,
              itemBuilder: (context, index) {
                final place = _getNearbyPlaces()[index];
                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      _showPlaceDetails(context, place);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(
                              _getIconForTypes(place.types),
                              color: Colors.orange.shade700,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  place.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  place.address,
                                  style: TextStyle(
                                    color: AppTheme.primaryGrey,
                                    fontSize: 12,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    if (place.rating > 0) ...[
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 12,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        place.rating.toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                    Text(
                                      _calculateDistance(place.location),
                                      style: TextStyle(
                                        color: Colors.orange.shade700,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.directions, size: 18),
                                color: Colors.orange.shade700,
                                onPressed: () {
                                  widget.mapController.setDestination(
                                    place.location,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Getting directions to ${place.name}',
                                      ),
                                      backgroundColor: Colors.orange.shade600,
                                    ),
                                  );
                                },
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                              if (place.openNow)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Open',
                                    style: TextStyle(
                                      color: Colors.green.shade700,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<PlaceRecommendation> _getNearbyPlaces() {
    // Mock nearby places data
    return [
      PlaceRecommendation(
        placeId: 'nearby_1',
        name: 'Coffee Central',
        address: '123 Main Street, Ranchi',
        location: LatLng(23.3441, 85.3096),
        rating: 4.2,
        priceLevel: 2,
        types: ['restaurant', 'cafe'],
        openNow: true,
        recommendationScore: 4.2,
        recommendationReason: 'Popular coffee shop nearby',
      ),
      PlaceRecommendation(
        placeId: 'nearby_2',
        name: 'Quick Mart',
        address: '456 Park Road, Ranchi',
        location: LatLng(23.3500, 85.3150),
        rating: 3.8,
        priceLevel: 1,
        types: ['store', 'grocery_or_supermarket'],
        openNow: true,
        recommendationScore: 3.8,
        recommendationReason: 'Convenient grocery store',
      ),
      PlaceRecommendation(
        placeId: 'nearby_3',
        name: 'City Bank ATM',
        address: 'Station Road, Ranchi',
        location: LatLng(23.3450, 85.3080),
        rating: 3.5,
        priceLevel: 0,
        types: ['atm', 'bank'],
        openNow: true,
        recommendationScore: 3.5,
        recommendationReason: '24/7 ATM service',
      ),
      PlaceRecommendation(
        placeId: 'nearby_4',
        name: 'Green Park',
        address: 'Forest Area, Ranchi',
        location: LatLng(23.3600, 85.3200),
        rating: 4.5,
        priceLevel: 0,
        types: ['park', 'tourist_attraction'],
        openNow: true,
        recommendationScore: 4.5,
        recommendationReason: 'Beautiful park for relaxation',
      ),
      PlaceRecommendation(
        placeId: 'nearby_5',
        name: 'Medical Plus Pharmacy',
        address: 'Hospital Road, Ranchi',
        location: LatLng(23.3480, 85.3120),
        rating: 4.0,
        priceLevel: 1,
        types: ['pharmacy', 'health'],
        openNow: true,
        recommendationScore: 4.0,
        recommendationReason: 'Trusted pharmacy with medicines',
      ),
    ];
  }

  String _calculateDistance(LatLng placeLocation) {
    // Mock distance calculation
    final distances = ['0.2 km', '0.5 km', '0.8 km', '1.2 km', '1.5 km'];
    return distances[DateTime.now().millisecond % distances.length];
  }

  IconData _getIconForCategory(String category) {
    switch (category) {
      case 'Waterfall':
        return Icons.water;
      case 'National Park':
        return Icons.forest;
      case 'Religious':
        return Icons.temple_hindu;
      case 'Valley':
        return Icons.landscape;
      case 'Hill Station':
        return Icons.terrain;
      case 'Caves':
        return Icons.explore;
      default:
        return Icons.location_on;
    }
  }

  Widget _buildLiveTransitTab() {
    print(
      '_buildLiveTransitTab: isLoading=$_isLoadingTransit, transitInfo count=${_transitInfo.length}',
    );

    if (_isLoadingTransit) {
      print('_buildLiveTransitTab: Showing loading indicator');
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTransitHeader(),
            SizedBox(height: 32),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Loading real-time transit information...',
                      style: TextStyle(
                        color: AppTheme.primaryGrey,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fetching live data from Google Transit API',
                      style: TextStyle(
                        color: AppTheme.primaryGrey,
                        fontSize: 12,
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

    if (_transitInfo.isEmpty) {
      print('_buildLiveTransitTab: Transit info is empty, showing empty state');
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildTransitHeader(),
            SizedBox(height: 32),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.directions_bus_outlined,
                      size: 64,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No Transit Routes Found',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'No public transit available in this area',
                      style: TextStyle(
                        color: AppTheme.primaryGrey,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _loadTransitInfo,
                      icon: Icon(Icons.refresh),
                      label: Text('Refresh'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
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

    print(
      '_buildLiveTransitTab: Displaying ${_transitInfo.length} transit items',
    );

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Service Alerts
          _buildTransitHeader(),
          SizedBox(height: 16),

          // Service Alerts Summary
          if (_transitInfo.any((t) => t.serviceAlerts.isNotEmpty))
            _buildServiceAlertsSection(),

          // Transit List
          Expanded(
            child: ListView.builder(
              itemCount: _transitInfo.length,
              itemBuilder: (context, index) {
                final transit = _transitInfo[index];
                return _buildComprehensiveTransitCard(transit);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransitHeader() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade100, Colors.blue.shade50],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.directions_bus,
            color: Colors.blue.shade700,
            size: 24,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Live Transit Network',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Complete real-time transit information',
                style: TextStyle(color: AppTheme.primaryGrey, fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 6),
              Text(
                'LIVE DATA',
                style: TextStyle(
                  color: Colors.green.shade700,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceAlertsSection() {
    final allAlerts = _transitInfo.expand((t) => t.serviceAlerts).toList();

    if (allAlerts.isEmpty) return SizedBox.shrink();

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        border: Border.all(color: Colors.amber.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.amber.shade700,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Service Alerts (${allAlerts.length})',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.amber.shade800,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          ...allAlerts
              .take(2)
              .map(
                (alert) => Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    '• ${alert.title}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.amber.shade700,
                    ),
                  ),
                ),
              ),
          if (allAlerts.length > 2)
            Text(
              'and ${allAlerts.length - 2} more...',
              style: TextStyle(
                fontSize: 11,
                color: Colors.amber.shade600,
                fontStyle: FontStyle.italic,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildComprehensiveTransitCard(TransitInfo transit) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTransitCardHeader(transit),
          _buildVehicleInfo(transit),
          _buildCurrentLocationStatus(transit),
          _buildRouteProgress(transit),
          _buildStopDetails(transit),
          _buildServiceInfo(transit),
          _buildTransitFooter(transit),
        ],
      ),
    );
  }

  Widget _buildTransitCardHeader(TransitInfo transit) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(
              int.parse(transit.lineColor.substring(1), radix: 16) + 0xFF000000,
            ),
            Color(
              int.parse(transit.lineColor.substring(1), radix: 16) + 0xFF000000,
            ).withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getVehicleIcon(transit.vehicleInfo.type),
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${transit.shortName} • ${transit.routeName}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      transit.longName,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      transit.operatorName,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              _buildStatusChip(transit.currentStatus),
            ],
          ),
          SizedBox(height: 12),
          // Real-time Status Row
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.speed, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text(
                  '${transit.speed.toStringAsFixed(1)} km/h',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 16),
                Icon(Icons.schedule, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text(
                  '${transit.delayMinutes > 0 ? "+${transit.delayMinutes}" : "On time"}',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                Spacer(),
                if (transit.hasLiveTracking)
                  Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Live',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleInfo(TransitInfo transit) {
    final vehicle = transit.vehicleInfo;
    final occupancyRate = vehicle.currentOccupancy / vehicle.capacity;

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehicle Information',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${vehicle.model} • ${vehicle.vehicleId}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'Capacity: ${vehicle.capacity} passengers',
                            style: TextStyle(
                              color: AppTheme.primaryGrey,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (vehicle.isAccessible)
                      Icon(Icons.accessible, color: Colors.blue, size: 16),
                  ],
                ),
                SizedBox(height: 8),
                // Occupancy Bar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Current Occupancy',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppTheme.primaryGrey,
                          ),
                        ),
                        Text(
                          '${vehicle.currentOccupancy}/${vehicle.capacity}',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: occupancyRate,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        occupancyRate > 0.8
                            ? Colors.red
                            : occupancyRate > 0.6
                            ? Colors.orange
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Amenities
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    if (vehicle.hasWifi) _buildAmenityChip('WiFi', Icons.wifi),
                    if (vehicle.hasAirConditioning)
                      _buildAmenityChip('AC', Icons.ac_unit),
                    if (transit.isElectric)
                      _buildAmenityChip('Electric', Icons.electric_bolt),
                    ...vehicle.amenities
                        .take(3)
                        .map(
                          (amenity) => _buildAmenityChip(
                            amenity,
                            Icons.check_circle_outline,
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentLocationStatus(TransitInfo transit) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Status',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.my_location,
                      color: Colors.blue.shade700,
                      size: 20,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Currently at: ${transit.currentStop.stopName}',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.navigation,
                      color: Colors.green.shade700,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Next: ${transit.nextStop.stopName}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: transit.nextStop.arrivalMinutes <= 2
                            ? Colors.orange.shade100
                            : Colors.green.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${transit.nextStop.arrivalMinutes} min',
                        style: TextStyle(
                          color: transit.nextStop.arrivalMinutes <= 2
                              ? Colors.orange.shade700
                              : Colors.green.shade700,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                if (transit.delayMinutes > 0) ...[
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.schedule_outlined,
                          color: Colors.orange.shade700,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Delayed ${transit.delayMinutes} min: ${transit.delayReason}',
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteProgress(TransitInfo transit) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Route Progress',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              Text(
                '${transit.routePattern.direction} • ${transit.routePattern.totalDistance.toStringAsFixed(1)} km',
                style: TextStyle(color: AppTheme.primaryGrey, fontSize: 11),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Route Timeline
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: transit.allStops.length,
              itemBuilder: (context, index) {
                final stop = transit.allStops[index];
                final isPassed =
                    index < transit.allStops.indexOf(transit.currentStop);
                final isCurrent = stop.stopId == transit.currentStop.stopId;
                final isNext = stop.stopId == transit.nextStop.stopId;

                return Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    children: [
                      // Timeline dot
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: isPassed
                              ? Colors.green
                              : isCurrent
                              ? Colors.blue
                              : isNext
                              ? Colors.orange
                              : Colors.grey.shade300,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isCurrent
                                ? Colors.blue.shade700
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: isCurrent
                            ? Icon(
                                Icons.my_location,
                                size: 10,
                                color: Colors.white,
                              )
                            : null,
                      ),
                      // Connecting line
                      if (index < transit.allStops.length - 1)
                        Container(
                          width: 2,
                          height: 20,
                          color: isPassed ? Colors.green : Colors.grey.shade300,
                        ),
                      SizedBox(height: 8),
                      // Stop info
                      Column(
                        children: [
                          Text(
                            stop.stopName,
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: isCurrent
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isCurrent
                                  ? Colors.blue.shade700
                                  : AppTheme.primaryGrey,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (stop.arrivalMinutes >= 0)
                            Text(
                              '${stop.arrivalMinutes}m',
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          // Transfer indicator
                          if (stop.isTransferPoint)
                            Icon(
                              Icons.transfer_within_a_station,
                              size: 12,
                              color: Colors.purple.shade400,
                            ),
                          // Accessibility indicator
                          if (stop.isAccessible)
                            Icon(
                              Icons.accessible,
                              size: 10,
                              color: Colors.blue.shade400,
                            ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStopDetails(TransitInfo transit) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Intermediate Stops & Details',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 8),
          Container(
            constraints: BoxConstraints(maxHeight: 200),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: transit.upcomingStops.length,
              itemBuilder: (context, index) {
                final stop = transit.upcomingStops[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: stop.arrivalMinutes <= 5
                              ? Colors.orange.shade100
                              : Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: stop.arrivalMinutes <= 5
                                  ? Colors.orange.shade700
                                  : Colors.blue.shade700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    stop.stopName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${stop.arrivalMinutes} min',
                                  style: TextStyle(
                                    color: stop.arrivalMinutes <= 5
                                        ? Colors.orange.shade700
                                        : Colors.blue.shade700,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            if (stop.nearbyLandmarks.isNotEmpty) ...[
                              SizedBox(height: 2),
                              Text(
                                'Near: ${stop.nearbyLandmarks.take(2).join(", ")}',
                                style: TextStyle(
                                  color: AppTheme.primaryGrey,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                            SizedBox(height: 4),
                            Row(
                              children: [
                                if (stop.isAccessible)
                                  Icon(
                                    Icons.accessible,
                                    size: 12,
                                    color: Colors.blue,
                                  ),
                                if (stop.isTransferPoint) ...[
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.transfer_within_a_station,
                                    size: 12,
                                    color: Colors.purple,
                                  ),
                                ],
                                if (stop.facilities.contains('restroom')) ...[
                                  SizedBox(width: 4),
                                  Icon(Icons.wc, size: 12, color: Colors.green),
                                ],
                                Spacer(),
                                // Crowding indicator
                                Container(
                                  width: 40,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: Colors.grey.shade200,
                                  ),
                                  child: FractionallySizedBox(
                                    widthFactor: stop.crowdingLevel,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: stop.crowdingLevel > 0.7
                                            ? Colors.red
                                            : stop.crowdingLevel > 0.4
                                            ? Colors.orange
                                            : Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (stop.delay != null) ...[
                              SizedBox(height: 4),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'Delay: ${stop.delay}',
                                  style: TextStyle(
                                    color: Colors.orange.shade700,
                                    fontSize: 9,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceInfo(TransitInfo transit) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Information',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                _buildServiceInfoRow(
                  'Operating Hours',
                  transit.operatingHours,
                  Icons.access_time,
                ),
                _buildServiceInfoRow(
                  'Frequency',
                  'Every ${transit.frequency} minutes',
                  Icons.update,
                ),
                _buildServiceInfoRow(
                  'Fare',
                  '₹${transit.fare.toStringAsFixed(0)}',
                  Icons.payments,
                ),
                _buildServiceInfoRow(
                  'Payment',
                  transit.paymentMethods.join(", "),
                  Icons.payment,
                ),
                _buildServiceInfoRow(
                  'CO₂ Impact',
                  '${transit.co2Emissions} kg per passenger',
                  Icons.eco,
                ),
                if (transit.weatherImpact.isNotEmpty)
                  _buildServiceInfoRow(
                    'Weather',
                    transit.weatherImpact,
                    Icons.wb_sunny,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransitFooter(TransitInfo transit) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (transit.alternativeRoutes.isNotEmpty) ...[
            Text(
              'Alternative Routes',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
            SizedBox(height: 4),
            Wrap(
              spacing: 6,
              children: transit.alternativeRoutes
                  .map(
                    (route) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        route,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 8),
          ],
          Row(
            children: [
              Expanded(
                child: Text(
                  'Trip: ${transit.tripId}',
                  style: TextStyle(fontSize: 10, color: AppTheme.primaryGrey),
                ),
              ),
              Text(
                'Updated ${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(transit.realtimeData['last_updated'])).inSeconds}s ago',
                style: TextStyle(fontSize: 10, color: AppTheme.primaryGrey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppTheme.primaryGrey),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(fontSize: 11, color: AppTheme.primaryGrey),
          ),
          Spacer(),
          Text(
            value,
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenityChip(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 10, color: Colors.blue.shade700),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(fontSize: 9, color: Colors.blue.shade700),
          ),
        ],
      ),
    );
  }

  IconData _getVehicleIcon(String type) {
    switch (type.toLowerCase()) {
      case 'bus':
        return Icons.directions_bus;
      case 'train':
        return Icons.train;
      case 'metro':
        return Icons.subway;
      case 'tram':
        return Icons.tram;
      default:
        return Icons.directions_transit;
    }
  }

  Widget _buildStatusChip(String status) {
    Color color;
    String text;
    IconData? icon;

    switch (status) {
      case 'on_time':
        color = Colors.green;
        text = 'On Time';
        icon = Icons.check_circle;
        break;
      case 'delayed':
        color = Colors.orange;
        text = 'Delayed';
        icon = Icons.schedule;
        break;
      case 'approaching':
        color = Colors.blue;
        text = 'Approaching';
        icon = Icons.near_me;
        break;
      case 'boarding':
        color = Colors.purple;
        text = 'Boarding';
        icon = Icons.sensors;
        break;
      case 'in_transit':
        color = Colors.teal;
        text = 'In Transit';
        icon = Icons.directions;
        break;
      default:
        color = Colors.grey;
        text = 'Unknown';
        icon = Icons.help_outline;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsTab() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade200, Colors.purple.shade100],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.auto_awesome, color: Colors.purple.shade700),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended for You',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Personalized based on your interests',
                    style: TextStyle(color: AppTheme.primaryGrey, fontSize: 12),
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple.shade200, Colors.purple.shade100],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.psychology,
                      size: 10,
                      color: Colors.purple.shade700,
                    ),
                    SizedBox(width: 3),
                    Text(
                      'AI',
                      style: TextStyle(
                        color: Colors.purple.shade700,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Recommendations List
          Expanded(
            child: _isLoadingRecommendations
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.purple.shade400,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Analyzing your preferences...',
                          style: TextStyle(color: AppTheme.primaryGrey),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _recommendations.length,
                    itemBuilder: (context, index) {
                      final place = _recommendations[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 12),
                        elevation: 3,
                        child: InkWell(
                          onTap: () {
                            _showPlaceDetails(context, place);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Header with recommendation score
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.purple.shade200,
                                            Colors.purple.shade100,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Icon(
                                        _getIconForTypes(place.types),
                                        color: Colors.purple.shade700,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  place.name,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              _buildRecommendationScore(
                                                place.recommendationScore,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 2),
                                          Text(
                                            place.address,
                                            style: TextStyle(
                                              color: AppTheme.primaryGrey,
                                              fontSize: 11,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),

                                // Recommendation reason
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.purple.shade50,
                                        Colors.purple.shade100,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.psychology,
                                        color: Colors.purple.shade600,
                                        size: 14,
                                      ),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          place.recommendationReason,
                                          style: TextStyle(
                                            color: Colors.purple.shade700,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Rating and status row
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    if (place.rating > 0) ...[
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 14,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        place.rating.toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                    ],
                                    if (place.openNow) ...[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          'Open now',
                                          style: TextStyle(
                                            color: Colors.green.shade700,
                                            fontSize: 9,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                    Spacer(),
                                    IconButton(
                                      icon: Icon(Icons.directions, size: 18),
                                      color: Colors.purple.shade600,
                                      onPressed: () {
                                        widget.mapController.setDestination(
                                          place.location,
                                        );
                                      },
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationScore(double score) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade300, Colors.purple.shade200],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        '${(score * 10).round()}%',
        style: TextStyle(
          color: Colors.white,
          fontSize: 9,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  IconData _getIconForTypes(List<String> types) {
    if (types.contains('restaurant') || types.contains('food')) {
      return Icons.restaurant;
    } else if (types.contains('shopping_mall') || types.contains('store')) {
      return Icons.shopping_bag;
    } else if (types.contains('tourist_attraction')) {
      return Icons.attractions;
    } else if (types.contains('park')) {
      return Icons.park;
    } else if (types.contains('hospital')) {
      return Icons.local_hospital;
    } else if (types.contains('gas_station')) {
      return Icons.local_gas_station;
    } else if (types.contains('atm') || types.contains('bank')) {
      return Icons.account_balance;
    } else {
      return Icons.place;
    }
  }

  void _showPlaceDetails(BuildContext context, PlaceRecommendation place) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlaceDetailsSheet(
        place: place,
        onNavigate: () {
          Navigator.pop(context);
          widget.mapController.setDestination(place.location);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Getting directions to ${place.name}'),
              backgroundColor: Colors.blue.shade600,
            ),
          );
        },
        onClose: () => Navigator.pop(context),
      ),
    );
  }
}
