import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/chichen_itza_illustration.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/christ_redeemer_illustration.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/ParasnathHill_illustration.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/common/wonder_illustration_config.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/great_wall_illustration.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/machu_picchu_illustration.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/TapovanCaves_illustration.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/pyramids_giza_illustration.dart';
import 'package:namste_jharkhand/ui/wonder_illustrations/taj_mahal_illustration.dart';

/// Convenience class for showing an illustration when all you have is the type.
class WonderIllustration extends StatelessWidget {
  const WonderIllustration(this.type, {super.key, required this.config});
  final WonderIllustrationConfig config;
  final WonderType type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      WonderType.JagannathTemple => JagannathTempleIllustration(config: config),
      WonderType.BetlaNationalPark => BetlaNationalParkIllustration(config: config),
      WonderType.ParasnathHill => ParasnathHillIllustration(config: config),
      WonderType.PatratuValley => PatratuValleyIllustration(config: config),
      WonderType.hundruFalls => hundruFallsIllustration(config: config),
      WonderType.TapovanCaves => TapovanCavesIllustration(config: config),
      WonderType.HargaddiChokahatu => HargaddiChokahatuIllustration(config: config),
      WonderType.Deoghar => DeogharIllustration(config: config),
    };
  }
}
