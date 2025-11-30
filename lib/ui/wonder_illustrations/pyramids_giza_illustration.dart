import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/ui/common/fade_color_transition.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/illustration_piece.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/paint_textures.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/wonder_illustration_builder.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/wonder_illustration_config.dart';

class HargaddiChokahatuIllustration extends StatelessWidget {
  HargaddiChokahatuIllustration({super.key, required this.config});
  final WonderIllustrationConfig config;
  final String assetPath = WonderType.HargaddiChokahatu.assetPath;
  final fgColor = WonderType.HargaddiChokahatu.fgColor;
  final bgColor = WonderType.HargaddiChokahatu.bgColor;

  @override
  Widget build(BuildContext context) {
    return WonderIllustrationBuilder(
      wonderType: WonderType.HargaddiChokahatu,
      config: config,
      bgBuilder: _buildBg,
      mgBuilder: _buildMg,
      fgBuilder: _buildFg,
    );
  }

  List<Widget> _buildBg(BuildContext context, Animation<double> anim) {
    return [
      FadeColorTransition(animation: anim, color: fgColor),
      Positioned.fill(
        child: IllustrationTexture(
          ImagePaths.roller2,
          color: Color(0xFF797FD8),
          opacity: anim.drive(Tween(begin: 0, end: .75)),
          flipY: true,
          scale: config.shortMode ? 4 : 1.15,
        ),
      ),
      IllustrationPiece(
        fileName: 'moon.png',
        initialOffset: Offset(0, 50),
        enableHero: true,
        heightFactor: .15,
        minHeight: 100,
        offset: config.shortMode ? Offset(120, context.heightPx * -.05) : Offset(120, context.heightPx * -.35),
        zoomAmt: .05,
      ),
    ];
  }

  List<Widget> _buildMg(BuildContext context, Animation<double> anim) {
    return [
      IllustrationPiece(
        fileName: 'pyramids.png',
        enableHero: true,
        heightFactor: 1.0,
        minHeight: 300,
        zoomAmt: config.shortMode ? -.2 : -2,
        fractionalOffset: Offset(0, -0.1),
      ),
    ];
  }

  List<Widget> _buildFg(BuildContext context, Animation<double> anim) {
    return [
      IllustrationPiece(
        fileName: 'foreground-back.png',
        alignment: Alignment.bottomCenter,
        initialOffset: Offset(20, 40),
        initialScale: .95,
        heightFactor: .3,
        fractionalOffset: Offset(.2, -.01),
        zoomAmt: .1,
        dynamicHzOffset: 150,
      ),
      // IllustrationPiece(
      //   fileName: 'foreground-front.png',
      //   alignment: Alignment.bottomCenter,
      //   initialScale: .9,
      //   initialOffset: Offset(-40, 60),
      //   heightFactor: .55,
      //   fractionalOffset: Offset(-.09, 0.02),
      //   zoomAmt: .25,
      //   dynamicHzOffset: -150,
      // ),
    ];
  }
}
