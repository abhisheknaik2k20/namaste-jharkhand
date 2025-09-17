import 'package:ar_location_view/ar_location_view.dart';
import 'package:ar_location_view/ar_location_widget.dart';
import 'package:flutter/material.dart';
import '../controllers/ar_controller.dart';
import '../controllers/map_controller.dart';
import '../models/ar_annotation.dart';
import '../models/navigation_instruction.dart';
import '../widgets/ar_annotation_card.dart';
import '../services/ar_widget_manager.dart';
import '../utils/app_theme.dart';
import '../utils/formatting_utils.dart';

class ARExplorerScreen extends StatefulWidget {
  final MapController mapController;

  const ARExplorerScreen({super.key, required this.mapController});
  @override
  State<ARExplorerScreen> createState() => _ARExplorerScreenState();
}

class _ARExplorerScreenState extends State<ARExplorerScreen> {
  late final ARController _controller;
  late final ARWidgetManager _arWidgetManager;

  @override
  void initState() {
    super.initState();
    try {
      // Disable background AR widget to prevent stream conflicts
      _arWidgetManager = ARWidgetManager.instance;
      _arWidgetManager.setExclusiveARActive(true);

      _controller = ARController();
      _controller.addListener(_onControllerUpdate);
      // Always initialize when entering AR screen to ensure fresh data
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _controller.initialize();
        }
      });
    } catch (e) {
      debugPrint('Error initializing AR Explorer: $e');
    }
  }

  @override
  void dispose() {
    try {
      // Re-enable background AR widget when leaving exclusive AR mode
      _arWidgetManager.setExclusiveARActive(false);

      _controller.removeListener(_onControllerUpdate);
      _controller.dispose();
    } catch (e) {
      debugPrint('Error disposing AR Explorer: $e');
    }
    super.dispose();
  }

  void _onControllerUpdate() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppTheme.lightGrey,
    appBar: AppBar(
      title: const Text('AR Explorer'),
      backgroundColor: AppTheme.googleBlue,
      foregroundColor: Colors.white,
      leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()),
    ),
    body: Stack(
      children: [
        _buildBody(),
        // Navigation instructions widget at the top
        if (widget.mapController.hasInstructions) _buildNavigationWidget(),
        if (_controller.hasPermission)
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: _controller.refresh,
              backgroundColor: AppTheme.googleBlue,
              child: const Icon(Icons.refresh, color: Colors.white),
            ),
          ),
      ],
    ),
  );

  Widget _buildBody() {
    if (_controller.isLoading) {
      return Center(child: CircularProgressIndicator(color: AppTheme.googleBlue));
    }

    if (!_controller.hasPermission) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Location permission required'),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _controller.initialize, child: const Text('Enable Location')),
          ],
        ),
      );
    }

    if (_controller.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(_controller.errorMessage!),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _controller.refresh, child: const Text('Retry')),
          ],
        ),
      );
    }

    return ArLocationWidget(
      showDebugInfoSensor: false,
      radarPosition: RadarPosition.bottomLeft,
      showMapInRadar: true,
      annotations: _controller.annotations,
      annotationViewBuilder: (context, annotation) => ARAnnotationCard(annotation: annotation as ARAnnotation),
      onLocationChange: (position) {},
    );
  }

  Widget _buildNavigationWidget() {
    final instructions = widget.mapController.currentInstructions;
    if (instructions.isEmpty) return SizedBox.shrink();

    // Show first two instructions (current and next)
    final currentInstruction = instructions.first;
    final nextInstruction = instructions.length > 1 ? instructions[1] : null;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, left: 16, right: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade600, Colors.green.shade500],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Current instruction
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(_getInstructionIcon(currentInstruction.sign), color: Colors.white, size: 24),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentInstruction.text,
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.straighten, color: Colors.white.withOpacity(0.8), size: 16),
                              SizedBox(width: 4),
                              Text(
                                FormattingUtils.formatDistance(currentInstruction.distance),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 16),
                              Icon(Icons.access_time, color: Colors.white.withOpacity(0.8), size: 16),
                              SizedBox(width: 4),
                              Text(
                                FormattingUtils.formatTime(currentInstruction.time),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Next instruction (if available)
                if (nextInstruction != null) ...[
                  SizedBox(height: 12),
                  Container(height: 1, color: Colors.white.withOpacity(0.3)),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(
                          _getInstructionIcon(nextInstruction.sign),
                          color: Colors.white.withOpacity(0.8),
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Then: ${nextInstruction.text}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 2),
                            Text(
                              'in ${FormattingUtils.formatDistance(nextInstruction.distance)}',
                              style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getInstructionIcon(String sign) {
    switch (sign) {
      case '0':
        return Icons.straight;
      case '1':
        return Icons.turn_slight_right;
      case '2':
        return Icons.turn_right;
      case '3':
        return Icons.turn_sharp_right;
      case '4':
        return Icons.u_turn_right;
      case '-1':
        return Icons.turn_slight_left;
      case '-2':
        return Icons.turn_left;
      case '-3':
        return Icons.turn_sharp_left;
      case '5':
        return Icons.flag;
      case '6':
        return Icons.place;
      default:
        return Icons.navigation;
    }
  }
}
