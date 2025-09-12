import 'package:flutter/foundation.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/common/platform_info.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class FullscreenVideoViewer extends StatefulWidget {
  const FullscreenVideoViewer({super.key, required this.id});
  final String id;

  @override
  State<FullscreenVideoViewer> createState() => _FullscreenVideoViewerState();
}

class _FullscreenVideoViewerState extends State<FullscreenVideoViewer> {
  late final _controller = YoutubePlayerController.fromVideoId(
    videoId: widget.id,
    params: const YoutubePlayerParams(),
  );

  bool get _enableVideo => PlatformInfo.isMobile;

  @override
  void initState() {
    super.initState();
    appLogic.supportedOrientationsOverride = [Axis.horizontal, Axis.vertical];
  }

  @override
  void dispose() {
    // when view closes, remove the override
    appLogic.supportedOrientationsOverride = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double aspect = context.isLandscape ? MediaQuery.of(context).size.aspectRatio : 9 / 9;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: (PlatformInfo.isMobile || kIsWeb)
                ? YoutubePlayer(
                    controller: _controller,
                    aspectRatio: aspect,
                  )
                : Placeholder(),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all($styles.insets.md),
              // Wrap btn in a PointerInterceptor to prevent the HTML video player from intercepting the pointer (https://pub.dev/packages/pointer_interceptor)
              child: PointerInterceptor(
                child: const BackBtn(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
