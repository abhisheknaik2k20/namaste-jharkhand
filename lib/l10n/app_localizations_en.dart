// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Wonderous';

  @override
  String get localeSwapButton => '简体中文';

  @override
  String animatedArrowSemanticSwipe(Object title) {
    return 'Explore details about $title.';
  }

  @override
  String get appBarTitleFactsHistory => 'Facts and History';

  @override
  String get appBarTitleConstruction => 'Construction';

  @override
  String get appBarTitleLocation => 'Location Info';

  @override
  String get bottomScrubberSemanticScrubber => 'scrubber';

  @override
  String get bottomScrubberSemanticTimeline => 'Timeline Scrubber, drag horizontally to navigate the timeline.';

  @override
  String collectionLabelDiscovered(Object percentage) {
    return '$percentage% discovered';
  }

  @override
  String collectionLabelCount(Object count, Object total) {
    return '$count of $total';
  }

  @override
  String get collectionButtonReset => 'Reset Collection';

  @override
  String get eventsListButtonOpenGlobal => 'Open global timeline';

  @override
  String newlyDiscoveredSemanticNew(Object count, Object suffix) {
    return '$count new item$suffix to explore. Scroll to new item';
  }

  @override
  String newlyDiscoveredLabelNew(Object count, Object suffix) {
    return '$count new item$suffix to explore';
  }

  @override
  String get resultsPopupEnglishContent =>
      'This content is provided by the Metropolitan Museum of Art Collection API, and is only available in English.';

  @override
  String get resultsSemanticDismiss => 'dismiss message';

  @override
  String get scrollingContentSemanticYoutube => 'Youtube thumbnail';

  @override
  String get scrollingContentSemanticOpen => 'Open fullscreen maps view';

  @override
  String get searchInputTitleSuggestions => 'Suggestions';

  @override
  String get searchInputHintSearch => 'Search (ex. type or material)';

  @override
  String get searchInputSemanticClear => 'clear search';

  @override
  String timelineSemanticDate(Object fromDate, Object endDate) {
    return '$fromDate to $endDate';
  }

  @override
  String titleLabelDate(Object fromDate, Object endDate) {
    return '$fromDate to $endDate';
  }

  @override
  String get appModalsButtonOk => 'Ok';

  @override
  String get appModalsButtonCancel => 'Cancel';

  @override
  String get appPageDefaultTitlePage => 'page';

  @override
  String appPageSemanticSwipe(Object pageTitle, Object current, Object total) {
    return '$pageTitle $current of $total.';
  }

  @override
  String semanticsPrevious(Object title) {
    return 'Previous $title';
  }

  @override
  String semanticsNext(Object title) {
    return 'Next $title';
  }

  @override
  String get artifactsTitleArtifacts => 'MARKETPLACE';

  @override
  String get artifactsSemanticsPrevious => 'Previous marketplace';

  @override
  String get artifactsSemanticsNext => 'Next marketplace';

  @override
  String get artifactsSemanticArtifact => 'Marketplace';

  @override
  String get artifactsButtonBrowse => 'Browse all marketplace';

  @override
  String get artifactDetailsLabelDate => 'Date';

  @override
  String get artifactDetailsLabelPeriod => 'Period';

  @override
  String get artifactDetailsLabelGeography => 'Geography';

  @override
  String get artifactDetailsLabelMedium => 'Medium';

  @override
  String get artifactDetailsLabelDimension => 'Dimension';

  @override
  String get artifactDetailsLabelClassification => 'Classification';

  @override
  String get artifactDetailsSemanticThumbnail => 'thumbnail image';

  @override
  String artifactDetailsErrorNotFound(Object artifactId) {
    return 'Unable to find info for marketplace $artifactId ';
  }

  @override
  String get artifactsSearchTitleBrowse => 'Browse Marketplace';

  @override
  String get artifactsSearchLabelNotFound => 'No marketplace found';

  @override
  String get artifactsSearchButtonToggle => 'Toggle Timeframe';

  @override
  String get artifactsSearchSemanticTimeframe => 'timeframe';

  @override
  String artifactsSearchLabelFound(Object numFound, Object numResults) {
    return '$numFound marketplace found, $numResults in ';
  }

  @override
  String get artifactsSearchLabelAdjust => 'Adjust your';

  @override
  String get artifactsSearchLabelSearch => 'search terms';

  @override
  String get artifactsSearchLabelTimeframe => 'timeframe';

  @override
  String get circleButtonsSemanticClose => 'close';

  @override
  String get circleButtonsSemanticBack => 'back';

  @override
  String get collectibleFoundTitleArtifactDiscovered => 'Artifact Discovered';

  @override
  String get collectibleFoundButtonViewCollection => 'view in my collection';

  @override
  String get collectibleItemSemanticCollectible => 'collectible item';

  @override
  String get collectionTitleCollection => 'Collection';

  @override
  String get collectionPopupResetConfirm => 'Are you sure you want to reset your collection?';

  @override
  String get eightWaySemanticSwipeDetector => 'eight-way swipe detector';

  @override
  String get expandingTimeSelectorSemanticSelector => 'time range selector';

  @override
  String get fullscreenImageViewerSemanticFull => 'full screen image, no description available';

  @override
  String get homeMenuButtonExplore => 'Explore the timeline';

  @override
  String get homeMenuButtonView => 'View your collection';

  @override
  String get homeMenuButtonAbout => 'About this app';

  @override
  String get homeMenuAboutWonderous => 'Wonderous is a visual showcase of eight wonders of the world. ';

  @override
  String homeMenuAboutBuilt(Object flutterUrl, Object gskinnerUrl) {
    return 'Built with $flutterUrl by the team at $gskinnerUrl.';
  }

  @override
  String homeMenuAboutLearn(Object wonderousUrl) {
    return 'Learn more at $wonderousUrl.';
  }

  @override
  String homeMenuAboutSource(Object githubUrl) {
    return 'To see the source code for this app, please visit the $githubUrl.';
  }

  @override
  String get homeMenuAboutRepo => 'Wonderous github repo';

  @override
  String get homeMenuAboutFlutter => 'Flutter';

  @override
  String get homeMenuAboutGskinner => 'gskinner';

  @override
  String get homeMenuAboutApp => 'wonderous.app';

  @override
  String homeMenuAboutPublic(Object metUrl) {
    return 'Public-domain artworks from $metUrl.';
  }

  @override
  String get homeMenuAboutMet => 'The Metropolitan Museum of Art, New York';

  @override
  String homeMenuAboutPhotography(Object unsplashUrl) {
    return 'Photography from $unsplashUrl.';
  }

  @override
  String get homeMenuAboutUnsplash => 'Unsplash';

  @override
  String get introTitleJourney => 'Journey through Jharkhand';

  @override
  String get introDescriptionNavigate => 'Navigate the land of forests, waterfalls, and vibrant tribal heritage.';

  @override
  String get introTitleExplore => 'Explore landmarks';

  @override
  String get introDescriptionUncover =>
      'Uncover ancient temples, majestic waterfalls, and hidden caves across Jharkhand.';

  @override
  String get introTitleDiscover => 'Discover traditions';

  @override
  String get introDescriptionLearn =>
      'Learn about Jharkhand’s diverse tribal culture, festivals, and timeless art forms.';

  @override
  String get introSemanticNavigate => 'Navigate';

  @override
  String get introSemanticSwipeLeft => 'Swipe left to continue';

  @override
  String get introSemanticEnterApp => 'Enter the app';

  @override
  String get introSemanticWonderous => 'Wonderous';

  @override
  String get labelledToggleSemanticToggle => 'toggle';

  @override
  String get photoGallerySemanticCollectible => 'collectible!';

  @override
  String photoGallerySemanticFocus(Object photoIndex, Object photoTotal) {
    return 'Photo $photoIndex of $photoTotal. Tap to focus.';
  }

  @override
  String photoGallerySemanticFullscreen(Object photoIndex, Object photoTotal) {
    return 'Photo $photoIndex of $photoTotal. Tap to open fullscreen view.';
  }

  @override
  String get eraPrehistory => 'Prehistory';

  @override
  String get eraClassical => 'Classical Era';

  @override
  String get eraEarlyModern => 'Early Modern Era';

  @override
  String get eraModern => 'Modern Era';

  @override
  String get yearBCE => 'BCE';

  @override
  String get yearCE => 'CE';

  @override
  String yearFormat(Object date, Object era) {
    return '$date $era';
  }

  @override
  String get year => 'Year';

  @override
  String timelineLabelConstruction(Object title) {
    return 'Construction of $title begins.';
  }

  @override
  String get timelineTitleGlobalTimeline => 'Global Timeline';

  @override
  String get wallpaperModalSave => 'Save this poster to your photo gallery?';

  @override
  String get wallpaperModalSaving => 'Saving Image. Please wait...';

  @override
  String get wallpaperModalSaveComplete => 'Save complete!';

  @override
  String get wallpaperSemanticSharePhoto => 'share photo';

  @override
  String get wallpaperSemanticTakePhoto => 'take photo';

  @override
  String get wallpaperCheckboxShowTitle => 'Show Title';

  @override
  String get wonderDetailsTabLabelInformation => 'information and history';

  @override
  String get wonderDetailsTabLabelImages => 'photo gallery';

  @override
  String get wonderDetailsTabLabelArtifacts => 'artifacts';

  @override
  String get wonderDetailsTabLabelEvents => 'events';

  @override
  String get wonderDetailsTabSemanticBack => 'back to wonder selection';

  @override
  String get homeSemanticOpenMain => 'Open main menu';

  @override
  String get homeSemanticWonder => 'wonder';

  @override
  String get JagannathTempleTitle => 'Jagannath Temple';

  @override
  String get JagannathTempleSubTitle => 'Lord of the Universe';

  @override
  String get JagannathTempleRegionTitle => 'Puri, Odisha';

  @override
  String get JagannathTempleArtifactCulture => 'Hindu';

  @override
  String get JagannathTempleArtifactGeolocation => 'Eastern India';

  @override
  String get JagannathTemplePullQuote1Top => 'The Divine Connection Between';

  @override
  String get JagannathTemplePullQuote1Bottom => 'Earth and the Sacred Realm';

  @override
  String get JagannathTemplePullQuote2 =>
      'The Jagannath Temple represents the eternal bond between devotion and divinity, where millions find spiritual solace and divine blessings.';

  @override
  String get JagannathTemplePullQuote2Author => 'Devotional Scripture';

  @override
  String get JagannathTempleCallout1 =>
      'The temple exhibits the magnificent Kalinga architectural style, featuring a towering spire that dominates the skyline of Puri and serves as a beacon for pilgrims.';

  @override
  String get JagannathTempleCallout2 =>
      'The temple complex covers a substantial area and houses the famous wooden deities of Lord Jagannath, Balabhadra, and Subhadra on the jeweled throne (Ratna Simhasana).';

  @override
  String get JagannathTempleVideoCaption => 'Jagannath Temple: Sacred Journey and Divine Architecture of Puri';

  @override
  String get JagannathTempleMapCaption =>
      'Map showing location of Jagannath Temple in Puri, Odisha, on the eastern coast of India.';

  @override
  String get JagannathTempleHistoryInfo1 =>
      'The Jagannath Temple is a Hindu temple dedicated to Lord Jagannath, a form of Vishnu, located in Puri, Odisha. The present temple was constructed in the 12th century by King Anantavarman Chodaganga Deva of the Eastern Ganga dynasty. According to temple records, the original temple was built by the legendary King Indradyumna of Avanti.';

  @override
  String get JagannathTempleHistoryInfo2 =>
      'The temple is one of the four sacred Char Dham pilgrimage sites in Hinduism, along with Dwarka, Badrinath, and Rameswaram. It has been a major center of Vaishnavism for over a thousand years and attracts millions of devotees annually, especially during the world-famous Rath Yatra festival.';

  @override
  String get JagannathTempleConstructionInfo1 =>
      'The temple showcases the classic Kalinga architectural style with its towering spire (vimana) built in the Nagara style Rekha deula and the assembly hall (jagamohana) in Pidha deula style. The main structure stands on a raised platform in the center of an inner courtyard and features intricate stone carvings.';

  @override
  String get JagannathTempleConstructionInfo2 =>
      'The temple complex includes the main shrine housing the wooden deities on the Ratna Simhasana (jeweled throne), along with multiple smaller temples and structures. The famous wooden idols of Jagannath, Balabhadra, and Subhadra are unique in their abstract, stylized forms and are renewed in a sacred ceremony called Nabakalebara.';

  @override
  String get JagannathTempleLocationInfo1 =>
      'The Jagannath Temple is located in Puri, a coastal city in Odisha state on India\'s eastern seaboard. The temple sits near the Bay of Bengal, making it easily accessible to pilgrims from across India and beyond.';

  @override
  String get JagannathTempleLocationInfo2 =>
      'Puri is well-connected by road, rail, and air, with the temple serving as the spiritual and cultural heart of the city. The annual Rath Yatra procession moves through the Grand Road (Bada Danda) to the Gundicha Temple, covering a distance that becomes a sacred pathway for millions of devotees.';

  @override
  String get JagannathTemple600ce =>
      'Ancient period: Early establishment of Jagannath worship in the region, with roots in tribal and Vedic traditions.';

  @override
  String get JagannathTemple832ce =>
      'Medieval period: Development of organized temple worship and construction of earlier temple structures on the site.';

  @override
  String get JagannathTemple998ce =>
      'Continued expansion and establishment of the temple as a major pilgrimage center in eastern India.';

  @override
  String get JagannathTemple1100ce =>
      '12th century: Construction of the present temple structure begins under King Anantavarman Chodaganga Deva.';

  @override
  String get JagannathTemple1527ce =>
      'Mughal period: Temple faces challenges but maintains its religious significance and devotional practices.';

  @override
  String get JagannathTemple1535ce =>
      '1558 CE: First recorded Rath Yatra festival begins, establishing the annual chariot procession tradition that continues today.';

  @override
  String get JagannathTempleCollectible1Title => 'Sacred Tulsi Beads';

  @override
  String get JagannathTempleCollectible1Icon => 'jewelry';

  @override
  String get JagannathTempleCollectible2Title => 'Temple Bell Ornament';

  @override
  String get JagannathTempleCollectible2Icon => 'jewelry';

  @override
  String get JagannathTempleCollectible3Title => 'Pattachitra Painting';

  @override
  String get JagannathTempleCollectible3Icon => 'picture';

  @override
  String get BetlaNationalParkTitle => 'Betla National Park';

  @override
  String get BetlaNationalParkSubTitle => 'Wildlife Sanctuary and Tiger Reserve';

  @override
  String get BetlaNationalParkRegionTitle => 'Latehar District, Jharkhand';

  @override
  String get BetlaNationalParkArtifactGeolocation => 'Eastern India';

  @override
  String get BetlaNationalParkPullQuote1Top => 'A Perfect Union Between';

  @override
  String get BetlaNationalParkPullQuote1Bottom => 'Wildlife and Conservation';

  @override
  String get BetlaNationalParkPullQuote2 =>
      'Stepping into Betla is like entering a different realm where majestic predators like tigers, leopards, wolves, and wild dogs roam.';

  @override
  String get BetlaNationalParkPullQuote2Author => 'Wildlife Guide';

  @override
  String get BetlaNationalParkCallout1 =>
      'Betla is an acronym for Bison, Elephant, Tiger, Leopard, and Axis-axis, representing the diverse wildlife found in the park.';

  @override
  String get BetlaNationalParkCallout2 =>
      'It was one of the first nine tiger reserves created in India under Project Tiger in 1973, and declared a national park in 1986, spreading over 226.32 square kilometers.';

  @override
  String get BetlaNationalParkVideoCaption => 'Betla National Park: Wildlife Safari and Conservation in Jharkhand';

  @override
  String get BetlaNationalParkMapCaption =>
      'Map showing location of Betla National Park in Latehar and Palamu districts, Jharkhand.';

  @override
  String get BetlaNationalParkHistoryInfo1 =>
      'Betla National Park was originally established as Palamau Wildlife Sanctuary and later became part of the Palamau Tiger Reserve when Project Tiger was launched in 1973. The region has been inhabited for centuries by indigenous tribes like the Oraon and Munda, who have coexisted with the wildlife.';

  @override
  String get BetlaNationalParkHistoryInfo2 =>
      'The park gained prominence as one of the first nine tiger reserves in India under Project Tiger initiative. It has the distinction of being the first sanctuary in the world where certain tiger conservation milestones were achieved. The area was upgraded from a wildlife sanctuary to a national park status in 1986.';

  @override
  String get BetlaNationalParkConstructionInfo1 =>
      'The park is located on the Chota Nagpur Plateau with an average elevation of about 1000 feet. It falls within the Indo-Malayan biogeographic realm and boasts remarkable diversity of flora and fauna across its varied terrain of forests, hills, valleys, and grasslands.';

  @override
  String get BetlaNationalParkConstructionInfo2 =>
      'Infrastructure within the park includes watch towers, ground hides for wildlife viewing, safari routes for jeeps and elephant rides, and visitor facilities. The park is designed to provide multiple opportunities for wildlife observation while maintaining conservation protocols.';

  @override
  String get BetlaNationalParkLocationInfo1 =>
      'Betla National Park is located in the Latehar and Palamu districts of Jharkhand, approximately 170 kilometers from Ranchi. It is situated in the Chota Nagpur Plateau region, surrounded by lush green forests, hills, valleys, and waterfalls.';

  @override
  String get BetlaNationalParkLocationInfo2 =>
      'The park forms the core area of the larger Palamau Tiger Reserve, which covers a total area of 1,129.93 square kilometers. The location provides a natural habitat for diverse wildlife in the heart of Jharkhand\'s tribal belt.';

  @override
  String get BetlaNationalPark1850ce =>
      'Indigenous tribes like Oraon and Munda have inhabited the region for centuries, living in harmony with the diverse wildlife of the area.';

  @override
  String get BetlaNationalPark1921ce =>
      'Early wildlife surveys and documentation of the region\'s biodiversity begin, recognizing the area\'s potential for conservation.';

  @override
  String get BetlaNationalPark1922ce =>
      'The region gains attention from colonial forest administration for its rich wildlife and forest resources.';

  @override
  String get BetlaNationalPark1926ce =>
      'Systematic wildlife management and protection measures begin to be implemented in the region.';

  @override
  String get BetlaNationalPark1931ce =>
      'The area is formally recognized as requiring special protection due to its unique ecosystem and wildlife population.';

  @override
  String get BetlaNationalPark2006ce =>
      'Continued conservation efforts and modernization of park facilities, including improved safari infrastructure and visitor amenities.';

  @override
  String get BetlaNationalParkCollectible1Title => 'Tiger Pugmark Cast';

  @override
  String get BetlaNationalParkCollectible1Icon => 'statue';

  @override
  String get BetlaNationalParkCollectible2Title => 'Medicinal Plant Collection';

  @override
  String get BetlaNationalParkCollectible2Icon => 'jewelry';

  @override
  String get BetlaNationalParkCollectible3Title => 'Tribal Handicrafts';

  @override
  String get BetlaNationalParkCollectible3Icon => 'textile';

  @override
  String get ParasnathHillTitle => 'Parasnath Hill';

  @override
  String get ParasnathHillSubTitle => 'Sammed Shikhar';

  @override
  String get ParasnathHillRegionTitle => 'Giridih, Jharkhand';

  @override
  String get ParasnathHillArtifactCulture => 'Jain';

  @override
  String get ParasnathHillArtifactGeolocation => 'Eastern India';

  @override
  String get ParasnathHillPullQuote1Top => 'Sacred Peak Where Twenty';

  @override
  String get ParasnathHillPullQuote1Bottom => 'Tirthankaras Attained Moksha';

  @override
  String get ParasnathHillPullQuote2 =>
      'Sammed Shikhar represents the ultimate spiritual destination where divine souls achieved liberation through meditation and detachment from worldly bonds.';

  @override
  String get ParasnathHillPullQuote2Author => 'Jain Scripture';

  @override
  String get ParasnathHillCallout1 =>
      'It is the holiest pilgrimage site for Jains, where 20 out of 24 Tirthankaras attained Moksha (salvation), including the 23rd Tirthankara Lord Parshvanatha who achieved liberation here in 772 BCE.';

  @override
  String get ParasnathHillCallout2 =>
      'At 1,370 meters (4,480 feet), it is the highest peak in Jharkhand state and houses 32 ancient temples with exquisite stone carvings depicting Jain spiritual teachings and mythology.';

  @override
  String get ParasnathHillVideoCaption => 'Sammed Shikhar: Sacred Journey to Jain Pilgrimage Site on Parasnath Hill';

  @override
  String get ParasnathHillMapCaption =>
      'Map showing location of Parasnath Hill in Giridih district, Jharkhand, Eastern India';

  @override
  String get ParasnathHillHistoryInfo1 =>
      'Parasnath Hill, also known as Sammed Shikhar (Peak of Concentration), is an ancient Jain pilgrimage site with archaeological evidence indicating Jain presence dating back to at least 1500 BCE. The earliest literary reference appears in the Jñātṛdhārmakātha, compiled in the 6th century BCE.';

  @override
  String get ParasnathHillHistoryInfo2 =>
      'The site derives its name from Lord Parshvanatha, the 23rd Tirthankara, who attained Moksha here in 772 BCE. Throughout history, it has remained the most sacred Jain tirth (pilgrimage site), continuously drawing devotees seeking spiritual liberation and enlightenment.';

  @override
  String get ParasnathHillConstructionInfo1 =>
      'The temple complex showcases magnificent Jain architecture built primarily in the 18th century, featuring 32 temples distributed across the hill. The structures display intricate stone carvings, beautiful murals on temple walls, and delicately carved sculptures that depict Jain religious tenets.';

  @override
  String get ParasnathHillConstructionInfo2 =>
      'The temples feature distinctive arched gateway structures and elaborate wall carvings that narrate stories of spiritual Jain teachers. At the base in Madhuvan, there are eight main temples, two Dadawadis (pilgrimage rest houses), and the temple of Bhomiyaji Maharaja, creating a divine architectural ensemble.';

  @override
  String get ParasnathHillLocationInfo1 =>
      'Parasnath Hill is located in the Giridih district of Jharkhand state in eastern India, rising to 1,370 meters as the highest mountain in the state. It lies on the NH-2 Delhi-Kolkata highway section of the historic Grand Trunk Road.';

  @override
  String get ParasnathHillLocationInfo2 =>
      'The hill is part of the Parasnath Wildlife Sanctuary, a protected area that preserves both the natural ecosystem and sacred Jain heritage. The site is accessible to pilgrims from across India and internationally, serving as the spiritual heart of global Jainism.';

  @override
  String get ParasnathHill70ce =>
      '1500 BCE: Archaeological evidence indicates the earliest Jain presence on Parasnath Hill, establishing it as an ancient center of Jain spirituality and meditation.';

  @override
  String get ParasnathHill82ce =>
      '772 BCE: Lord Parshvanatha, the 23rd Tirthankara, attains Moksha (salvation) on the hill, giving the site its sacred name and establishing its supreme religious significance.';

  @override
  String get ParasnathHill1140ce =>
      '6th century BCE: The Jñātṛdhārmakātha, one of the twelve core Jain texts, makes the earliest literary reference to Shikharji as a sacred tirth (pilgrimage site).';

  @override
  String get ParasnathHill1490ce =>
      '12th century: Historical records indicate continued religious activities and temple maintenance, with the site serving as an established pilgrimage center.';

  @override
  String get ParasnathHill1829ce =>
      '18th century: Major temple construction period begins, with the current architectural complex of 32 temples being built, featuring the distinctive Jain architectural style with intricate carvings.';

  @override
  String get ParasnathHill1990ce =>
      'Modern era: The site continues to attract millions of Jain pilgrims annually and is recognized as a protected wildlife sanctuary, balancing religious heritage with environmental conservation.';

  @override
  String get ParasnathHillCollectible1Title => 'Jain Prayer Beads (Mala)';

  @override
  String get ParasnathHillCollectible1Icon => 'jewelry';

  @override
  String get ParasnathHillCollectible2Title => 'Tirthankara Sculpture';

  @override
  String get ParasnathHillCollectible2Icon => 'statue';

  @override
  String get ParasnathHillCollectible3Title => 'Jain Manuscript Palm Leaf';

  @override
  String get ParasnathHillCollectible3Icon => 'picture';

  @override
  String get PatratuValleyTitle => 'Patratu Valley';

  @override
  String get PatratuValleySubTitle => 'Industrial Heritage & Natural Beauty';

  @override
  String get PatratuValleyRegionTitle => 'Ramgarh District, Jharkhand';

  @override
  String get PatratuValleyArtifactCulture => 'Scenic Valley with Thermal Power Heritage ';

  @override
  String get PatratuValleyArtifactGeolocation => 'Eastern India';

  @override
  String get PatratuValleyPullQuote1Top => 'A Perfect Blend of';

  @override
  String get PatratuValleyPullQuote1Bottom => 'Nature and Industry';

  @override
  String get PatratuValleyPullQuote2 =>
      'The journey from Ranchi is an adventure in itself with twisting ways providing you an unmatched scenery.';

  @override
  String get PatratuValleyPullQuote2Author => 'MakeMyTrip Travel Guide';

  @override
  String get PatratuValleyCallout1 =>
      'The Patratu Thermal Power Station was built with Russian collaboration in 1962 and has a power generation capacity of 840MW.';

  @override
  String get PatratuValleyCallout2 =>
      'The Patratu Dam was constructed on the Nalkari River with a total storage capacity of 81 square miles to supply water to the thermal power station.';

  @override
  String get PatratuValleyVideoCaption =>
      'Patratu Valley: Where Industry Meets Nature in Jharkhand\'s Beautiful Landscape';

  @override
  String get PatratuValleyMapCaption =>
      'Map showing location of Patratu Valley in Ramgarh District, Jharkhand, about one hour from Ranchi.';

  @override
  String get PatratuValleyHistoryInfo1 =>
      'Patratu Valley is located in Ramgarh district of Jharkhand state in eastern India. The area developed as a residential town for employees of the Patratu Thermal Power Station, which was established through Russian collaboration in 1962. The valley is known for its lush green terrains and the dam built upon the Nalkari River.';

  @override
  String get PatratuValleyHistoryInfo2 =>
      'The thermal power station has four chimneys - two built by a Russian firm (called the Russian side) and two by an Indian firm (the Indian side). The dam serves as the main water reservoir for the power plant and has become a popular tourist destination, particularly during winter months when large numbers of visitors come for picnics.';

  @override
  String get PatratuValleyConstructionInfo1 =>
      'The Patratu Dam was constructed in 1962 on the Nalkari River, located 30 km west of Ramgarh. Water from the river and from waterfalls of the surrounding hills is stored in this dam. The construction was specifically designed to supply water to the Patratu Thermal Power Station\'s operations.';

  @override
  String get PatratuValleyConstructionInfo2 =>
      'The thermal power plant construction involved both Russian and Indian engineering expertise. The facility includes residential areas for employees and supporting infrastructure. A circuit house was built beside the dam, and the area features temples including the Panchawahini temple adjacent to the dam.';

  @override
  String get PatratuValleyLocationInfo1 =>
      'Patratu Valley lies in the Ramgarh district of Jharkhand, accessible via a scenic hour-long drive from Ranchi. The valley features twisting roads with hairpin bends that provide spectacular views, especially when seen from above. The location offers panoramic views of the surrounding hills and the expansive dam.';

  @override
  String get PatratuValleyLocationInfo2 =>
      'The valley serves multiple purposes beyond power generation - it has become a significant tourist destination offering boat rides, picnic spots, and temple visits. The area includes the Maa Panchwahini Mandir and Mata Rani Mandir temples, and provides access to local eateries serving traditional Jharkhandi cuisine.';

  @override
  String get PatratuValley700bce =>
      '1962 CE: The foundation of modern Patratu was laid with the establishment of the thermal power station through Russian collaboration, marking the beginning of the area\'s transformation from a rural valley to an industrial township.';

  @override
  String get PatratuValley214bce =>
      '1962 CE: Construction of the Patratu Dam was completed on the Nalkari River, creating an 81 square mile water reservoir to supply the newly built thermal power station, fundamentally changing the landscape of the valley.';

  @override
  String get PatratuValley121bce =>
      '1970s CE: Development of residential areas for power plant employees led to the growth of Patratu as a planned township, with infrastructure including housing, schools, and community facilities being established over a 20-year period.';

  @override
  String get PatratuValley556ce =>
      '1980s-1990s CE: The area began gaining recognition as a tourist destination, with the Jharkhand Tourism Department developing facilities including the tourist complex at Patratu Lake and promoting it as a scenic getaway from urban centers.';

  @override
  String get PatratuValley618ce =>
      '2000s CE: Patratu Valley saw increased tourism development with improved road access and facilities, though the thermal power station faced periods of reduced operation and maintenance challenges in later decades.';

  @override
  String get PatratuValley1487ce =>
      '2020s CE: Modern tourism initiatives by the Jharkhand government have focused on developing the waterfront and making the valley more attractive to visitors, while plans for expanding power generation capacity continue to be considered.';

  @override
  String get PatratuValleyCollectible1Title => 'Patratu Dam Waters';

  @override
  String get PatratuValleyCollectible1Icon => 'water';

  @override
  String get PatratuValleyCollectible2Title => 'Thermal Power Station Model';

  @override
  String get PatratuValleyCollectible2Icon => 'industry';

  @override
  String get PatratuValleyCollectible3Title => 'Panchawahini Temple Offering';

  @override
  String get PatratuValleyCollectible3Icon => 'temple';

  @override
  String get hundruFallsTitle => 'Hundru Falls';

  @override
  String get hundruFallsSubTitle => 'Jharkhand\'s Highest Waterfall';

  @override
  String get hundruFallsRegionTitle => 'Ranchi District, Jharkhand';

  @override
  String get hundruFallsArtifactCulture => 'Natural Wonder';

  @override
  String get hundruFallsArtifactGeolocation => 'Eastern India';

  @override
  String get hundruFallsPullQuote1Top => 'A Spectacular Scene of Water';

  @override
  String get hundruFallsPullQuote1Bottom => 'Falling from Great Height';

  @override
  String get hundruFallsPullQuote1Author => 'Government of Jharkhand';

  @override
  String get hundruFallsPullQuote2 =>
      'The cascading water creates a misty ambience and forms a frothy pool at the base, which is an exhilarating sight for visitors.';

  @override
  String get hundruFallsPullQuote2Author => 'Travel Guide';

  @override
  String get hundruFallsCallout1 =>
      'The waterfall falls from a height of 98 metres (322 feet), making it one of the highest waterfalls in Jharkhand state and the 34th highest waterfall in India.';

  @override
  String get hundruFallsCallout2 =>
      'The different formations of rock due to water erosion create various shapes and niches, lending an almost otherworldly feel to the landscape.';

  @override
  String get hundruFallsVideoCaption => 'Hundru Falls: Nature\'s Spectacular Display in Jharkhand';

  @override
  String get hundruFallsMapCaption =>
      'Map showing location of Hundru Falls on the Subarnarekha River in Ranchi District, Jharkhand.';

  @override
  String get hundruFallsHistoryInfo1 =>
      'Hundru Falls is a natural waterfall located in Ranchi district of Jharkhand state in eastern India. The waterfall is formed by the Subarnarekha River, which originates near Piska/Nagri and flows through several districts before joining the Bay of Bengal.';

  @override
  String get hundruFallsHistoryInfo2 =>
      'The waterfall represents a geological feature called a knickpoint, caused by rejuvenation. This break in the river\'s gradient allows water to fall vertically, creating the spectacular waterfall that has become one of Jharkhand\'s most popular tourist destinations.';

  @override
  String get hundruFallsConstructionInfo1 =>
      'The waterfall is a natural geological formation created by the erosion patterns of the Subarnarekha River over thousands of years. The rocky terrain around the falls has been shaped by continuous water flow, creating unique rock formations and natural pools.';

  @override
  String get hundruFallsConstructionInfo2 =>
      'The base of the waterfall features a natural pool that serves as both a scenic attraction and a popular bathing spot for visitors. The surrounding landscape is characterized by lush forests and rocky terrain that provides natural beauty and biodiversity.';

  @override
  String get hundruFallsLocationInfo1 =>
      'Hundru Falls is situated in the Ranchi district of Jharkhand, approximately 45 kilometers from Ranchi city. The waterfall is easily accessible by road and is located in the village of Hundru, making it a popular destination for day trips and picnics.';

  @override
  String get hundruFallsLocationInfo2 =>
      'The surrounding area is characterized by dense forests and rocky terrain. The Subarnarekha River continues its journey from here through multiple states including Jharkhand, West Bengal, and Odisha before ultimately reaching the Bay of Bengal at Talsari.';

  @override
  String get hundruFalls1438ce =>
      'Natural formation of the waterfall begins through geological processes and river erosion over millennia.';

  @override
  String get hundruFalls1572ce =>
      'Local tribal communities and residents of the region have known about the waterfall for generations, using it as a water source and gathering place.';

  @override
  String get hundruFalls1867ce =>
      'The waterfall begins to gain recognition beyond local communities as transportation and communication improve in the region.';

  @override
  String get hundruFalls1911ce =>
      'Post-independence development of Jharkhand region brings increased awareness of natural attractions like Hundru Falls.';

  @override
  String get hundruFalls1964ce =>
      'Tourism infrastructure begins to develop around the waterfall, making it more accessible to visitors from other regions.';

  @override
  String get hundruFalls1997ce =>
      'Hundru Falls becomes established as one of Jharkhand\'s premier tourist destinations, attracting nature lovers and adventure seekers from across India.';

  @override
  String get hundruFallsCollectible1Title => 'River Stone Collection';

  @override
  String get hundruFallsCollectible1Icon => 'stone';

  @override
  String get hundruFallsCollectible2Title => 'Forest Flora Sample';

  @override
  String get hundruFallsCollectible2Icon => 'leaf';

  @override
  String get hundruFallsCollectible3Title => 'Water Crystal Formation';

  @override
  String get hundruFallsCollectible3Icon => 'crystal';

  @override
  String get TapovanCavesTitle => 'Tapovan Caves';

  @override
  String get TapovanCavesSubTitle => 'Forest of Meditation';

  @override
  String get TapovanCavesRegionTitle => 'Deoghar, Jharkhand';

  @override
  String get TapovanCavesArtifactCulture => 'Hindu';

  @override
  String get TapovanCavesArtifactGeolocation => 'Eastern India';

  @override
  String get TapovanCavesPullQuote1Top => 'Sacred Caves Where Sage';

  @override
  String get TapovanCavesPullQuote1Bottom => 'Valmiki Found Divine Solitude';

  @override
  String get TapovanCavesPullQuote1Author => 'Ancient Hindu Tradition';

  @override
  String get TapovanCavesPullQuote2 =>
      'Tapovan represents the eternal quest for spiritual enlightenment, where meditation transforms the seeker into the divine.';

  @override
  String get TapovanCavesPullQuote2Author => 'Hindu Scripture';

  @override
  String get TapovanCavesCallout1 =>
      'The name \'Tapovan\' translates to \'forest of meditation\' in Sanskrit, reflecting the spiritual aura permeating this sacred site where ancient sages sought enlightenment.';

  @override
  String get TapovanCavesCallout2 =>
      'These historic caves carved into the hills feature intricate sculptures and quiet interiors, providing fascinating insights into the region\'s rich spiritual heritage and meditative traditions.';

  @override
  String get TapovanCavesVideoCaption => 'Tapovan Caves: Sacred Meditation Retreat in the Hills of Deoghar, Jharkhand';

  @override
  String get TapovanCavesMapCaption =>
      'Map showing location of Tapovan Caves, 10 kilometers from Deoghar in Jharkhand, Eastern India';

  @override
  String get TapovanCavesHistoryInfo1 =>
      'Tapovan Caves have been a spiritual sanctuary for thousands of years, with legends dating back to the Treta Yuga when Lord Rama, Sita, and Lakshmana are believed to have stayed here during their 14-year exile. The caves derive their sacred significance from being the meditation retreat of Sage Valmiki, the composer of the Ramayana.';

  @override
  String get TapovanCavesHistoryInfo2 =>
      'The site gained prominence as a center for intense spiritual practice (tapas) when Sage Valmiki came here to do penance for his past wrongdoings and later composed parts of the Ramayana in these very caves. Throughout history, numerous saints and ascetics have found solitude and enlightenment in these tranquil surroundings.';

  @override
  String get TapovanCavesConstructionInfo1 =>
      'The Tapovan Caves are naturally formed caverns enhanced with carved elements, featuring the sacred Taponath Mahadeva temple at the summit. Inside one of the main caves, a naturally formed Shiva lingam has been installed, creating a powerful spiritual focal point for devotees and pilgrims.';

  @override
  String get TapovanCavesConstructionInfo2 =>
      'The cave complex showcases intricate stone sculptures and carvings that depict various Hindu deities and spiritual symbols. The architectural elements blend natural rock formations with human craftsmanship, creating spaces perfectly suited for meditation and spiritual contemplation amidst the hill\'s serene environment.';

  @override
  String get TapovanCavesLocationInfo1 =>
      'Tapovan Caves are located 10 kilometers from Deoghar in Jharkhand state, Eastern India. The site is nestled in the hills surrounding the holy city of Deoghar, which is famous for the Baidyanath Temple, one of the twelve Jyotirlingas.';

  @override
  String get TapovanCavesLocationInfo2 =>
      'The caves are situated on a hill that can be reached by a 30-minute trek from the base, making them a popular destination for both pilgrims seeking spiritual solace and adventure enthusiasts. The location offers panoramic views of the surrounding landscape and maintains its ancient atmosphere of tranquility.';

  @override
  String get TapovanCaves1200bce =>
      'Treta Yuga: According to Hindu tradition, Lord Rama, Sita, and Lakshmana stayed in these caves during their 14-year exile, establishing the site\'s initial sacred significance.';

  @override
  String get TapovanCaves106bce =>
      'Ancient Period: Sage Valmiki arrives at Tapovan to perform penance for his past deeds, later composing portions of the Ramayana while meditating in these caves.';

  @override
  String get TapovanCaves551ce =>
      'Medieval Period: The caves continue to attract saints and ascetics, with various spiritual masters using the site for intense meditation and tapas (spiritual austerities).';

  @override
  String get TapovanCaves1812ce =>
      '19th Century: Saint Balananda Brahmachari performs intense tapas for more than 50 years at Tapovan, achieving spiritual siddhis (supernatural powers) through his dedication.';

  @override
  String get TapovanCaves1958ce =>
      'Modern Era: Sri Balananda Brahmachari and other spiritual masters establish the site\'s reputation as a powerful center for achieving spiritual enlightenment and divine realization.';

  @override
  String get TapovanCaves1989ce =>
      'Contemporary Period: The site becomes recognized as an important pilgrimage destination, attracting devotees from across India while maintaining its pristine spiritual atmosphere.';

  @override
  String get TapovanCavesCollectible1Title => 'Sacred Rudraksha Beads';

  @override
  String get TapovanCavesCollectible1Icon => 'jewelry';

  @override
  String get TapovanCavesCollectible2Title => 'Shiva Lingam Stone';

  @override
  String get TapovanCavesCollectible2Icon => 'statue';

  @override
  String get TapovanCavesCollectible3Title => 'Palm Leaf Sanskrit Manuscript';

  @override
  String get TapovanCavesCollectible3Icon => 'picture';

  @override
  String get HargaddiChokahatuTitle => 'Tagore Hill';

  @override
  String get HargaddiChokahatuSubTitle => 'Morabadi Hill of Literary Heritage';

  @override
  String get HargaddiChokahatuRegionTitle => 'Ranchi, Jharkhand';

  @override
  String get HargaddiChokahatuArtifactCulture => 'Bengali Literary';

  @override
  String get HargaddiChokahatuArtifactGeolocation => 'Eastern India';

  @override
  String get HargaddiChokahatuPullQuote1Top => 'Where Nature\'s Beauty Inspired';

  @override
  String get HargaddiChokahatuPullQuote1Bottom => 'The Tagore Family\'s Literary Spirit';

  @override
  String get HargaddiChokahatuPullQuote2 =>
      'The serene hilltop became a sanctuary where literary genius found solace amidst nature\'s grandeur, creating a lasting bond between art and landscape.';

  @override
  String get HargaddiChokahatuPullQuote2Author => 'Literary Heritage';

  @override
  String get HargaddiChokahatuCallout1 =>
      'Standing 300 meters (900 feet) high and located just 4 kilometers from Albert Ekka Chowk, this scenic hilltop offers breathtaking sunrise and sunset views that captivated the Tagore family.';

  @override
  String get HargaddiChokahatuCallout2 =>
      'The hill houses the historic Shanti Dham residence and Brahma Sthal monument built by Jyotirindranath Tagore, along with the Ramakrishna Mission Ashram and educational institutions that continue the legacy of learning.';

  @override
  String get HargaddiChokahatuVideoCaption => 'Tagore Hill: Literary Heritage and Natural Beauty in Ranchi, Jharkhand';

  @override
  String get HargaddiChokahatuMapCaption => 'Map showing location of Tagore Hill in Morabadi area, Ranchi, Jharkhand';

  @override
  String get HargaddiChokahatuHistoryInfo1 =>
      'Tagore Hill, also known as Morabadi Hill, gained historical significance when Jyotirindranath and Satyendranath Tagore first visited Ranchi in 1898, captivated by the natural beauty of the region. Jyotirindranath Tagore visited again in 1908 and was so enamored by the captivating beauty of Morabadi Hill that he set up his camp home on the hillock.';

  @override
  String get HargaddiChokahatuHistoryInfo2 =>
      'After the death of his wife Kadambari Devi,rindranath Tagore settled here in 1912, building a house named Shanti Dham and a monument named Brahma Sthal. He lived here until his death in 1925, making the hill a place of literary pilgrimage and cultural heritage.';

  @override
  String get HargaddiChokahatuConstructionInfo1 =>
      'The hill features the historic Shanti Dham house built by Jyotirindranath Tagore as his residence, designed to harmonize with the natural landscape. The architecture reflects the Bengali style adapted to the local climate and terrain, creating spaces for contemplation and creative work.';

  @override
  String get HargaddiChokahatuConstructionInfo2 =>
      'The Brahma Sthal monument stands as a spiritual focal point on the hilltop, representing the philosophical and religious inclinations of the Tagore family. The site also houses the Ramakrishna Mission Ashram and educational institutions including the Centre of Divyayan and Agrarian Vocational Institute, continuing the tradition of learning and spiritual development.';

  @override
  String get HargaddiChokahatuLocationInfo1 =>
      'Tagore Hill is situated in Morabadi, Ranchi, Jharkhand, standing approximately 300 meters high (900 feet) and located 4 kilometers from Albert Ekka Chowk. The scenic locality of Morabadi offers spectacular views of sunrise and sunset from the hilltop.';

  @override
  String get HargaddiChokahatuLocationInfo2 =>
      'The hill serves as both a historical landmark and a popular tourist destination, attracting nature lovers, literature enthusiasts, and those seeking peaceful retreats. The destination is popular among adventure lovers for activities like rock climbing, while also serving as inspiration for creative works.';

  @override
  String get HargaddiChokahatu2575bce =>
      '1898 CE: Jyotirindranath and Satyendranath Tagore first visit Ranchi and discover the natural beauty of Morabadi Hill, beginning the Tagore family\'s connection with the region.';

  @override
  String get HargaddiChokahatu2465bce =>
      '1908 CE: Jyotirindranath Tagore returns to the hill and establishes his camp home, deeply moved by the captivating beauty and tranquil environment of the hilltop location.';

  @override
  String get HargaddiChokahatu443bce =>
      '1912 CE: Following the death of his wife Kadambari Devi, Jyotirindranath Tagore permanently settles on the hill, constructing Shanti Dham residence and Brahma Sthal monument.';

  @override
  String get HargaddiChokahatu1925ce =>
      '1925 CE: Jyotirindranath Tagore passes away on the hill, leaving behind a legacy of literary and spiritual heritage that transforms the location into a place of cultural pilgrimage.';

  @override
  String get HargaddiChokahatu1979ce =>
      'Mid-20th Century: The Ramakrishna Mission Ashram is established on the hill, continuing the tradition of spiritual learning and community service initiated by the Tagore family.';

  @override
  String get HargaddiChokahatu1990ce =>
      'Contemporary Period: Tagore Hill becomes a recognized tourist destination managed by Jharkhand Tourism, attracting visitors interested in literary heritage, natural beauty, and spiritual retreats.';

  @override
  String get HargaddiChokahatuCollectible1Title => 'Tagore Family Manuscript';

  @override
  String get HargaddiChokahatuCollectible1Icon => 'scroll';

  @override
  String get HargaddiChokahatuCollectible2Title => 'Brahma Sthal Stone Carving';

  @override
  String get HargaddiChokahatuCollectible2Icon => 'statue';

  @override
  String get HargaddiChokahatuCollectible3Title => 'Shanti Dham Architectural Element';

  @override
  String get HargaddiChokahatuCollectible3Icon => 'jewelry';

  @override
  String get DeogharTitle => 'Deoghar District';

  @override
  String get DeogharSubTitle => 'Land of the Gods';

  @override
  String get DeogharRegionTitle => 'Santhal Parganas Division, Jharkhand';

  @override
  String get DeogharArtifactCulture => 'Hindu Pilgrimage';

  @override
  String get DeogharArtifactGeolocation => 'Eastern India';

  @override
  String get DeogharPullQuote1Top => 'Not just a District,';

  @override
  String get DeogharPullQuote1Bottom => 'but a Sacred Pilgrimage.';

  @override
  String get DeogharPullQuote1Author => 'Devotees of Baba Baidyanath';

  @override
  String get DeogharPullQuote2 =>
      'For devotees, a pilgrimage to Baba Baidyanath Dham is a sacred journey of self-discovery and spiritual awakening.';

  @override
  String get DeogharPullQuote2Author => 'Incredible India';

  @override
  String get DeogharCallout1 =>
      'Deoghar is home to the Baidyanath Temple, one of the twelve sacred Jyotirlingas of Lord Shiva and one of the 51 Shakti Peethas in India.';

  @override
  String get DeogharCallout2 =>
      'The Shrawani Mela is the longest religious fair in the world, attracting countless devotees who undertake a rigorous 100 km pilgrimage on foot.';

  @override
  String get DeogharVideoCaption => 'Deoghar District: Sacred Pilgrimage and Cultural Heritage of Jharkhand';

  @override
  String get DeogharMapCaption => 'Map showing location of Deoghar District in Santhal Parganas Division, Jharkhand.';

  @override
  String get DeogharHistoryInfo1 =>
      'Deoghar, meaning \'Abode of Gods\', is the main city of Deoghar District in the Santhal Parganas division of Jharkhand state. The district is renowned for the ancient Baidyanath Temple, which according to legend was built after Lord Shiva appeared to cure the demon king Ravana, earning the name \'Baidyanath\' meaning \'Doctor of Doctors\'.';

  @override
  String get DeogharHistoryInfo2 =>
      'The district has deep historical and mythological significance, with the Baidyanath Temple complex comprising the central shrine along with 21 additional temples. The region has been a major pilgrimage center for centuries, attracting devotees from across India who believe that visiting this sacred site provides spiritual liberation and fulfills their wishes.';

  @override
  String get DeogharConstructionInfo1 =>
      'The Baidyanath Temple was constructed in the mid-16th century by Puran Mal, an ancestor of Maharastra Giddhour. The temple complex showcases traditional Hindu temple architecture with intricate stone carvings and multiple shrines dedicated to various deities. The main temple stands 72 feet tall and follows classical North Indian temple architectural style.';

  @override
  String get DeogharConstructionInfo2 =>
      'The district covers an area of 2,479 square kilometers with diverse topography including high and low lands, hills, and fertile plains. The landscape consists of several clusters of rocky hills covered with forests, but also features long ridges and valleys. About 28% of the land is very fertile and suitable for cultivation.';

  @override
  String get DeogharLocationInfo1 =>
      'Deoghar district is located in the Santhal Parganas division of Jharkhand state, positioned at 24°49\'N latitude and 86°70\'E longitude. The district is well-connected by road, rail, and air, with Deoghar Airport providing connectivity to major cities like Delhi, Kolkata, and Patna.';

  @override
  String get DeogharLocationInfo2 =>
      'The district is strategically located in eastern Jharkhand and serves as the cultural capital of the state due to its religious and cultural significance. It borders several other districts and is easily accessible for the millions of pilgrims who visit annually, particularly during the monsoon season.';

  @override
  String get Deoghar1631ce =>
      'Ancient period: The region has been inhabited for centuries with rich tribal heritage and early Hindu settlements establishing the area\'s spiritual significance.';

  @override
  String get Deoghar1647ce =>
      'Medieval period: Construction of the main Baidyanath Temple complex is completed in the mid-16th century, establishing it as a major pilgrimage center.';

  @override
  String get Deoghar1658ce =>
      'The temple complex gains prominence as one of the twelve Jyotirlingas, attracting pilgrims from across the Indian subcontinent.';

  @override
  String get Deoghar1901ce =>
      'British colonial period: The region becomes part of the Santhal Parganas district, with administrative structures established for governance.';

  @override
  String get Deoghar1984ce =>
      'Modern infrastructure development begins with improved transportation and facilities for the growing number of pilgrims visiting the district.';

  @override
  String get Deoghar1998ce =>
      'Post-Jharkhand statehood: Deoghar becomes a separate district with enhanced administrative focus on pilgrimage tourism and cultural preservation.';

  @override
  String get DeogharCollectible1Title => 'Sacred Rudraksha Beads';

  @override
  String get DeogharCollectible1Icon => 'jewelry';

  @override
  String get DeogharCollectible2Title => 'Temple Architecture Model';

  @override
  String get DeogharCollectible2Icon => 'picture';

  @override
  String get DeogharCollectible3Title => 'Sanskrit Manuscript';

  @override
  String get DeogharCollectible3Icon => 'scroll';

  @override
  String get timelineEvent2900bce => 'First known use of papyrus by Egyptians';

  @override
  String get timelineEvent2700bce => 'The Old Kingdom begins in Egypt';

  @override
  String get timelineEvent2600bce => 'Emergence of Mayan culture in the Yucatán Peninsula';

  @override
  String get timelineEvent2560bce => 'King Khufu completes the Great Pyramid of Giza';

  @override
  String get timelineEvent2500bce => 'The mammoth goes extinct';

  @override
  String get timelineEvent2200bce => 'Completion of Stonehenge';

  @override
  String get timelineEvent2000bce => 'Domestication of the horse';

  @override
  String get timelineEvent1800bce => 'Alphabetic writing emerges';

  @override
  String get timelineEvent890bce => 'Homer writes the Iliad and the Odyssey';

  @override
  String get timelineEvent776bce => 'First recorded Ancient Olympic Games';

  @override
  String get timelineEvent753bce => 'Founding of Rome';

  @override
  String get timelineEvent447bce => 'Building of the Parthenon at Athens started';

  @override
  String get timelineEvent427bce => 'Birth of Greek Philosopher Plato';

  @override
  String get timelineEvent322bce => 'Death of Aristotle (61), the first genuine scientist';

  @override
  String get timelineEvent200bce => 'Paper is invented in the Han Dynasty';

  @override
  String get timelineEvent44bce => 'Death of Julius Caesar; beginning of the Roman Empire';

  @override
  String get timelineEvent4bce => 'Birth of Jesus Christ';

  @override
  String get timelineEvent43ce => 'The Roman Empire enters Great Britain for the first time';

  @override
  String get timelineEvent79ce => 'Destruction of Pompeii by the volcano Vesuvius';

  @override
  String get timelineEvent455ce => 'End of the Roman Empire';

  @override
  String get timelineEvent500ce => 'Tikal becomes the first great Maya city';

  @override
  String get timelineEvent632ce => 'Death of Muhammad (61), founder of Islam';

  @override
  String get timelineEvent793ce => 'The Vikings first invade Britain';

  @override
  String get timelineEvent800ce => 'Gunpowder is invented in China';

  @override
  String get timelineEvent1001ce => 'Leif Erikson settles during the winter in present-day eastern Canada';

  @override
  String get timelineEvent1077ce => 'The Construction of the Tower of London begins';

  @override
  String get timelineEvent1117ce => 'The University of Oxford is founded';

  @override
  String get timelineEvent1199ce => 'Europeans first use compasses';

  @override
  String get timelineEvent1227ce => 'Death of Genghis Khan (65)';

  @override
  String get timelineEvent1337ce => 'The Hundred Years\' War begins as England and France struggle for dominance.';

  @override
  String get timelineEvent1347ce =>
      'The first of many concurrences of the Black Death plague, believed to have wiped out as many as 50% of Europe\'s population by its end';

  @override
  String get timelineEvent1428ce => 'Birth of the Aztec Empire in Mexico';

  @override
  String get timelineEvent1439ce => 'Johannes Gutenberg invents the printing press';

  @override
  String get timelineEvent1492ce => 'Christopher Columbus reaches the New World';

  @override
  String get timelineEvent1760ce => 'The industrial revolution begins';

  @override
  String get timelineEvent1763ce => 'Development of the Watt steam engine';

  @override
  String get timelineEvent1783ce => 'End of the American War of Independence from the British Empire';

  @override
  String get timelineEvent1789ce => 'The French Revolution begins';

  @override
  String get timelineEvent1914ce => 'World War I';

  @override
  String get timelineEvent1929ce => 'Black Tuesday signals the beginning of the Great Depression';

  @override
  String get timelineEvent1939ce => 'World War II';

  @override
  String get timelineEvent1957ce => 'launch of Sputnik 1 by the Soviet Union';

  @override
  String get timelineEvent1969ce => 'Apollo 11 mission lands on the moon';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String privacyStatement(Object privacyUrl) {
    return 'As explained in our $privacyUrl we do not collect any personal information.';
  }

  @override
  String get pageNotFoundBackButton => 'Back to civilization';

  @override
  String get pageNotFoundMessage => 'The page you are looking for does not exist.';

  @override
  String get chatAssistantName => 'Wonderous AI Assistant';

  @override
  String get chatAssistantStatus => 'Online';

  @override
  String get chatDefaultMessage =>
      'Thank you for your message! I\'m here to help you explore the wonders of the world.';

  @override
  String get chatStartConversation => 'Start a conversation...';

  @override
  String get chatTypeMessage => 'Type a message...';

  @override
  String get chatWelcomeMessage =>
      'Hello! I\'m your AI assistant powered by Google Gemini. How can I help you explore the wonders of the world today?';

  @override
  String get chatImageReady => 'Image ready to send';

  @override
  String get chatImageUploaded => 'Image uploaded';

  @override
  String get chatPermissionRequired => 'Permission is required to pick images';

  @override
  String get chatErrorPickingImage => 'Error picking image';

  @override
  String get chatErrorProcessingImage => 'Error processing image';

  @override
  String get chatErrorProcessingRequest => 'Sorry, there was an error processing your request';

  @override
  String get chatNoResponse => 'I\'m not sure how to respond to that.';

  @override
  String get chatTypingMessage => 'Type your message...';

  @override
  String get speechPermissionRequired => 'Microphone permission is required for voice input';

  @override
  String get speechLanguageSelector => 'Language';

  @override
  String get speechLanguageSelectorTitle => 'Select Language';

  @override
  String get speechCancel => 'Cancel';

  @override
  String get speechListening => 'Listening';

  @override
  String get speechPaused => 'Paused';

  @override
  String get speechStopped => 'Stopped';

  @override
  String get speechProcessing => 'Processing...';

  @override
  String get speechSayingSomething => 'Say something';

  @override
  String get speechDoubleTapLanguage => 'Double tap to change language';

  @override
  String get speechLongPressToTalk => 'Long press to talk';

  @override
  String get loginWelcomeBack => 'Welcome Back!';

  @override
  String get loginCreateAccount => 'Create Account';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginConfirmPasswordLabel => 'Confirm Password';

  @override
  String get loginSignInButton => 'Sign In';

  @override
  String get loginSignUpButton => 'Sign Up';

  @override
  String get loginOrDivider => 'or';

  @override
  String get loginGoogleButton => 'Continue with Google';

  @override
  String get loginSwitchToSignUp => 'Don\'t have an account? Sign up';

  @override
  String get loginSwitchToSignIn => 'Already have an account? Sign in';

  @override
  String get loginForgotPassword => 'Forgot Password?';

  @override
  String get loginLogout => 'Logout';

  @override
  String get loginLoggingIn => 'Logging in...';

  @override
  String get loginSigningUp => 'Signing up...';

  @override
  String get loginErrorInvalidEmail => 'Please enter a valid email address';

  @override
  String get loginErrorWeakPassword => 'Password should be at least 6 characters';

  @override
  String get loginErrorPasswordMismatch => 'Passwords do not match';

  @override
  String get loginErrorGeneric => 'An error occurred. Please try again.';

  @override
  String get loginSuccessWelcome => 'Welcome to Wonderous!';

  @override
  String get loginFullNameLabel => 'Full Name';

  @override
  String get loginPhoneLabel => 'Enter Phone';

  @override
  String get loginUserRoleLabel => 'Select User Role';

  @override
  String get loginRoleCustomer => 'Customer';

  @override
  String get loginRoleGuide => 'Guide';

  @override
  String get loginRoleMerchant => 'Merchant';

  @override
  String get loginRoleAdmin => 'Admin';
}
