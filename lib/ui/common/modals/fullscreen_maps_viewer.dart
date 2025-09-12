import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/ui/common/controls/app_header.dart';
import 'package:namste_jharkhand/ui/common/google_maps_marker.dart';

class FullscreenMapsViewer extends StatelessWidget {
  FullscreenMapsViewer({super.key, required this.type});
  final WonderType type;

  WonderData get data => wondersLogic.getData(type);
  late final startPos = CameraPosition(target: LatLng(data.lat, data.lng), zoom: 25);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          top: false,
          child: GoogleMap(
            mapType: MapType.hybrid,
            markers: {getMapsMarker(startPos.target)},
            initialCameraPosition: startPos,
            myLocationButtonEnabled: false,
          ),
        ),
        AppHeader(isTransparent: true),
      ],
    );
  }
}
