import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/ui/common/fade_color_transition.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/illustration_piece.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/paint_textures.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/wonder_illustration_builder.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/wonder_illustration_config.dart';

class TapovanCavesIllustration extends StatelessWidget {
  TapovanCavesIllustration({super.key, required this.config});
  final WonderIllustrationConfig config;
  final String assetPath = WonderType.TapovanCaves.assetPath;
  final fgColor = WonderType.TapovanCaves.fgColor;
  final bgColor = WonderType.TapovanCaves.bgColor;

  @override
  Widget build(BuildContext context) {
    return WonderIllustrationBuilder(
      config: config,
      bgBuilder: _buildBg,
      mgBuilder: _buildMg,
      fgBuilder: _buildFg,
      wonderType: WonderType.TapovanCaves,
    );
  }

  List<Widget> _buildBg(BuildContext context, Animation<double> anim) {
    return [
      FadeColorTransition(animation: anim, color: fgColor),
      Positioned.fill(
        child: IllustrationTexture(
          ImagePaths.roller1,
          color: WonderType.TapovanCaves.bgColor,
          flipX: true,
          opacity: anim.drive(Tween(begin: 0, end: 1)),
          scale: config.shortMode ? 4 : 1.15,
        ),
      ),
      IllustrationPiece(
        fileName: 'moon.png',
        initialOffset: Offset(0, -150),
        heightFactor: .15,
        minHeight: 50,
        alignment: Alignment.topCenter,
        fractionalOffset: Offset(-.7, 0),
      ),
    ];
  }

  List<Widget> _buildMg(BuildContext context, Animation<double> anim) => [
    FractionallySizedBox(
      heightFactor: config.shortMode ? 1 : .8,
      alignment: Alignment.bottomCenter,
      child: IllustrationPiece(
        fileName: 'TapovanCaves.png',
        heightFactor: .3,
        minHeight: 500,
        zoomAmt: config.shortMode ? -0.1 : -0.3,
        enableHero: true,
        fractionalOffset: Offset(.15, config.shortMode ? .025 : 0.1),
      ),
    ),
  ];

  List<Widget> _buildFg(BuildContext context, Animation<double> anim) {
    return [
      IllustrationPiece(
        fileName: 'foreground-left.png',
        alignment: Alignment.bottomCenter,
        initialOffset: Offset(-80, 0),
        heightFactor: 1,
        fractionalOffset: Offset(-.6, 0),
        zoomAmt: .03,
        dynamicHzOffset: -130,
        bottom: (_) {
          const double scaleX = 5;
          return FractionalTranslation(
            translation: Offset(-1 - scaleX / 2, 0),
            child: Transform.scale(
              scaleX: 5,
              child: Container(color: WonderType.TapovanCaves.fgColor.withOpacity(anim.value)),
            ),
          );
        },
      ),
      IllustrationPiece(
        fileName: 'foreground-right.png',
        alignment: Alignment.bottomCenter,
        initialOffset: Offset(80, 00),
        heightFactor: 1,
        fractionalOffset: Offset(.55, 0),
        zoomAmt: .12,
        dynamicHzOffset: 130,
        bottom: (_) {
          const double scaleX = 5;
          return FractionalTranslation(
            translation: Offset(1 + scaleX / 2, 0),
            child: Transform.scale(
              scaleX: 5,
              child: Container(color: WonderType.TapovanCaves.fgColor.withOpacity(anim.value)),
            ),
          );
        },
      ),
    ];
  }
}
