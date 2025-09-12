import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/artifact_data.dart';

class HighlightData {
  HighlightData({
    required this.title,
    required this.culture,
    required this.artifactId,
    required this.wonder,
    required this.date,
  });

  static HighlightData? fromId(String? id) => id == null ? null : _highlights.firstWhereOrNull((o) => o.id == id);
  static List<HighlightData> forWonder(WonderType wonder) =>
      _highlights.where((o) => o.wonder == wonder).toList(growable: false);
  static List<HighlightData> get all => _highlights;

  final String title;
  final String culture;
  final String date; // Now contains price instead of date

  late final ImageProvider icon;

  final String artifactId;
  final WonderType wonder;

  String get id => artifactId;
  String get subtitle => wondersLogic.getData(wonder).artifactCulture;

  String get imageUrl => ArtifactData.getSelfHostedImageUrl(artifactId);
  String get imageUrlSmall => ArtifactData.getSelfHostedImageUrlSmall(artifactId);
}

// Note: look up a human readable page with:
// https://www.metmuseum.org/art/collection/search/503940
// where 503940 is the ID.
List<HighlightData> _highlights = [
  // chichenItza
  HighlightData(
    title: 'Double Whistle',
    wonder: WonderType.chichenItza,
    artifactId: '503940',
    culture: 'Mayan',
    date: '450 Rs',
  ),
  HighlightData(
    title: 'Seated Female Figure',
    wonder: WonderType.chichenItza,
    artifactId: '312595',
    culture: 'Maya',
    date: '1250 Rs',
  ),
  HighlightData(
    title: 'Censer Support',
    wonder: WonderType.chichenItza,
    artifactId: '310551',
    culture: 'Maya',
    date: '875 Rs',
  ),
  HighlightData(
    title: 'Tripod Plate',
    wonder: WonderType.chichenItza,
    artifactId: '316304',
    culture: 'Maya',
    date: '325 Rs',
  ),
  HighlightData(
    title: 'Costumed Figure',
    wonder: WonderType.chichenItza,
    artifactId: '313151',
    culture: 'Maya',
    date: '950 Rs',
  ),
  HighlightData(
    title: 'Head of a Rain God',
    wonder: WonderType.chichenItza,
    artifactId: '310480',
    culture: 'Maya',
    date: '1850 Rs',
  ),

// christRedeemer
  HighlightData(
    title: '[Studio Portrait: Male Street Vendor Holding Box of Flowers, Brazil]',
    wonder: WonderType.christRedeemer,
    artifactId: '764815',
    culture: '',
    date: '275 Rs',
  ),
  HighlightData(
    title: 'Rattle',
    wonder: WonderType.christRedeemer,
    artifactId: '502019',
    culture: 'Native American (Brazilian)',
    date: '185 Rs',
  ),
  HighlightData(
    title: '[Studio Portrait: Two Males Wearing Hats and Ponchos, Brazil]',
    wonder: WonderType.christRedeemer,
    artifactId: '764814',
    culture: '',
    date: '260 Rs',
  ),
  HighlightData(
    title: '[Studio Portrait: Female Street Vendor Seated Wearing Turban, Brazil]',
    wonder: WonderType.christRedeemer,
    artifactId: '764816',
    culture: '',
    date: '280 Rs',
  ),
  HighlightData(
    title: 'Pluriarc',
    wonder: WonderType.christRedeemer,
    artifactId: '501319',
    culture: 'African American (Brazil - Afro-Brazilian?)',
    date: '420 Rs',
  ),

// colosseum
  HighlightData(
    title: 'Marble portrait of a young woman',
    wonder: WonderType.colosseum,
    artifactId: '251350',
    culture: 'Roman',
    date: '750 Rs',
  ),
  HighlightData(
    title: 'Silver mirror',
    wonder: WonderType.colosseum,
    artifactId: '255960',
    culture: 'Roman',
    date: '1200 Rs',
  ),
  HighlightData(
    title: 'Marble portrait of the emperor Augustus',
    wonder: WonderType.colosseum,
    artifactId: '247993',
    culture: 'Roman',
    date: '2500 Rs',
  ),
  HighlightData(
    title: 'Terracotta medallion',
    wonder: WonderType.colosseum,
    artifactId: '250464',
    culture: 'Roman',
    date: '380 Rs',
  ),
  HighlightData(
    title: 'Marble head and torso of Athena',
    wonder: WonderType.colosseum,
    artifactId: '251476',
    culture: 'Roman',
    date: '1800 Rs',
  ),
  HighlightData(
    title: 'Silver mirror',
    wonder: WonderType.colosseum,
    artifactId: '255960',
    culture: 'Roman',
    date: '1200 Rs',
  ),

// greatWall
  HighlightData(
    title: 'Cape',
    wonder: WonderType.greatWall,
    artifactId: '79091',
    culture: 'French',
    date: '650 Rs',
  ),
  HighlightData(
    title: 'Censer in the form of a mythical beast',
    wonder: WonderType.greatWall,
    artifactId: '781812',
    culture: 'China',
    date: '1450 Rs',
  ),
  HighlightData(
    title: 'Dish with peafowls and peonies',
    wonder: WonderType.greatWall,
    artifactId: '40213',
    culture: 'China',
    date: '890 Rs',
  ),
  HighlightData(
    title: 'Base for a mandala',
    wonder: WonderType.greatWall,
    artifactId: '40765',
    culture: 'China',
    date: '720 Rs',
  ),
  HighlightData(
    title: 'Bodhisattva Manjushri as Tikshna-Manjushri (Minjie Wenshu)',
    wonder: WonderType.greatWall,
    artifactId: '57612',
    culture: 'China',
    date: '1950 Rs',
  ),
  HighlightData(
    title: 'Tripod incense burner with lid',
    wonder: WonderType.greatWall,
    artifactId: '666573',
    culture: 'China',
    date: '1100 Rs',
  ),

// machuPicchu
  HighlightData(
    title: 'Face Beaker',
    wonder: WonderType.machuPicchu,
    artifactId: '313295',
    culture: 'Inca',
    date: '680 Rs',
  ),
  HighlightData(
    title: 'Feathered Bag',
    wonder: WonderType.machuPicchu,
    artifactId: '316926',
    culture: 'Inca',
    date: '1320 Rs',
  ),
  HighlightData(
    title: 'Female Figurine',
    wonder: WonderType.machuPicchu,
    artifactId: '309944',
    culture: 'Inca',
    date: '850 Rs',
  ),
  HighlightData(
    title: 'Stirrup Spout Bottle with Felines',
    wonder: WonderType.machuPicchu,
    artifactId: '309436',
    culture: 'Moche',
    date: '950 Rs',
  ),
  HighlightData(
    title: 'Camelid figurine',
    wonder: WonderType.machuPicchu,
    artifactId: '309960',
    culture: 'Inca',
    date: '520 Rs',
  ),
  HighlightData(
    title: 'Temple Model',
    wonder: WonderType.machuPicchu,
    artifactId: '316873',
    culture: 'Aztec',
    date: '1750 Rs',
  ),

// petra
  HighlightData(
    title: 'Unguentarium',
    wonder: WonderType.petra,
    artifactId: '325900',
    culture: 'Nabataean',
    date: '240 Rs',
  ),
  HighlightData(
    title: 'Cooking pot',
    wonder: WonderType.petra,
    artifactId: '325902',
    culture: 'Nabataean',
    date: '180 Rs',
  ),
  HighlightData(
    title: 'Lamp',
    wonder: WonderType.petra,
    artifactId: '325919',
    culture: 'Nabataean',
    date: '160 Rs',
  ),
  HighlightData(
    title: 'Bowl',
    wonder: WonderType.petra,
    artifactId: '325884',
    culture: 'Nabataean',
    date: '220 Rs',
  ),
  HighlightData(
    title: 'Small lamp',
    wonder: WonderType.petra,
    artifactId: '325887',
    culture: 'Nabataean',
    date: '140 Rs',
  ),
  HighlightData(
    title: 'Male figurine',
    wonder: WonderType.petra,
    artifactId: '325891',
    culture: 'Nabataean',
    date: '380 Rs',
  ),

// pyramidsGiza
  HighlightData(
    title: 'Guardian Figure',
    wonder: WonderType.pyramidsGiza,
    artifactId: '543864',
    culture: '',
    date: '1500 Rs',
  ),
  HighlightData(
    title: 'Relief fragment',
    wonder: WonderType.pyramidsGiza,
    artifactId: '546488',
    culture: '',
    date: '980 Rs',
  ),
  HighlightData(
    title: 'Ring with Uninscribed Scarab',
    wonder: WonderType.pyramidsGiza,
    artifactId: '557137',
    culture: '',
    date: '750 Rs',
  ),
  HighlightData(
    title: 'Nikare as a scribe',
    wonder: WonderType.pyramidsGiza,
    artifactId: '543900',
    culture: '',
    date: '2200 Rs',
  ),
  HighlightData(
    title: 'Seated Statue of King Menkaure',
    wonder: WonderType.pyramidsGiza,
    artifactId: '543935',
    culture: '',
    date: '3500 Rs',
  ),
  HighlightData(
    title: 'Floral collar from Tutankhamun\'s Embalming Cache',
    wonder: WonderType.pyramidsGiza,
    artifactId: '544782',
    culture: '',
    date: '4200 Rs',
  ),

// tajMahal
  HighlightData(
    title: 'Mango-Shaped Flask',
    wonder: WonderType.tajMahal,
    artifactId: '453341',
    culture: '',
    date: '920 Rs',
  ),
  HighlightData(
    title: 'Base for a Water Pipe (Huqqa) with Irises',
    wonder: WonderType.tajMahal,
    artifactId: '453243',
    culture: '',
    date: '1150 Rs',
  ),
  HighlightData(
    title: 'Plate',
    wonder: WonderType.tajMahal,
    artifactId: '73309',
    culture: 'India (Gujarat)',
    date: '680 Rs',
  ),
  HighlightData(
    title: 'Helmet',
    wonder: WonderType.tajMahal,
    artifactId: '24932',
    culture: 'Indian, Mughal',
    date: '2800 Rs',
  ),
  HighlightData(
    title: 'Jewelled plate',
    wonder: WonderType.tajMahal,
    artifactId: '56230',
    culture: 'India',
    date: '3200 Rs',
  ),
  HighlightData(
    title: 'Shirt of Mail and Plate of Emperor Shah Jahan (reigned 1624–58)',
    wonder: WonderType.tajMahal,
    artifactId: '35633',
    culture: 'Indian',
    date: '5500 Rs',
  ),
];
