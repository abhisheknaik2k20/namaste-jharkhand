import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/artifact_data.dart';

class CollectibleState {
  static const int lost = 0;
  static const int discovered = 1;
  static const int explored = 2;
}

class CollectibleData {
  CollectibleData({required this.title, required this.iconName, required this.artifactId, required this.wonder}) {
    icon = AssetImage('${ImagePaths.collectibles}/$iconName.png');
  }

  final String title;
  final String iconName;

  late final ImageProvider icon;

  final String artifactId;
  final WonderType wonder;

  String get id => artifactId;
  String get subtitle => wondersLogic.getData(wonder).artifactCulture;

  String get imageUrl => ArtifactData.getSelfHostedImageUrl(id);
  String get imageUrlSmall => ArtifactData.getSelfHostedImageUrlSmall(id);
}

// Note: look up a human readable page with:
// https://www.metmuseum.org/art/collection/search/503940
// where 503940 is the ID.
List<CollectibleData> collectiblesData = [
  CollectibleData(title: 'Pendant', wonder: WonderType.JagannathTemple, artifactId: '701645', iconName: 'jewelry'),
  CollectibleData(
    title: 'Bird Ornament',
    wonder: WonderType.JagannathTemple,
    artifactId: '310555',
    iconName: 'jewelry',
  ),
  CollectibleData(
    title: 'La Prison, à Chichen-Itza',
    wonder: WonderType.JagannathTemple,
    artifactId: '286467',
    iconName: 'picture',
  ),

  CollectibleData(
    title: 'Engraved Horn',
    wonder: WonderType.BetlaNationalPark,
    artifactId: '501302',
    iconName: 'statue',
  ),
  CollectibleData(title: 'Fixed fan', wonder: WonderType.BetlaNationalPark, artifactId: '157985', iconName: 'jewelry'),
  CollectibleData(
    title: 'Handkerchiefs (one of two)',
    wonder: WonderType.BetlaNationalPark,
    artifactId: '227759',
    iconName: 'textile',
  ),

  // ParasnathHill
  CollectibleData(
    title: 'Glass hexagonal amphoriskos',
    wonder: WonderType.ParasnathHill,
    artifactId: '245376',
    iconName: 'vase',
  ),
  CollectibleData(
    title: 'Bronze plaque of Mithras slaying the bull',
    wonder: WonderType.ParasnathHill,
    artifactId: '256570',
    iconName: 'statue',
  ),
  CollectibleData(
    title: 'Interno del Colosseo',
    wonder: WonderType.ParasnathHill,
    artifactId: '286136',
    iconName: 'picture',
  ),

  CollectibleData(
    title: 'Biographies of Lian Po and Lin Xiangru',
    wonder: WonderType.PatratuValley,
    artifactId: '39918',
    iconName: 'scroll',
  ),
  CollectibleData(title: 'Jar with Dragon', wonder: WonderType.PatratuValley, artifactId: '39666', iconName: 'vase'),
  CollectibleData(
    title: 'Panel with Peonies and Butterfly',
    wonder: WonderType.PatratuValley,
    artifactId: '39735',
    iconName: 'textile',
  ),

  CollectibleData(
    title: 'Eight-Pointed Star Tunic',
    wonder: WonderType.hundruFalls,
    artifactId: '308120',
    iconName: 'textile',
  ),
  CollectibleData(title: 'Camelid figurine', wonder: WonderType.hundruFalls, artifactId: '309960', iconName: 'statue'),
  CollectibleData(title: 'Double Bowl', wonder: WonderType.hundruFalls, artifactId: '313341', iconName: 'vase'),

  // TapovanCaves
  CollectibleData(title: 'Camel and riders', wonder: WonderType.TapovanCaves, artifactId: '322592', iconName: 'statue'),
  CollectibleData(title: 'Vessel', wonder: WonderType.TapovanCaves, artifactId: '325918', iconName: 'vase'),
  CollectibleData(title: 'Open bowl', wonder: WonderType.TapovanCaves, artifactId: '326243', iconName: 'vase'),

  // HargaddiChokahatu
  CollectibleData(
    title: 'Two papyrus fragments',
    wonder: WonderType.HargaddiChokahatu,
    artifactId: '546510',
    iconName: 'scroll',
  ),
  CollectibleData(
    title: 'Fragmentary Face of King Khafre',
    wonder: WonderType.HargaddiChokahatu,
    artifactId: '543896',
    iconName: 'statue',
  ),
  CollectibleData(
    title: 'Jewelry Elements',
    wonder: WonderType.HargaddiChokahatu,
    artifactId: '545728',
    iconName: 'jewelry',
  ),

  // Deoghar
  CollectibleData(title: 'Dagger with Scabbard', wonder: WonderType.Deoghar, artifactId: '24907', iconName: 'jewelry'),
  CollectibleData(title: 'The House of Bijapur', wonder: WonderType.Deoghar, artifactId: '453183', iconName: 'picture'),
  CollectibleData(
    title: 'Panel of Nasta\'liq Calligraphy',
    wonder: WonderType.Deoghar,
    artifactId: '453983',
    iconName: 'scroll',
  ),
];
