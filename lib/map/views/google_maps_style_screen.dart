import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmap;
import 'package:flutter_google_street_view/flutter_google_street_view.dart';
import 'package:ar_location_view/ar_location_view.dart';
import 'package:latlong2/latlong.dart' as latlng2;
import '../widgets/google_maps_bottom_sheet.dart';
import 'dart:async';
import '../controllers/map_controller.dart';
import '../services/ar_data_manager.dart';
import '../widgets/map_view.dart';
import '../widgets/google_maps_search_bar.dart';
import '../widgets/google_maps_controls.dart';
import '../widgets/background_ar_widget.dart';
import '../widgets/instructions_panel.dart';
import '../widgets/ar_annotation_card.dart';
import '../models/ar_annotation.dart';
import '../services/places_service.dart';
import '../widgets/place_info_sheet.dart';
import '../services/app_state.dart';
import '../utils/app_theme.dart';
import '../utils/formatting_utils.dart';
import '../services/tts_service.dart';
import '../services/multiple_bus_simulation_service.dart';

class GoogleMapsStyleMapScreen extends StatefulWidget {
  const GoogleMapsStyleMapScreen({super.key});

  @override
  State<GoogleMapsStyleMapScreen> createState() => _GoogleMapsStyleMapScreenState();
}

class _GoogleMapsStyleMapScreenState extends State<GoogleMapsStyleMapScreen> with TickerProviderStateMixin {
  late MapController _mapController;
  late ARDataManager _arDataManager;
  late AppState _appState;
  late TTSService _ttsService;
  late MultipleBusSimulationService _busSimulationService;
  bool _isLoadingPlaceInfo = false;
  List<String> _spokenInstructions = []; // Track spoken instructions
  StreamSubscription? _busStreamSubscription;

  // Animation controllers for smooth transitions
  late AnimationController _transitionController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _arDataManager = ARDataManager.instance;
    _ttsService = TTSService();
    _busSimulationService = MultipleBusSimulationService.instance;
    _transitionController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _initializeApp();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appState = AppStateScope.of(context);
  }

  Future<void> _initializeApp() async {
    try {
      await _mapController.initializeLocation();
      _arDataManager.addListener(_onARDataManagerUpdate);

      // Initialize AR with better error handling
      await _arDataManager.initialize().catchError((error) {
        debugPrint('AR initialization failed: $error');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('AR temporarily unavailable: ${error.toString().split(':').last}'),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 3),
            ),
          );
        }
        return null; // Continue with app initialization
      });

      // Initialize TTS service
      await _initializeTTS();

      // Initialize and start bus simulation
      _startBusSimulation();
    } catch (e) {
      debugPrint('App initialization error: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Some features may be unavailable'), backgroundColor: Colors.red));
      }
    }
  }

  /// Initialize Text-to-Speech service
  Future<void> _initializeTTS() async {
    try {
      await _ttsService.initialize();
    } catch (e) {
      print('Failed to initialize TTS service: $e');
    }
  }

  void _handleNavigationTTS() {
    if (!_appState.isARViewMode) return;

    final instructions = _mapController.currentInstructions;
    if (instructions.isEmpty) return;
    final firstInstruction = instructions.first;
    final instructionText = firstInstruction.text;
    if (!_spokenInstructions.contains(instructionText)) {
      _spokenInstructions.add(instructionText);
      _ttsService.speakInstruction(instructionText);
      if (_spokenInstructions.length > 5) {
        _spokenInstructions.removeAt(0);
      }
    }
  }

  void _startBusSimulation() {
    _busStreamSubscription = _busSimulationService.busStream.listen((MultipleBusPosition busPositions) {
      _mapController.updateBusMarkers(busPositions.buses);
    });

    // Start the simulation
    _busSimulationService.start();
  }

  /// Stop the bus simulation service
  void _stopBusSimulation() {
    _busStreamSubscription?.cancel();
    _busSimulationService.stop();
  }

  void _onARDataManagerUpdate() {
    try {
      if (mounted) {
        setState(() {});
        // Handle TTS for navigation instructions
        _handleNavigationTTS();
      }
    } catch (e) {
      debugPrint('Error updating AR data: $e');
    }
  }

  void _onMapCreated(gmap.GoogleMapController controller) => _mapController.setMapController(controller);

  void _onMapTap(gmap.LatLng position) async {
    if (_isLoadingPlaceInfo) return; // Prevent multiple simultaneous requests
    setState(() => _isLoadingPlaceInfo = true);
    try {
      final placeInfo = await PlacesService.getPlaceFromCoordinates(position.latitude, position.longitude);
      if (placeInfo != null && mounted) {
        _showPlaceInfoSheet(placeInfo);
      } else if (mounted) {
        _showBasicLocationInfo(position);
      }
    } catch (e) {
      if (mounted) _showBasicLocationInfo(position);
    } finally {
      if (mounted) setState(() => _isLoadingPlaceInfo = false);
    }
  }

  void _showPlaceInfoSheet(PlaceInfo placeInfo) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlaceInfoSheet(place: placeInfo),
    );
  }

  void _showBasicLocationInfo(gmap.LatLng position) => showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (context) => Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, size: 32, color: Colors.blue.shade600),
          SizedBox(height: 12),
          Text('Location Tapped', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Latitude: \${position.latitude.toStringAsFixed(6)}',
            style: TextStyle(fontSize: 14, color: AppTheme.secondaryGrey),
          ),
          Text(
            'Longitude: \${position.longitude.toStringAsFixed(6)}',
            style: TextStyle(fontSize: 14, color: AppTheme.secondaryGrey),
          ),
          SizedBox(height: 16),
        ],
      ),
    ),
  );

  void _showExploreJharkhandSheet() => showModalBottomSheet(
    enableDrag: true,
    elevation: 200,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => GoogleMapsStyleBottomSheet(mapController: _mapController),
  );

  void _showInstructionsSheet() => showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => InstructionsPanel(instructions: _mapController.currentInstructions),
  );

  void _toggleStreetViewMode() {
    final _isStreetViewMode = _appState.isStreetViewMode;
    if (_isStreetViewMode) {
      // Transitioning from Street View to Map
      _transitionController.reverse().then((_) {
        _appState.setViewMode(ViewMode.map);
      });
    } else {
      // Transitioning from Map/AR to Street View
      _appState.setViewMode(ViewMode.street);
      _transitionController.forward();
    }
  }

  void _toggleARViewMode() {
    final isARViewMode = _appState.isARViewMode;
    if (isARViewMode) {
      // Stop TTS when leaving AR mode
      _ttsService.stop();
      _spokenInstructions.clear();
      // Transitioning from AR to Map
      _transitionController.reverse().then((_) {
        _appState.setViewMode(ViewMode.map);
      });
    } else {
      // Transitioning from Map/Street View to AR
      _appState.setViewMode(ViewMode.ar);
      _transitionController.forward();
      // Handle TTS when entering AR mode
      Future.delayed(const Duration(milliseconds: 500), () {
        _handleNavigationTTS();
      });
    }
  }

  void _onStreetViewCreated(StreetViewController controller) {
    debugPrint('Street View Controller Created: $controller');
  }

  void _onStreetViewPanoramaChanged(StreetViewPanoramaLocation? location, Exception? error) {
    if (error != null) {
      debugPrint('Street View Panorama Error: \$error');
    } else if (location != null) {
      debugPrint('Street View Panorama Changed - Position: \${location.position}, Pano ID: \${location.panoId}');
    }
  }

  Widget _getCurrentView(bool isARReady) {
    final _isARViewMode = _appState.isARViewMode;
    final _isStreetViewMode = _appState.isStreetViewMode;

    try {
      if (_isARViewMode) {
        List<latlng2.LatLng>? arPolylinePoints;
        latlng2.LatLng? arDestination;
        if (_mapController.polylines.isNotEmpty) {
          final polyline = _mapController.polylines.first;
          arPolylinePoints = polyline.points.map((point) => latlng2.LatLng(point.latitude, point.longitude)).toList();
        }
        arDestination = latlng2.LatLng(_mapController.destination.latitude, _mapController.destination.longitude);
        _appState.setDestination(arDestination);

        return KeyedSubtree(
          key: const ValueKey('ar_view'),
          child: isARReady && _arDataManager.hasPermission
              ? Stack(
                  children: [
                    ArLocationWidget(
                      showDebugInfoSensor: false,
                      radarPosition: RadarPosition.bottomLeft,
                      showMapInRadar: true,
                      annotations: _arDataManager.annotations,
                      annotationViewBuilder: (context, annotation) =>
                          ARAnnotationCard(annotation: annotation as ARAnnotation),
                      onLocationChange: (position) {},
                      destination: arDestination,
                      showDestination: arPolylinePoints != null && arPolylinePoints.isNotEmpty,
                    ),
                    // Navigation instructions widget at the top
                    if (_mapController.hasInstructions) _buildARNavigationWidget(),
                  ],
                )
              : Container(
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(color: Colors.white),
                        const SizedBox(height: 16),
                        Text(
                          isARReady ? 'Initializing AR...' : 'Loading AR...',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      } else if (_isStreetViewMode) {
        return KeyedSubtree(
          key: const ValueKey('street_view'),
          child: _mapController.currentLocation != null
              ? FlutterGoogleStreetView(
                  initPos: LatLng(_mapController.currentLocation!.latitude, _mapController.currentLocation!.longitude),
                  initBearing: 0.0,
                  initTilt: 0.0,
                  initZoom: 1.0,
                  onStreetViewCreated: _onStreetViewCreated,
                  onPanoramaChangeListener: _onStreetViewPanoramaChanged,
                  streetNamesEnabled: true,
                  userNavigationEnabled: true,
                  zoomGesturesEnabled: true,
                  panningGesturesEnabled: true,
                )
              : Container(
                  color: AppTheme.dividerGrey,
                  child: const Center(child: CircularProgressIndicator()),
                ),
        );
      } else {
        return KeyedSubtree(
          key: const ValueKey('map_view'),
          child: MapView(mapController: _mapController, onMapCreated: _onMapCreated, onTap: _onMapTap),
        );
      }
    } catch (e) {
      debugPrint('Error switching view mode: $e');
      // Fallback to map view on error
      return KeyedSubtree(
        key: const ValueKey('map_view_fallback'),
        child: MapView(mapController: _mapController, onMapCreated: _onMapCreated, onTap: _onMapTap),
      );
    }
  }

  // Build AR navigation widget
  Widget _buildARNavigationWidget() {
    final instructions = _mapController.currentInstructions;
    if (instructions.isEmpty) return const SizedBox.shrink();

    // Get first two instructions
    final firstTwoInstructions = instructions.take(2).toList();

    return Positioned(
      top: MediaQuery.of(context).padding.top + 16,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color(0xFF2E7D32), // Dark green
              Color(0xFF4CAF50), // Medium green
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 2))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: firstTwoInstructions.asMap().entries.map((entry) {
            final index = entry.key;
            final instruction = entry.value;

            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), shape: BoxShape.circle),
                      child: Center(
                        child: Icon(_getInstructionIcon(instruction.sign), color: const Color(0xFF2E7D32), size: 20),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            instruction.text,
                            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.straighten, size: 14, color: Colors.white.withOpacity(0.8)),
                              const SizedBox(width: 4),
                              Text(
                                FormattingUtils.formatDistance(instruction.distance),
                                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                              ),
                              const SizedBox(width: 16),
                              Icon(Icons.access_time, size: 14, color: Colors.white.withOpacity(0.8)),
                              const SizedBox(width: 4),
                              Text(
                                FormattingUtils.formatTime(instruction.time),
                                style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (index < firstTwoInstructions.length - 1) ...[
                  const SizedBox(height: 12),
                  Container(height: 1, color: Colors.white.withOpacity(0.2)),
                  const SizedBox(height: 12),
                ],
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  // Get icon for instruction based on sign (String)
  IconData _getInstructionIcon(String sign) {
    switch (sign) {
      case '-3':
        return Icons.turn_sharp_left;
      case '-2':
        return Icons.turn_left;
      case '-1':
        return Icons.turn_slight_left;
      case '0':
        return Icons.straight;
      case '1':
        return Icons.turn_slight_right;
      case '2':
        return Icons.turn_right;
      case '3':
        return Icons.turn_sharp_right;
      case '4':
        return Icons.u_turn_left;
      case '5':
        return Icons.u_turn_right;
      case '6':
        return Icons.merge;
      default:
        return Icons.navigation;
    }
  }

  @override
  void dispose() {
    _transitionController.dispose();
    _mapController.dispose();
    _arDataManager.removeListener(_onARDataManagerUpdate);
    _ttsService.dispose();
    _stopBusSimulation(); // Clean up bus simulation
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.lightGrey,
    body: AnimatedBuilder(
      animation: Listenable.merge([_mapController, _appState]),
      builder: (context, _) {
        return BackgroundARWidget(
          builder: (context, isARReady) {
            return Stack(
              children: [
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: _getCurrentView(isARReady),
                  ),
                ),
                _buildOverlayControls(isARReady),
              ],
            );
          },
        );
      },
    ),
  );

  Widget _buildOverlayControls(bool isARReady) {
    return Stack(
      children: [
        // Hide search bar in AR mode
        if (!_appState.isARViewMode)
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: GoogleMapsStyleSearchBar(
              mapController: _mapController,
              onMenuPressed: _showExploreJharkhandSheet,
              onExplorePressed: _showExploreJharkhandSheet,
            ),
          ),
        if (_appState.isStreetViewMode && !_appState.isARViewMode)
          Positioned(
            top: MediaQuery.of(context).padding.top + 80,
            left: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: Offset(0, 4))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.streetview, color: Colors.white, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'Street View Mode',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),

        if (_appState.isARViewMode)
          Positioned(
            top: MediaQuery.of(context).padding.top + 80,
            left: 16,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: Offset(0, 4))],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.view_in_ar, color: Colors.white, size: 16),
                  SizedBox(width: 8),
                  Text(
                    'AR Mode',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        if (_isLoadingPlaceInfo)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: Offset(0, 4))],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade600)),
                      SizedBox(height: 16),
                      Text(
                        'Getting place information...',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppTheme.darkGrey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (_mapController.errorMessage != null)
          Positioned(
            top: MediaQuery.of(context).padding.top + 80,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.orange.shade700, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _mapController.errorMessage!,
                      style: TextStyle(color: Colors.orange.shade800, fontSize: 14),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.orange.shade700),
                    onPressed: () {}, // Could add error dismissal
                  ),
                ],
              ),
            ),
          ),
        if (!_appState.isARViewMode) GoogleMapsStyleControls(mapController: _mapController),
        Positioned(
          bottom: 240,
          right: 16,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: _appState.isStreetViewMode ? Colors.blue.shade600 : Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: Offset(0, 4))],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: _appState.isARViewMode ? null : _toggleStreetViewMode,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: _appState.isStreetViewMode ? 0.1 : 0,
                        child: Icon(
                          Icons.streetview,
                          color: _appState.isStreetViewMode
                              ? Colors.white
                              : (_appState.isARViewMode ? Colors.grey : AppTheme.secondaryGrey),
                          size: 24,
                        ),
                      ),
                      if (!_appState.isStreetViewMode && !_appState.isARViewMode) ...[
                        SizedBox(width: 8),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _appState.isStreetViewMode || _appState.isARViewMode ? 0.0 : 1.0,
                          child: Text(
                            'Street View',
                            style: TextStyle(color: AppTheme.secondaryGrey, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 180,
          right: 16,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: _appState.isARViewMode ? Colors.green.shade600 : Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: Offset(0, 4))],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: _toggleARViewMode,
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          AnimatedRotation(
                            duration: const Duration(milliseconds: 300),
                            turns: _appState.isARViewMode ? 0.1 : 0,
                            child: Icon(
                              Icons.view_in_ar,
                              color: _appState.isARViewMode ? Colors.white : AppTheme.secondaryGrey,
                              size: 24,
                            ),
                          ),

                          if (_arDataManager.isLoading)
                            Positioned(
                              top: -2,
                              right: -2,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                          if (!_arDataManager.isLoading &&
                              _arDataManager.hasPermission &&
                              _arDataManager.annotations.isNotEmpty)
                            Positioned(
                              top: -2,
                              right: -2,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                              ),
                            ),
                        ],
                      ),
                      if (!_appState.isARViewMode) ...[
                        SizedBox(width: 8),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: _appState.isARViewMode ? 0.0 : 1.0,
                          child: Text(
                            'AR View',
                            style: TextStyle(color: AppTheme.secondaryGrey, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (_mapController.hasInstructions)
          Positioned(
            bottom: 16,
            left: 16,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade600,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: Offset(0, 4))],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: _showInstructionsSheet,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.list, color: Colors.white, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Instructions',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
