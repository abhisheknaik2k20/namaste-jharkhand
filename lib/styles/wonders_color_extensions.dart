import 'package:namste_jharkhand/common_libs.dart';

extension WonderColorExtensions on WonderType {
  Color get bgColor {
    return switch (this) {
      WonderType.HargaddiChokahatu => const Color(0xFF16184D),
      WonderType.PatratuValley => const Color.fromARGB(68, 78, 141, 164),
      WonderType.TapovanCaves => const Color(0xFF444B9B),
      WonderType.ParasnathHill => const Color(0xFF1E736D),
      WonderType.JagannathTemple => const Color(0xFF164F2A),
      WonderType.hundruFalls => const Color(0xFF0E4064),
      WonderType.Deoghar => const Color(0xFFC96454),
      WonderType.BetlaNationalPark => const Color(0xFF1C4D46),
    };
  }

  Color get fgColor {
    return switch (this) {
      WonderType.HargaddiChokahatu => const Color(0xFF444B9B),
      WonderType.PatratuValley => const Color(0xFF688750),
      WonderType.TapovanCaves => const Color(0xFF1B1A65),
      WonderType.ParasnathHill => const Color(0xFF4AA39D),
      WonderType.JagannathTemple => const Color(0xFFE2CFBB),
      WonderType.hundruFalls => const Color(0xFFC1D9D1),
      WonderType.Deoghar => const Color(0xFF642828),
      WonderType.BetlaNationalPark => const Color(0xFFED7967),
    };
  }
}

extension ColorFilterOnColor on Color {
  ColorFilter get colorFilter => ColorFilter.mode(this, BlendMode.srcIn);
}
