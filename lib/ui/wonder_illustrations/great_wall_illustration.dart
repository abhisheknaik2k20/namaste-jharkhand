import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/ui/common/fade_color_transition.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/illustration_piece.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/paint_textures.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/wonder_illustration_builder.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/wonder_illustration_config.dart';

class PatratuValleyIllustration extends StatelessWidget {
  PatratuValleyIllustration({super.key, required this.config});
  final WonderIllustrationConfig config;
  final String assetPath = WonderType.PatratuValley.assetPath;
  final fgColor = WonderType.PatratuValley.fgColor;
  final bgColor = WonderType.PatratuValley.bgColor;

  @override
  Widget build(BuildContext context) {
    return WonderIllustrationBuilder(
      config: config,
      bgBuilder: _buildBg,
      mgBuilder: _buildMg,
      fgBuilder: _buildFg,
      wonderType: WonderType.PatratuValley,
    );
  }

  List<Widget> _buildBg(BuildContext context, Animation<double> anim) {
    return [
      FadeColorTransition(animation: anim, color: $styles.colors.shift(fgColor, .15)),
      Positioned.fill(
        child: IllustrationTexture(
          ImagePaths.roller2,
          flipX: true,
          color: Color(0xff688750),
          opacity: anim.drive(Tween(begin: 0, end: 1)),
          scale: config.shortMode ? 4 : 1.15,
        ),
      ),
      IllustrationPiece(
        fileName: 'sun.png',
        initialOffset: Offset(0, 50),
        enableHero: true,
        heightFactor: config.shortMode ? .07 : .25,
        minHeight: 120,
        offset: config.shortMode ? Offset(-40, context.heightPx * -.06) : Offset(-65, context.heightPx * -.3),
      ),
    ];
  }

  List<Widget> _buildMg(BuildContext context, Animation<double> anim) {
    return [
      IllustrationPiece(
        fileName: 'great-wall.png',
        heightFactor: config.shortMode ? .45 : .95,
        minHeight: 250,
        zoomAmt: .05,
        enableHero: true,
        fractionalOffset: Offset(0, config.shortMode ? .15 : .16),
      ),
    ];
  }

  List<Widget> _buildFg(BuildContext context, Animation<double> anim) {
    return [];
  }
}
