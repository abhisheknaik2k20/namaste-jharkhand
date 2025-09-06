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
  String get bottomScrubberSemanticTimeline =>
      'Timeline Scrubber, drag horizontally to navigate the timeline.';

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
  String get collectionPopupResetConfirm =>
      'Are you sure you want to reset your collection?';

  @override
  String get eightWaySemanticSwipeDetector => 'eight-way swipe detector';

  @override
  String get expandingTimeSelectorSemanticSelector => 'time range selector';

  @override
  String get fullscreenImageViewerSemanticFull =>
      'full screen image, no description available';

  @override
  String get homeMenuButtonExplore => 'Explore the timeline';

  @override
  String get homeMenuButtonView => 'View your collection';

  @override
  String get homeMenuButtonAbout => 'About this app';

  @override
  String get homeMenuAboutWonderous =>
      'Wonderous is a visual showcase of eight wonders of the world. ';

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
  String get introDescriptionNavigate =>
      'Navigate the land of forests, waterfalls, and vibrant tribal heritage.';

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
  String get chichenItzaTitle => 'Jagannath Temple';

  @override
  String get chichenItzaSubTitle => 'Lord of the Universe';

  @override
  String get chichenItzaRegionTitle => 'Puri, Odisha';

  @override
  String get chichenItzaArtifactCulture => 'Hindu';

  @override
  String get chichenItzaArtifactGeolocation => 'Eastern India';

  @override
  String get chichenItzaPullQuote1Top => 'The Divine Connection Between';

  @override
  String get chichenItzaPullQuote1Bottom => 'Earth and the Sacred Realm';

  @override
  String get chichenItzaPullQuote2 =>
      'The Jagannath Temple represents the eternal bond between devotion and divinity, where millions find spiritual solace and divine blessings.';

  @override
  String get chichenItzaPullQuote2Author => 'Devotional Scripture';

  @override
  String get chichenItzaCallout1 =>
      'The temple exhibits the magnificent Kalinga architectural style, featuring a towering spire that dominates the skyline of Puri and serves as a beacon for pilgrims.';

  @override
  String get chichenItzaCallout2 =>
      'The temple complex covers a substantial area and houses the famous wooden deities of Lord Jagannath, Balabhadra, and Subhadra on the jeweled throne (Ratna Simhasana).';

  @override
  String get chichenItzaVideoCaption =>
      'Jagannath Temple: Sacred Journey and Divine Architecture of Puri';

  @override
  String get chichenItzaMapCaption =>
      'Map showing location of Jagannath Temple in Puri, Odisha, on the eastern coast of India.';

  @override
  String get chichenItzaHistoryInfo1 =>
      'The Jagannath Temple is a Hindu temple dedicated to Lord Jagannath, a form of Vishnu, located in Puri, Odisha. The present temple was constructed in the 12th century by King Anantavarman Chodaganga Deva of the Eastern Ganga dynasty. According to temple records, the original temple was built by the legendary King Indradyumna of Avanti.';

  @override
  String get chichenItzaHistoryInfo2 =>
      'The temple is one of the four sacred Char Dham pilgrimage sites in Hinduism, along with Dwarka, Badrinath, and Rameswaram. It has been a major center of Vaishnavism for over a thousand years and attracts millions of devotees annually, especially during the world-famous Rath Yatra festival.';

  @override
  String get chichenItzaConstructionInfo1 =>
      'The temple showcases the classic Kalinga architectural style with its towering spire (vimana) built in the Nagara style Rekha deula and the assembly hall (jagamohana) in Pidha deula style. The main structure stands on a raised platform in the center of an inner courtyard and features intricate stone carvings.';

  @override
  String get chichenItzaConstructionInfo2 =>
      'The temple complex includes the main shrine housing the wooden deities on the Ratna Simhasana (jeweled throne), along with multiple smaller temples and structures. The famous wooden idols of Jagannath, Balabhadra, and Subhadra are unique in their abstract, stylized forms and are renewed in a sacred ceremony called Nabakalebara.';

  @override
  String get chichenItzaLocationInfo1 =>
      'The Jagannath Temple is located in Puri, a coastal city in Odisha state on India\'s eastern seaboard. The temple sits near the Bay of Bengal, making it easily accessible to pilgrims from across India and beyond.';

  @override
  String get chichenItzaLocationInfo2 =>
      'Puri is well-connected by road, rail, and air, with the temple serving as the spiritual and cultural heart of the city. The annual Rath Yatra procession moves through the Grand Road (Bada Danda) to the Gundicha Temple, covering a distance that becomes a sacred pathway for millions of devotees.';

  @override
  String get chichenItza600ce =>
      'Ancient period: Early establishment of Jagannath worship in the region, with roots in tribal and Vedic traditions.';

  @override
  String get chichenItza832ce =>
      'Medieval period: Development of organized temple worship and construction of earlier temple structures on the site.';

  @override
  String get chichenItza998ce =>
      'Continued expansion and establishment of the temple as a major pilgrimage center in eastern India.';

  @override
  String get chichenItza1100ce =>
      '12th century: Construction of the present temple structure begins under King Anantavarman Chodaganga Deva.';

  @override
  String get chichenItza1527ce =>
      'Mughal period: Temple faces challenges but maintains its religious significance and devotional practices.';

  @override
  String get chichenItza1535ce =>
      '1558 CE: First recorded Rath Yatra festival begins, establishing the annual chariot procession tradition that continues today.';

  @override
  String get chichenItzaCollectible1Title => 'Sacred Tulsi Beads';

  @override
  String get chichenItzaCollectible1Icon => 'jewelry';

  @override
  String get chichenItzaCollectible2Title => 'Temple Bell Ornament';

  @override
  String get chichenItzaCollectible2Icon => 'jewelry';

  @override
  String get chichenItzaCollectible3Title => 'Pattachitra Painting';

  @override
  String get chichenItzaCollectible3Icon => 'picture';

  @override
  String get christRedeemerTitle => 'Betla National Park';

  @override
  String get christRedeemerSubTitle => 'Wildlife Sanctuary and Tiger Reserve';

  @override
  String get christRedeemerRegionTitle => 'Latehar District, Jharkhand';

  @override
  String get christRedeemerArtifactGeolocation => 'Eastern India';

  @override
  String get christRedeemerPullQuote1Top => 'A Perfect Union Between';

  @override
  String get christRedeemerPullQuote1Bottom => 'Wildlife and Conservation';

  @override
  String get christRedeemerPullQuote2 =>
      'Stepping into Betla is like entering a different realm where majestic predators like tigers, leopards, wolves, and wild dogs roam.';

  @override
  String get christRedeemerPullQuote2Author => 'Wildlife Guide';

  @override
  String get christRedeemerCallout1 =>
      'Betla is an acronym for Bison, Elephant, Tiger, Leopard, and Axis-axis, representing the diverse wildlife found in the park.';

  @override
  String get christRedeemerCallout2 =>
      'It was one of the first nine tiger reserves created in India under Project Tiger in 1973, and declared a national park in 1986, spreading over 226.32 square kilometers.';

  @override
  String get christRedeemerVideoCaption =>
      'Betla National Park: Wildlife Safari and Conservation in Jharkhand';

  @override
  String get christRedeemerMapCaption =>
      'Map showing location of Betla National Park in Latehar and Palamu districts, Jharkhand.';

  @override
  String get christRedeemerHistoryInfo1 =>
      'Betla National Park was originally established as Palamau Wildlife Sanctuary and later became part of the Palamau Tiger Reserve when Project Tiger was launched in 1973. The region has been inhabited for centuries by indigenous tribes like the Oraon and Munda, who have coexisted with the wildlife.';

  @override
  String get christRedeemerHistoryInfo2 =>
      'The park gained prominence as one of the first nine tiger reserves in India under Project Tiger initiative. It has the distinction of being the first sanctuary in the world where certain tiger conservation milestones were achieved. The area was upgraded from a wildlife sanctuary to a national park status in 1986.';

  @override
  String get christRedeemerConstructionInfo1 =>
      'The park is located on the Chota Nagpur Plateau with an average elevation of about 1000 feet. It falls within the Indo-Malayan biogeographic realm and boasts remarkable diversity of flora and fauna across its varied terrain of forests, hills, valleys, and grasslands.';

  @override
  String get christRedeemerConstructionInfo2 =>
      'Infrastructure within the park includes watch towers, ground hides for wildlife viewing, safari routes for jeeps and elephant rides, and visitor facilities. The park is designed to provide multiple opportunities for wildlife observation while maintaining conservation protocols.';

  @override
  String get christRedeemerLocationInfo1 =>
      'Betla National Park is located in the Latehar and Palamu districts of Jharkhand, approximately 170 kilometers from Ranchi. It is situated in the Chota Nagpur Plateau region, surrounded by lush green forests, hills, valleys, and waterfalls.';

  @override
  String get christRedeemerLocationInfo2 =>
      'The park forms the core area of the larger Palamau Tiger Reserve, which covers a total area of 1,129.93 square kilometers. The location provides a natural habitat for diverse wildlife in the heart of Jharkhand\'s tribal belt.';

  @override
  String get christRedeemer1850ce =>
      'Indigenous tribes like Oraon and Munda have inhabited the region for centuries, living in harmony with the diverse wildlife of the area.';

  @override
  String get christRedeemer1921ce =>
      'Early wildlife surveys and documentation of the region\'s biodiversity begin, recognizing the area\'s potential for conservation.';

  @override
  String get christRedeemer1922ce =>
      'The region gains attention from colonial forest administration for its rich wildlife and forest resources.';

  @override
  String get christRedeemer1926ce =>
      'Systematic wildlife management and protection measures begin to be implemented in the region.';

  @override
  String get christRedeemer1931ce =>
      'The area is formally recognized as requiring special protection due to its unique ecosystem and wildlife population.';

  @override
  String get christRedeemer2006ce =>
      'Continued conservation efforts and modernization of park facilities, including improved safari infrastructure and visitor amenities.';

  @override
  String get christRedeemerCollectible1Title => 'Tiger Pugmark Cast';

  @override
  String get christRedeemerCollectible1Icon => 'statue';

  @override
  String get christRedeemerCollectible2Title => 'Medicinal Plant Collection';

  @override
  String get christRedeemerCollectible2Icon => 'jewelry';

  @override
  String get christRedeemerCollectible3Title => 'Tribal Handicrafts';

  @override
  String get christRedeemerCollectible3Icon => 'textile';

  @override
  String get colosseumTitle => 'Colosseum';

  @override
  String get colosseumSubTitle => 'The icon of Rome';

  @override
  String get colosseumRegionTitle => 'Rome, Italy';

  @override
  String get colosseumArtifactCulture => 'Roman';

  @override
  String get colosseumArtifactGeolocation => 'Roman Empire';

  @override
  String get colosseumPullQuote1Top => 'Still the Largest Standing';

  @override
  String get colosseumPullQuote1Bottom => 'Amphitheater in the World Today';

  @override
  String get colosseumPullQuote2 =>
      'When falls the Coliseum, Rome shall fall; And when Rome falls - the World.';

  @override
  String get colosseumPullQuote2Author => 'Lord Byron';

  @override
  String get colosseumCallout1 =>
      'It was used for gladiatorial contests and public spectacles including animal hunts, executions, reenactments of famous battles, and dramas based on Roman mythology, and mock sea battles.';

  @override
  String get colosseumCallout2 =>
      'It is the largest ancient amphitheater ever built, and is still the largest standing amphitheater in the world today, despite its age.';

  @override
  String get colosseumVideoCaption =>
      '“Ancient Rome 101 | National Geographic.” Youtube, uploaded by National Geographic.';

  @override
  String get colosseumMapCaption =>
      'Map showing location of Colosseum in Rome, Italy,';

  @override
  String get colosseumHistoryInfo1 =>
      'The Colosseum is an oval amphitheater in the center of the city of Rome, Italy. Unlike Roman theaters that were built into hillsides, the Colosseum is an entirely free-standing structure.';

  @override
  String get colosseumHistoryInfo2 =>
      'The building ceased to be used for entertainment in the early medieval era. By the late 6th century a small chapel had been built into the structure of the amphitheater, and the arena was converted into a cemetery. \nThe numerous vaulted spaces in the arcades under the seating were converted into housing and workshops, and are recorded as still being rented out as late as the 12th century.';

  @override
  String get colosseumConstructionInfo1 =>
      'Construction began under the emperor Vespasian (r. 69-79 CE) in 72 and was completed in 80 CE under his successor and heir, Titus (r. 79-81). Further modifications were made during the reign of Domitian (r. 81-96).\nThe Colosseum is built of travertine limestone, tuff (volcanic rock), and brick-faced concrete. The outer wall is estimated to have required over 3.5 million cubic feet of travertine stone which were set without mortar; they were held together by 300 tons of iron clamps.';

  @override
  String get colosseumConstructionInfo2 =>
      'It could hold an estimated 50,000 to 80,000 spectators at various points in its history, having an average audience of some 65,000.';

  @override
  String get colosseumLocationInfo1 =>
      'Following the Great Fire of Rome in 64 CE, Emperor Nero seized much of the destroyed area to build his grandiose Domus Aurea (\"Golden House\"). A severe embarrassment to Nero\'s successors, parts of this extravagant palace and grounds, encompassing 1 sq mile, were filled with earth and built over.';

  @override
  String get colosseumLocationInfo2 =>
      'On the site of the lake, in the middle of the palace grounds, Emperor Vespasian would build the Colosseum as part of a Roman resurgence.';

  @override
  String get colosseum70ce =>
      'Colosseum construction was started during the Vespasian reign overtop what used to be a private lake for the previous four emperors. This was done in an attempt to revitalize Rome from their tyrannical reign.';

  @override
  String get colosseum82ce =>
      'The uppermost floor was built, and the structure was officially completed by Domitian.';

  @override
  String get colosseum1140ce =>
      'The arena was repurposed as a fortress for the Frangipane and Annibaldi families. It was also at one point used as a church.';

  @override
  String get colosseum1490ce =>
      'Pope Alexander VI permitted the site to be used as a quarry, for both storing and salvaging building materials.';

  @override
  String get colosseum1829ce =>
      'Preservation of the colosseum officially began, after more than a millennia of dilapidation and vandalism. Pope Pius VIII was notably devoted to this project.';

  @override
  String get colosseum1990ce =>
      'A restoration project was undertaken to ensure the colosseum remained a major tourist attraction for Rome. It currently stands as one of the greatest sources of tourism revenue in Italy.';

  @override
  String get colosseumCollectible1Title => 'Glass hexagonal amphoriskos';

  @override
  String get colosseumCollectible1Icon => 'vase';

  @override
  String get colosseumCollectible2Title =>
      'Bronze plaque of Mithras slaying the bull';

  @override
  String get colosseumCollectible2Icon => 'statue';

  @override
  String get colosseumCollectible3Title => 'Interno del Colosseo';

  @override
  String get colosseumCollectible3Icon => 'picture';

  @override
  String get greatWallTitle => 'Patratu Valley';

  @override
  String get greatWallSubTitle => 'Industrial Heritage & Natural Beauty';

  @override
  String get greatWallRegionTitle => 'Ramgarh District, Jharkhand';

  @override
  String get greatWallArtifactCulture =>
      'Scenic Valley with Thermal Power Heritage ';

  @override
  String get greatWallArtifactGeolocation => 'Eastern India';

  @override
  String get greatWallPullQuote1Top => 'A Perfect Blend of';

  @override
  String get greatWallPullQuote1Bottom => 'Nature and Industry';

  @override
  String get greatWallPullQuote2 =>
      'The journey from Ranchi is an adventure in itself with twisting ways providing you an unmatched scenery.';

  @override
  String get greatWallPullQuote2Author => 'MakeMyTrip Travel Guide';

  @override
  String get greatWallCallout1 =>
      'The Patratu Thermal Power Station was built with Russian collaboration in 1962 and has a power generation capacity of 840MW.';

  @override
  String get greatWallCallout2 =>
      'The Patratu Dam was constructed on the Nalkari River with a total storage capacity of 81 square miles to supply water to the thermal power station.';

  @override
  String get greatWallVideoCaption =>
      'Patratu Valley: Where Industry Meets Nature in Jharkhand\'s Beautiful Landscape';

  @override
  String get greatWallMapCaption =>
      'Map showing location of Patratu Valley in Ramgarh District, Jharkhand, about one hour from Ranchi.';

  @override
  String get greatWallHistoryInfo1 =>
      'Patratu Valley is located in Ramgarh district of Jharkhand state in eastern India. The area developed as a residential town for employees of the Patratu Thermal Power Station, which was established through Russian collaboration in 1962. The valley is known for its lush green terrains and the dam built upon the Nalkari River.';

  @override
  String get greatWallHistoryInfo2 =>
      'The thermal power station has four chimneys - two built by a Russian firm (called the Russian side) and two by an Indian firm (the Indian side). The dam serves as the main water reservoir for the power plant and has become a popular tourist destination, particularly during winter months when large numbers of visitors come for picnics.';

  @override
  String get greatWallConstructionInfo1 =>
      'The Patratu Dam was constructed in 1962 on the Nalkari River, located 30 km west of Ramgarh. Water from the river and from waterfalls of the surrounding hills is stored in this dam. The construction was specifically designed to supply water to the Patratu Thermal Power Station\'s operations.';

  @override
  String get greatWallConstructionInfo2 =>
      'The thermal power plant construction involved both Russian and Indian engineering expertise. The facility includes residential areas for employees and supporting infrastructure. A circuit house was built beside the dam, and the area features temples including the Panchawahini temple adjacent to the dam.';

  @override
  String get greatWallLocationInfo1 =>
      'Patratu Valley lies in the Ramgarh district of Jharkhand, accessible via a scenic hour-long drive from Ranchi. The valley features twisting roads with hairpin bends that provide spectacular views, especially when seen from above. The location offers panoramic views of the surrounding hills and the expansive dam.';

  @override
  String get greatWallLocationInfo2 =>
      'The valley serves multiple purposes beyond power generation - it has become a significant tourist destination offering boat rides, picnic spots, and temple visits. The area includes the Maa Panchwahini Mandir and Mata Rani Mandir temples, and provides access to local eateries serving traditional Jharkhandi cuisine.';

  @override
  String get greatWall700bce =>
      '1962 CE: The foundation of modern Patratu was laid with the establishment of the thermal power station through Russian collaboration, marking the beginning of the area\'s transformation from a rural valley to an industrial township.';

  @override
  String get greatWall214bce =>
      '1962 CE: Construction of the Patratu Dam was completed on the Nalkari River, creating an 81 square mile water reservoir to supply the newly built thermal power station, fundamentally changing the landscape of the valley.';

  @override
  String get greatWall121bce =>
      '1970s CE: Development of residential areas for power plant employees led to the growth of Patratu as a planned township, with infrastructure including housing, schools, and community facilities being established over a 20-year period.';

  @override
  String get greatWall556ce =>
      '1980s-1990s CE: The area began gaining recognition as a tourist destination, with the Jharkhand Tourism Department developing facilities including the tourist complex at Patratu Lake and promoting it as a scenic getaway from urban centers.';

  @override
  String get greatWall618ce =>
      '2000s CE: Patratu Valley saw increased tourism development with improved road access and facilities, though the thermal power station faced periods of reduced operation and maintenance challenges in later decades.';

  @override
  String get greatWall1487ce =>
      '2020s CE: Modern tourism initiatives by the Jharkhand government have focused on developing the waterfront and making the valley more attractive to visitors, while plans for expanding power generation capacity continue to be considered.';

  @override
  String get greatWallCollectible1Title => 'Patratu Dam Waters';

  @override
  String get greatWallCollectible1Icon => 'water';

  @override
  String get greatWallCollectible2Title => 'Thermal Power Station Model';

  @override
  String get greatWallCollectible2Icon => 'industry';

  @override
  String get greatWallCollectible3Title => 'Panchawahini Temple Offering';

  @override
  String get greatWallCollectible3Icon => 'temple';

  @override
  String get machuPicchuTitle => 'Hundru Falls';

  @override
  String get machuPicchuSubTitle => 'Jharkhand\'s Highest Waterfall';

  @override
  String get machuPicchuRegionTitle => 'Ranchi District, Jharkhand';

  @override
  String get machuPicchuArtifactCulture => 'Natural Wonder';

  @override
  String get machuPicchuArtifactGeolocation => 'Eastern India';

  @override
  String get machuPicchuPullQuote1Top => 'A Spectacular Scene of Water';

  @override
  String get machuPicchuPullQuote1Bottom => 'Falling from Great Height';

  @override
  String get machuPicchuPullQuote1Author => 'Government of Jharkhand';

  @override
  String get machuPicchuPullQuote2 =>
      'The cascading water creates a misty ambience and forms a frothy pool at the base, which is an exhilarating sight for visitors.';

  @override
  String get machuPicchuPullQuote2Author => 'Travel Guide';

  @override
  String get machuPicchuCallout1 =>
      'The waterfall falls from a height of 98 metres (322 feet), making it one of the highest waterfalls in Jharkhand state and the 34th highest waterfall in India.';

  @override
  String get machuPicchuCallout2 =>
      'The different formations of rock due to water erosion create various shapes and niches, lending an almost otherworldly feel to the landscape.';

  @override
  String get machuPicchuVideoCaption =>
      'Hundru Falls: Nature\'s Spectacular Display in Jharkhand';

  @override
  String get machuPicchuMapCaption =>
      'Map showing location of Hundru Falls on the Subarnarekha River in Ranchi District, Jharkhand.';

  @override
  String get machuPicchuHistoryInfo1 =>
      'Hundru Falls is a natural waterfall located in Ranchi district of Jharkhand state in eastern India. The waterfall is formed by the Subarnarekha River, which originates near Piska/Nagri and flows through several districts before joining the Bay of Bengal.';

  @override
  String get machuPicchuHistoryInfo2 =>
      'The waterfall represents a geological feature called a knickpoint, caused by rejuvenation. This break in the river\'s gradient allows water to fall vertically, creating the spectacular waterfall that has become one of Jharkhand\'s most popular tourist destinations.';

  @override
  String get machuPicchuConstructionInfo1 =>
      'The waterfall is a natural geological formation created by the erosion patterns of the Subarnarekha River over thousands of years. The rocky terrain around the falls has been shaped by continuous water flow, creating unique rock formations and natural pools.';

  @override
  String get machuPicchuConstructionInfo2 =>
      'The base of the waterfall features a natural pool that serves as both a scenic attraction and a popular bathing spot for visitors. The surrounding landscape is characterized by lush forests and rocky terrain that provides natural beauty and biodiversity.';

  @override
  String get machuPicchuLocationInfo1 =>
      'Hundru Falls is situated in the Ranchi district of Jharkhand, approximately 45 kilometers from Ranchi city. The waterfall is easily accessible by road and is located in the village of Hundru, making it a popular destination for day trips and picnics.';

  @override
  String get machuPicchuLocationInfo2 =>
      'The surrounding area is characterized by dense forests and rocky terrain. The Subarnarekha River continues its journey from here through multiple states including Jharkhand, West Bengal, and Odisha before ultimately reaching the Bay of Bengal at Talsari.';

  @override
  String get machuPicchu1438ce =>
      'Natural formation of the waterfall begins through geological processes and river erosion over millennia.';

  @override
  String get machuPicchu1572ce =>
      'Local tribal communities and residents of the region have known about the waterfall for generations, using it as a water source and gathering place.';

  @override
  String get machuPicchu1867ce =>
      'The waterfall begins to gain recognition beyond local communities as transportation and communication improve in the region.';

  @override
  String get machuPicchu1911ce =>
      'Post-independence development of Jharkhand region brings increased awareness of natural attractions like Hundru Falls.';

  @override
  String get machuPicchu1964ce =>
      'Tourism infrastructure begins to develop around the waterfall, making it more accessible to visitors from other regions.';

  @override
  String get machuPicchu1997ce =>
      'Hundru Falls becomes established as one of Jharkhand\'s premier tourist destinations, attracting nature lovers and adventure seekers from across India.';

  @override
  String get machuPicchuCollectible1Title => 'River Stone Collection';

  @override
  String get machuPicchuCollectible1Icon => 'stone';

  @override
  String get machuPicchuCollectible2Title => 'Forest Flora Sample';

  @override
  String get machuPicchuCollectible2Icon => 'leaf';

  @override
  String get machuPicchuCollectible3Title => 'Water Crystal Formation';

  @override
  String get machuPicchuCollectible3Icon => 'crystal';

  @override
  String get petraTitle => 'Petra';

  @override
  String get petraSubTitle => 'The Lost City';

  @override
  String get petraRegionTitle => 'Ma’an, Jordan';

  @override
  String get petraArtifactCulture => 'Nabataean';

  @override
  String get petraArtifactGeolocation => 'Levant';

  @override
  String get petraPullQuote1Top => 'A Rose-Red City';

  @override
  String get petraPullQuote1Bottom => 'Half as Old as Time';

  @override
  String get petraPullQuote1Author => 'John William Burgon';

  @override
  String get petraPullQuote2 =>
      'Petra is a brilliant display of man’s artistry in turning barren rock into a majestic wonder.';

  @override
  String get petraPullQuote2Author => 'Edward Dawson';

  @override
  String get petraCallout1 =>
      'They were particularly skillful in harvesting rainwater, agriculture and stone carving.';

  @override
  String get petraCallout2 =>
      'Perhaps a more prominent resemblance to Hellenistic style in Petra comes with its Treasury.';

  @override
  String get petraVideoCaption =>
      '“Stunning Stone Monuments of Petra | National Geographic.” Youtube, uploaded by National Geographic.';

  @override
  String get petraMapCaption =>
      'Map showing location of Petra in Ma’an Governorate, Jordan.';

  @override
  String get petraHistoryInfo1 =>
      'The area around Petra has been inhabited from as early as 7000  BCE, and the Nabataeans might have settled in what would become the capital city of their kingdom as early as the 4th century BCE.\nThe trading business gained the Nabataeans considerable revenue and Petra became the focus of their wealth. The Nabataeans were accustomed to living in the barren deserts, unlike their enemies, and were able to repel attacks by taking advantage of the area\'s mountainous terrain.';

  @override
  String get petraHistoryInfo2 =>
      'Petra flourished in the 1st century CE, when its famous Al-Khazneh structure - believed to be the mausoleum of Nabataean king Aretas IV - was constructed, and its population peaked at an estimated 20,000 inhabitants.\nAccess to the city is through a 3/4 mile-long (1.2 km) gorge called the Siq, which leads directly to the Khazneh.';

  @override
  String get petraConstructionInfo1 =>
      'Famous for its rock-cut architecture and water conduit system, Petra is also called the \"Red Rose City\" because of the color of the stone from which it is carved.\nAnother thing Petra is known for is its Hellenistic (“Greek”) architecture. These influences can be seen in many of the facades at Petra and are a reflection of the cultures that the Nabataens traded with.';

  @override
  String get petraConstructionInfo2 =>
      'The facade of the Treasury features a broken pediment with a central tholos (“dome”) inside, and two obelisks appear to form into the rock of Petra at the top. Near the bottom of the Treasury we see twin Greek Gods: Pollux, Castor, and Dioscuri, who protect travelers on their journeys. \nNear the top of the Treasury, two victories are seen standing on each side of a female figure on the tholos. This female figure is believed to be the Isis-Tyche, Isis being the Egyptian Goddess and Tyche being the Greek Goddess of good fortune.';

  @override
  String get petraLocationInfo1 =>
      'Petra is located in southern Jordan. It is adjacent to the mountain of Jabal Al-Madbah, in a basin surrounded by mountains forming the eastern flank of the Arabah valley running from the Dead Sea to the Gulf of Aqaba.';

  @override
  String get petraLocationInfo2 =>
      'The area around Petra has been inhabited from as early as 7000 BC, and the Nabataeans might have settled in what would become the capital city of their kingdom as early as the 4th century BC.\nArchaeological work has only discovered evidence of Nabataean presence dating back to the second century BC, by which time Petra had become their capital. The Nabataeans were nomadic Arabs who invested in Petra\'s proximity to the incense trade routes by establishing it as a major regional trading hub.';

  @override
  String get petra1200bce =>
      'First Edomites occupied the area and established a foothold.';

  @override
  String get petra106bce => 'Became part of the Roman province Arabia';

  @override
  String get petra551ce =>
      'After being damaged by earthquakes, habitation of the city all but ceased.';

  @override
  String get petra1812ce =>
      'Rediscovered by the Swiss traveler Johann Ludwig Burckhardt.';

  @override
  String get petra1958ce =>
      'Excavations led on the site by the British School of Archaeology and the American Center of Oriental Research.';

  @override
  String get petra1989ce =>
      'Appeared in the film Indiana Jones and The Last Crusade.';

  @override
  String get petraCollectible1Title => 'Camel and riders';

  @override
  String get petraCollectible1Icon => 'statue';

  @override
  String get petraCollectible2Title => 'Vessel';

  @override
  String get petraCollectible2Icon => 'vase';

  @override
  String get petraCollectible3Title => 'Open bowl';

  @override
  String get petraCollectible3Icon => 'vase';

  @override
  String get pyramidsGizaTitle => 'Pyramids of Giza';

  @override
  String get pyramidsGizaSubTitle => 'The ancient wonder';

  @override
  String get pyramidsGizaRegionTitle => 'Cairo, Egypt';

  @override
  String get pyramidsGizaArtifactCulture => 'Egyptian';

  @override
  String get pyramidsGizaArtifactGeolocation => 'Egypt';

  @override
  String get pyramidsGizaPullQuote1Top => 'The Tallest Structures on Earth';

  @override
  String get pyramidsGizaPullQuote1Bottom =>
      'Until the Advent of Modern Skyscrapers';

  @override
  String get pyramidsGizaPullQuote2 =>
      'From the heights of these pyramids, forty centuries look down on us.';

  @override
  String get pyramidsGizaPullQuote2Author => 'Napoleon Bonaparte';

  @override
  String get pyramidsGizaCallout1 =>
      'It is theorized the pyramid not only served as a tomb for the pharaoh, but also as a storage pit for various items he would need in the afterlife.';

  @override
  String get pyramidsGizaCallout2 =>
      'The Great Pyramid consists of an estimated 2.3 million blocks. Approximately 5.5 million tonnes of limestone, 8,000 tonnes of granite, and 500,000 tonnes of mortar were used in the construction.';

  @override
  String get pyramidsGizaVideoCaption =>
      '“The Great Pyramids of Giza | Egypt’s Ancient Mysteries | National Geographic UK.” Youtube, uploaded by National Geographic UK.';

  @override
  String get pyramidsGizaMapCaption =>
      'Map showing location of Giza Pyramids in Greater Cairo, Egypt.';

  @override
  String get pyramidsGizaHistoryInfo1 =>
      'The Giza pyramid complex, also called the Giza necropolis, is the site on the Giza Plateau in Greater Cairo, Egypt that includes the Great Pyramid of Giza, the Pyramid of Khafre, and the Pyramid of Menkaure, along with their associated pyramid complexes and the Great Sphinx of Giza. All were built during the Fourth Dynasty of the Old Kingdom of Ancient Egypt, between 2600 and 2500 BCE.';

  @override
  String get pyramidsGizaHistoryInfo2 =>
      'The pyramids of Giza and others are thought to have been constructed to house the remains of the deceased pharaohs who ruled over Ancient Egypt. A portion of the pharaoh\'s spirit called his ka was believed to remain with his corpse. Proper care of the remains was necessary in order for the former Pharaoh to perform his new duties as king of the dead.';

  @override
  String get pyramidsGizaConstructionInfo1 =>
      'Most construction theories are based on the idea that the pyramids were built by moving huge stones from a quarry and dragging and lifting them into place. In building the pyramids, the architects might have developed their techniques over time.\nThey would select a site on a relatively flat area of bedrock — not sand — which provided a stable foundation. After carefully surveying the site and laying down the first level of stones, they constructed the pyramids in horizontal levels, one on top of the other.';

  @override
  String get pyramidsGizaConstructionInfo2 =>
      'For the Great Pyramid, most of the stone for the interior seems to have been quarried immediately to the south of the construction site. The smooth exterior of the pyramid was made of a fine grade of white limestone that was quarried across the Nile.\nTo ensure that the pyramid remained symmetrical, the exterior casing stones all had to be equal in height and width. Workers might have marked all the blocks to indicate the angle of the pyramid wall and trimmed the surfaces carefully so that the blocks fit together. During construction, the outer surface of the stone was smooth limestone; excess stone has eroded as time has passed.';

  @override
  String get pyramidsGizaLocationInfo1 =>
      'The site is at the edges of the Western Desert, approximately 5.6 miles (9 km) west of the Nile River in the city of Giza, and about 8 miles (13 km) southwest of the city center of Cairo.';

  @override
  String get pyramidsGizaLocationInfo2 =>
      'Currently, the pyramids are located in the northwestern side of the Western Desert, and it is considered to be one of the best recognizable and the most visited tourist attractions of the planet.';

  @override
  String get pyramidsGiza2575bce =>
      'Construction of the 3 pyramids began for three kings of the 4th dynasty; Khufu, Khafre, and Menkaure.';

  @override
  String get pyramidsGiza2465bce =>
      'Construction began on the smaller surrounding structures called Mastabas for royalty of the 5th and 6th dynasties.';

  @override
  String get pyramidsGiza443bce =>
      'Greek Author Herodotus speculated that the pyramids were built in the span of 20 years with over 100,000 slave labourers. This assumption would last for over 1500 years';

  @override
  String get pyramidsGiza1925ce =>
      'Tomb of Queen Hetepheres was discovered, containing furniture and jewelry. One of the last remaining treasure-filled tombs after many years of looting and plundering.';

  @override
  String get pyramidsGiza1979ce =>
      'Designated a UNESCO World Heritage Site to prevent any more unauthorized plundering and vandalism.';

  @override
  String get pyramidsGiza1990ce =>
      'Discovery of labouror’s districts suggest that the workers building the pyramids were not slaves, and an ingenious building method proved a relatively small work-force was required to build such immense structures.';

  @override
  String get pyramidsGizaCollectible1Title => 'Two papyrus fragments';

  @override
  String get pyramidsGizaCollectible1Icon => 'scroll';

  @override
  String get pyramidsGizaCollectible2Title => 'Fragmentary Face of King Khafre';

  @override
  String get pyramidsGizaCollectible2Icon => 'statue';

  @override
  String get pyramidsGizaCollectible3Title => 'Jewelry Elements';

  @override
  String get pyramidsGizaCollectible3Icon => 'jewelry';

  @override
  String get tajMahalTitle => 'Deoghar District';

  @override
  String get tajMahalSubTitle => 'Land of the Gods';

  @override
  String get tajMahalRegionTitle => 'Santhal Parganas Division, Jharkhand';

  @override
  String get tajMahalArtifactCulture => 'Hindu Pilgrimage';

  @override
  String get tajMahalArtifactGeolocation => 'Eastern India';

  @override
  String get tajMahalPullQuote1Top => 'Not just a District,';

  @override
  String get tajMahalPullQuote1Bottom => 'but a Sacred Pilgrimage.';

  @override
  String get tajMahalPullQuote1Author => 'Devotees of Baba Baidyanath';

  @override
  String get tajMahalPullQuote2 =>
      'For devotees, a pilgrimage to Baba Baidyanath Dham is a sacred journey of self-discovery and spiritual awakening.';

  @override
  String get tajMahalPullQuote2Author => 'Incredible India';

  @override
  String get tajMahalCallout1 =>
      'Deoghar is home to the Baidyanath Temple, one of the twelve sacred Jyotirlingas of Lord Shiva and one of the 51 Shakti Peethas in India.';

  @override
  String get tajMahalCallout2 =>
      'The Shrawani Mela is the longest religious fair in the world, attracting countless devotees who undertake a rigorous 100 km pilgrimage on foot.';

  @override
  String get tajMahalVideoCaption =>
      'Deoghar District: Sacred Pilgrimage and Cultural Heritage of Jharkhand';

  @override
  String get tajMahalMapCaption =>
      'Map showing location of Deoghar District in Santhal Parganas Division, Jharkhand.';

  @override
  String get tajMahalHistoryInfo1 =>
      'Deoghar, meaning \'Abode of Gods\', is the main city of Deoghar District in the Santhal Parganas division of Jharkhand state. The district is renowned for the ancient Baidyanath Temple, which according to legend was built after Lord Shiva appeared to cure the demon king Ravana, earning the name \'Baidyanath\' meaning \'Doctor of Doctors\'.';

  @override
  String get tajMahalHistoryInfo2 =>
      'The district has deep historical and mythological significance, with the Baidyanath Temple complex comprising the central shrine along with 21 additional temples. The region has been a major pilgrimage center for centuries, attracting devotees from across India who believe that visiting this sacred site provides spiritual liberation and fulfills their wishes.';

  @override
  String get tajMahalConstructionInfo1 =>
      'The Baidyanath Temple was constructed in the mid-16th century by Puran Mal, an ancestor of Maharastra Giddhour. The temple complex showcases traditional Hindu temple architecture with intricate stone carvings and multiple shrines dedicated to various deities. The main temple stands 72 feet tall and follows classical North Indian temple architectural style.';

  @override
  String get tajMahalConstructionInfo2 =>
      'The district covers an area of 2,479 square kilometers with diverse topography including high and low lands, hills, and fertile plains. The landscape consists of several clusters of rocky hills covered with forests, but also features long ridges and valleys. About 28% of the land is very fertile and suitable for cultivation.';

  @override
  String get tajMahalLocationInfo1 =>
      'Deoghar district is located in the Santhal Parganas division of Jharkhand state, positioned at 24°49\'N latitude and 86°70\'E longitude. The district is well-connected by road, rail, and air, with Deoghar Airport providing connectivity to major cities like Delhi, Kolkata, and Patna.';

  @override
  String get tajMahalLocationInfo2 =>
      'The district is strategically located in eastern Jharkhand and serves as the cultural capital of the state due to its religious and cultural significance. It borders several other districts and is easily accessible for the millions of pilgrims who visit annually, particularly during the monsoon season.';

  @override
  String get tajMahal1631ce =>
      'Ancient period: The region has been inhabited for centuries with rich tribal heritage and early Hindu settlements establishing the area\'s spiritual significance.';

  @override
  String get tajMahal1647ce =>
      'Medieval period: Construction of the main Baidyanath Temple complex is completed in the mid-16th century, establishing it as a major pilgrimage center.';

  @override
  String get tajMahal1658ce =>
      'The temple complex gains prominence as one of the twelve Jyotirlingas, attracting pilgrims from across the Indian subcontinent.';

  @override
  String get tajMahal1901ce =>
      'British colonial period: The region becomes part of the Santhal Parganas district, with administrative structures established for governance.';

  @override
  String get tajMahal1984ce =>
      'Modern infrastructure development begins with improved transportation and facilities for the growing number of pilgrims visiting the district.';

  @override
  String get tajMahal1998ce =>
      'Post-Jharkhand statehood: Deoghar becomes a separate district with enhanced administrative focus on pilgrimage tourism and cultural preservation.';

  @override
  String get tajMahalCollectible1Title => 'Sacred Rudraksha Beads';

  @override
  String get tajMahalCollectible1Icon => 'jewelry';

  @override
  String get tajMahalCollectible2Title => 'Temple Architecture Model';

  @override
  String get tajMahalCollectible2Icon => 'picture';

  @override
  String get tajMahalCollectible3Title => 'Sanskrit Manuscript';

  @override
  String get tajMahalCollectible3Icon => 'scroll';

  @override
  String get timelineEvent2900bce => 'First known use of papyrus by Egyptians';

  @override
  String get timelineEvent2700bce => 'The Old Kingdom begins in Egypt';

  @override
  String get timelineEvent2600bce =>
      'Emergence of Mayan culture in the Yucatán Peninsula';

  @override
  String get timelineEvent2560bce =>
      'King Khufu completes the Great Pyramid of Giza';

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
  String get timelineEvent447bce =>
      'Building of the Parthenon at Athens started';

  @override
  String get timelineEvent427bce => 'Birth of Greek Philosopher Plato';

  @override
  String get timelineEvent322bce =>
      'Death of Aristotle (61), the first genuine scientist';

  @override
  String get timelineEvent200bce => 'Paper is invented in the Han Dynasty';

  @override
  String get timelineEvent44bce =>
      'Death of Julius Caesar; beginning of the Roman Empire';

  @override
  String get timelineEvent4bce => 'Birth of Jesus Christ';

  @override
  String get timelineEvent43ce =>
      'The Roman Empire enters Great Britain for the first time';

  @override
  String get timelineEvent79ce =>
      'Destruction of Pompeii by the volcano Vesuvius';

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
  String get timelineEvent1001ce =>
      'Leif Erikson settles during the winter in present-day eastern Canada';

  @override
  String get timelineEvent1077ce =>
      'The Construction of the Tower of London begins';

  @override
  String get timelineEvent1117ce => 'The University of Oxford is founded';

  @override
  String get timelineEvent1199ce => 'Europeans first use compasses';

  @override
  String get timelineEvent1227ce => 'Death of Genghis Khan (65)';

  @override
  String get timelineEvent1337ce =>
      'The Hundred Years\' War begins as England and France struggle for dominance.';

  @override
  String get timelineEvent1347ce =>
      'The first of many concurrences of the Black Death plague, believed to have wiped out as many as 50% of Europe\'s population by its end';

  @override
  String get timelineEvent1428ce => 'Birth of the Aztec Empire in Mexico';

  @override
  String get timelineEvent1439ce =>
      'Johannes Gutenberg invents the printing press';

  @override
  String get timelineEvent1492ce =>
      'Christopher Columbus reaches the New World';

  @override
  String get timelineEvent1760ce => 'The industrial revolution begins';

  @override
  String get timelineEvent1763ce => 'Development of the Watt steam engine';

  @override
  String get timelineEvent1783ce =>
      'End of the American War of Independence from the British Empire';

  @override
  String get timelineEvent1789ce => 'The French Revolution begins';

  @override
  String get timelineEvent1914ce => 'World War I';

  @override
  String get timelineEvent1929ce =>
      'Black Tuesday signals the beginning of the Great Depression';

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
  String get pageNotFoundMessage =>
      'The page you are looking for does not exist.';
}
