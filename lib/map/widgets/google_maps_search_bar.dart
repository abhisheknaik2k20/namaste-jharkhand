import 'package:flutter/material.dart';
import 'dart:async';
import '../services/osm_search_service.dart';
import '../controllers/map_controller.dart';
import '../utils/jharkhand_locations.dart';
import '../utils/app_theme.dart';

class GoogleMapsStyleSearchBar extends StatefulWidget {
  final MapController mapController;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onExplorePressed;

  const GoogleMapsStyleSearchBar({
    super.key,
    required this.mapController,
    this.onMenuPressed,
    this.onExplorePressed,
  });

  @override
  State<GoogleMapsStyleSearchBar> createState() =>
      _GoogleMapsStyleSearchBarState();
}

class _GoogleMapsStyleSearchBarState extends State<GoogleMapsStyleSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final OSMSearchService _osmService = OSMSearchService();

  List<OSMSearchResult> _searchResults = [];
  List<String> _localDestinations = [];
  bool _isSearching = false;
  bool _showResults = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();

    final query = _searchController.text.trim();

    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _localDestinations = [];
        _showResults = false;
        _isSearching = false;
      });
      return;
    }

    // First, filter local destinations
    _localDestinations = JharkhandLocations.destinations
        .where((dest) => dest.name.toLowerCase().contains(query.toLowerCase()))
        .map((dest) => dest.name)
        .toList();

    setState(() {
      _isSearching = true;
      _showResults = true;
    });

    // Then search OSM with debounce
    _debounceTimer = Timer(Duration(milliseconds: 800), () async {
      try {
        final results = await _osmService.searchLocations(query);
        setState(() {
          _searchResults = results;
          _isSearching = false;
        });
      } catch (e) {
        print('Search error: $e');
        setState(() {
          _isSearching = false;
        });
      }
    });
  }

  void _selectOSMLocation(OSMSearchResult result) {
    setState(() {
      _searchController.text = result.displayName.split(',')[0];
      _showResults = false;
      _isSearching = false;
    });

    _focusNode.unfocus();

    // Navigate to the selected location
    widget.mapController.setDestination(result.location);
    widget.mapController.createRoute();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigating to ${result.displayName.split(',')[0]}'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'VIEW ROUTE',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  void _selectLocalDestination(String destinationName) {
    setState(() {
      _searchController.text = destinationName;
      _showResults = false;
      _isSearching = false;
    });

    _focusNode.unfocus();

    // Navigate to the local destination
    widget.mapController.setDestinationToTouristSpot(destinationName);
    widget.mapController.createRoute();

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigating to $destinationName'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'VIEW ROUTE',
          textColor: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Search Bar
        Container(
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Menu/Back button
              IconButton(
                icon: Icon(
                  _showResults ? Icons.arrow_back : Icons.menu,
                  color: AppTheme.secondaryGrey,
                ),
                onPressed: _showResults
                    ? () {
                        _searchController.clear();
                        setState(() {
                          _showResults = false;
                          _isSearching = false;
                        });
                      }
                    : widget.onMenuPressed,
              ),

              // Search TextField
              Expanded(
                child: TextField(
                  controller: _searchController,
                  focusNode: _focusNode,
                  decoration: InputDecoration(
                    hintText: 'Search places in Jharkhand...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: AppTheme.iconGrey,
                      fontSize: 16,
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  onTap: () {
                    if (_searchController.text.isNotEmpty) {
                      setState(() {
                        _showResults = true;
                      });
                    }
                  },
                ),
              ),

              // Loading/Clear/Search button
              if (_isSearching)
                Container(
                  margin: EdgeInsets.only(right: 12),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                )
              else if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: Icon(Icons.clear, color: AppTheme.secondaryGrey),
                  onPressed: () {
                    _searchController.clear();
                  },
                )
              else
                IconButton(
                  icon: Icon(Icons.search, color: AppTheme.secondaryGrey),
                  onPressed: () => _focusNode.requestFocus(),
                ),

              // Explore button
              GestureDetector(
                onTap: widget.onExplorePressed,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.explore,
                        color: Colors.green.shade700,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Search Results
        if (_showResults &&
            (_localDestinations.isNotEmpty || _searchResults.isNotEmpty))
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            constraints: BoxConstraints(maxHeight: 300),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                // Local Jharkhand destinations first
                if (_localDestinations.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Popular destinations in Jharkhand',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  ..._localDestinations.map((destination) {
                    final destObj = JharkhandLocations.destinations.firstWhere(
                      (d) => d.name == destination,
                    );

                    return ListTile(
                      dense: true,
                      leading: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: destObj.clusterColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.star,
                          color: destObj.clusterColor,
                          size: 16,
                        ),
                      ),
                      title: Text(
                        destination,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        destObj.category,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      onTap: () => _selectLocalDestination(destination),
                    );
                  }),
                  if (_searchResults.isNotEmpty) Divider(height: 1),
                ],

                // OSM search results
                if (_searchResults.isNotEmpty) ...[
                  if (_localDestinations.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        'Other places',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ..._searchResults.map(
                    (result) => ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.grey[600],
                        size: 20,
                      ),
                      title: Text(
                        result.displayName.split(',')[0],
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        result.displayName.split(',').skip(1).join(',').trim(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () => _selectOSMLocation(result),
                    ),
                  ),
                ],
              ],
            ),
          ),
      ],
    );
  }
}
