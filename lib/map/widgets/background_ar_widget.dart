import 'package:ar_location_view/ar_location_view.dart';
import 'package:flutter/material.dart';
import '../models/ar_annotation.dart';
import '../services/ar_data_manager.dart';
import '../services/ar_widget_manager.dart';
import 'ar_annotation_card.dart';

class BackgroundARWidget extends StatefulWidget {
  final Widget Function(BuildContext context, bool isARReady) builder;

  const BackgroundARWidget({super.key, required this.builder});

  @override
  State<BackgroundARWidget> createState() => _BackgroundARWidgetState();
}

class _BackgroundARWidgetState extends State<BackgroundARWidget> with WidgetsBindingObserver {
  late final ARDataManager _dataManager;
  late final ARWidgetManager _arWidgetManager;
  bool _isARInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    try {
      _dataManager = ARDataManager.instance;
      _arWidgetManager = ARWidgetManager.instance;
      _dataManager.addListener(_onDataManagerUpdate);

      // Initialize AR in a post-frame callback to avoid conflicts
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_arWidgetManager.isExclusiveARActive) {
          _dataManager
              .initialize()
              .then((_) {
                if (mounted) {
                  setState(() {
                    _isARInitialized = true;
                  });
                }
              })
              .catchError((error) {
                debugPrint('AR initialization error: $error');
                if (mounted) {
                  setState(() {
                    _isARInitialized = false;
                  });
                }
              });
        }
      });
    } catch (e) {
      debugPrint('Error setting up background AR: $e');
    }
  }

  void _onDataManagerUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.paused:
        debugPrint('AR paused - app in background');
        break;
      case AppLifecycleState.resumed:
        debugPrint('AR resumed - app in foreground');
        if (_dataManager.isDataStale()) _dataManager.refreshIfNeeded();
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    try {
      WidgetsBinding.instance.removeObserver(this);
      _dataManager.removeListener(_onDataManagerUpdate);
    } catch (e) {
      debugPrint('Error disposing background AR: $e');
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Only show ArLocationWidget if no exclusive AR widget is active and AR is initialized
        if (_isARInitialized && !_arWidgetManager.isExclusiveARActive && _dataManager.hasPermission)
          Positioned.fill(
            child: Builder(
              builder: (context) {
                try {
                  return ArLocationWidget(
                    showDebugInfoSensor: false,
                    radarPosition: RadarPosition.bottomLeft,
                    annotations: _dataManager.annotations,
                    annotationViewBuilder: (context, annotation) =>
                        ARAnnotationCard(annotation: annotation as ARAnnotation),
                    onLocationChange: (position) => _dataManager.onLocationChanged(position),
                  );
                } catch (e) {
                  debugPrint('Error creating ArLocationWidget: $e');
                  return Container(
                    color: Colors.black.withOpacity(0.1),
                    child: Center(
                      child: Text('AR temporarily unavailable', style: TextStyle(color: Colors.white.withOpacity(0.7))),
                    ),
                  );
                }
              },
            ),
          ),
        widget.builder(context, _isARInitialized && _dataManager.hasData),
      ],
    );
  }
}
