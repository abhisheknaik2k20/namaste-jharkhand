// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'वंडरस';

  @override
  String get localeSwapButton => 'English';

  @override
  String animatedArrowSemanticSwipe(Object title) {
    return '$title के बारे में विवरण एक्सप्लोर करें।';
  }

  @override
  String get appBarTitleFactsHistory => 'तथ्य और इतिहास';

  @override
  String get appBarTitleConstruction => 'निर्माण';

  @override
  String get appBarTitleLocation => 'स्थान की जानकारी';

  @override
  String get bottomScrubberSemanticScrubber => 'स्क्रबर';

  @override
  String get bottomScrubberSemanticTimeline =>
      'समयरेखा स्क्रबर, समयरेखा में नेविगेट करने के लिए क्षैतिज रूप से खींचें।';

  @override
  String collectionLabelDiscovered(Object percentage) {
    return '$percentage% मिला';
  }

  @override
  String collectionLabelCount(Object count, Object total) {
    return '$count में से $total';
  }

  @override
  String get collectionButtonReset => 'संग्रह रीसेट करें';

  @override
  String get eventsListButtonOpenGlobal => 'वैश्विक समयरेखा खोलें';

  @override
  String newlyDiscoveredSemanticNew(Object count, Object suffix) {
    return 'अन्वेषण के लिए $count नया आइटम$suffix। नए आइटम पर स्क्रोल करें';
  }

  @override
  String newlyDiscoveredLabelNew(Object count, Object suffix) {
    return 'अन्वेषण के लिए $count नया आइटम$suffix';
  }

  @override
  String get resultsPopupEnglishContent =>
      'यह सामग्री मेट्रोपॉलिटन म्यूज़ियम ऑफ़ आर्ट कलेक्शन API द्वारा प्रदान की गई है, और केवल अंग्रेज़ी में उपलब्ध है।';

  @override
  String get resultsSemanticDismiss => 'संदेश बंद करें';

  @override
  String get scrollingContentSemanticYoutube => 'यूट्यूब थंबनेल';

  @override
  String get scrollingContentSemanticOpen => 'फ़ुलस्क्रीन नक्शा दृश्य खोलें';

  @override
  String get searchInputTitleSuggestions => 'सुझाव';

  @override
  String get searchInputHintSearch => 'खोज (जैसे: प्रकार या सामग्री)';

  @override
  String get searchInputSemanticClear => 'खोज साफ़ करें';

  @override
  String timelineSemanticDate(Object fromDate, Object endDate) {
    return '$fromDate से $endDate';
  }

  @override
  String titleLabelDate(Object fromDate, Object endDate) {
    return '$fromDate से $endDate';
  }

  @override
  String get appModalsButtonOk => 'ठीक है';

  @override
  String get appModalsButtonCancel => 'रद्द करें';

  @override
  String get appPageDefaultTitlePage => 'पृष्ठ';

  @override
  String appPageSemanticSwipe(Object pageTitle, Object current, Object total) {
    return '$pageTitle $current में से $total.';
  }

  @override
  String semanticsPrevious(Object title) {
    return 'पिछला $title';
  }

  @override
  String semanticsNext(Object title) {
    return 'अगला $title';
  }

  @override
  String get artifactsTitleArtifacts => 'मार्केटप्लेस';

  @override
  String get artifactsSemanticsPrevious => 'पिछला मार्केटप्लेस';

  @override
  String get artifactsSemanticsNext => 'अगला मार्केटप्लेस';

  @override
  String get artifactsSemanticArtifact => 'मार्केटप्लेस';

  @override
  String get artifactsButtonBrowse => 'सभी मार्केटप्लेस ब्राउज़ करें';

  @override
  String get artifactDetailsLabelDate => 'तारीख';

  @override
  String get artifactDetailsLabelPeriod => 'काल';

  @override
  String get artifactDetailsLabelGeography => 'भौगोलिक क्षेत्र';

  @override
  String get artifactDetailsLabelMedium => 'माध्यम';

  @override
  String get artifactDetailsLabelDimension => 'आयाम';

  @override
  String get artifactDetailsLabelClassification => 'वर्गीकरण';

  @override
  String get artifactDetailsSemanticThumbnail => 'थंबनेल छवि';

  @override
  String artifactDetailsErrorNotFound(Object artifactId) {
    return 'मार्केटप्लेस $artifactId के लिए जानकारी नहीं मिली';
  }

  @override
  String get artifactsSearchTitleBrowse => 'मार्केटप्लेस ब्राउज़ करें';

  @override
  String get artifactsSearchLabelNotFound => 'कोई मार्केटप्लेस नहीं मिला';

  @override
  String get artifactsSearchButtonToggle => 'समय सीमा बदलें';

  @override
  String get artifactsSearchSemanticTimeframe => 'समय सीमा';

  @override
  String artifactsSearchLabelFound(Object numFound, Object numResults) {
    return '$numFound मार्केटप्लेस मिला, $numResults में';
  }

  @override
  String get artifactsSearchLabelAdjust => 'अपना';

  @override
  String get artifactsSearchLabelSearch => 'खोज शब्द';

  @override
  String get artifactsSearchLabelTimeframe => 'समय सीमा';

  @override
  String get circleButtonsSemanticClose => 'बंद करें';

  @override
  String get circleButtonsSemanticBack => 'वापस';

  @override
  String get collectibleFoundTitleArtifactDiscovered => 'कलाकृति मिली';

  @override
  String get collectibleFoundButtonViewCollection => 'मेरे संग्रह में देखें';

  @override
  String get collectibleItemSemanticCollectible => 'संग्रहणीय वस्तु';

  @override
  String get collectionTitleCollection => 'संग्रह';

  @override
  String get collectionPopupResetConfirm => 'क्या आप वाकई अपना संग्रह रीसेट करना चाहते हैं?';

  @override
  String get eightWaySemanticSwipeDetector => 'आठ-तरफ़ा स्वाइप डिटेक्टर';

  @override
  String get expandingTimeSelectorSemanticSelector => 'समय सीमा चयनकर्ता';

  @override
  String get fullscreenImageViewerSemanticFull => 'पूर्ण स्क्रीन छवि, कोई विवरण उपलब्ध नहीं';

  @override
  String get homeMenuButtonExplore => 'समयरेखा देखें';

  @override
  String get homeMenuButtonView => 'अपना संग्रह देखें';

  @override
  String get homeMenuButtonAbout => 'इस ऐप के बारे में';

  @override
  String get homeMenuAboutWonderous => 'वंडरस दुनिया के आठ आश्चर्यों का एक दृश्य प्रदर्शन है।';

  @override
  String homeMenuAboutBuilt(Object flutterUrl, Object gskinnerUrl) {
    return '$flutterUrl से बनाया गया, $gskinnerUrl की टीम द्वारा।';
  }

  @override
  String homeMenuAboutLearn(Object wonderousUrl) {
    return '$wonderousUrl पर और जानें।';
  }

  @override
  String homeMenuAboutSource(Object githubUrl) {
    return 'इस ऐप का सोर्स कोड देखने के लिए कृपया $githubUrl पर जाएं।';
  }

  @override
  String get homeMenuAboutRepo => 'वंडरस गिटहब रिपो';

  @override
  String get homeMenuAboutFlutter => 'फ़्लटर';

  @override
  String get homeMenuAboutGskinner => 'जीस्किनर';

  @override
  String get homeMenuAboutApp => 'wonderous.app';

  @override
  String homeMenuAboutPublic(Object metUrl) {
    return 'सार्वजनिक-डोमेन कलाकृतियाँ $metUrl से।';
  }

  @override
  String get homeMenuAboutMet => 'द मेट्रोपॉलिटन म्यूज़ियम ऑफ़ आर्ट, न्यूयॉर्क';

  @override
  String homeMenuAboutPhotography(Object unsplashUrl) {
    return 'फ़ोटोग्राफ़ी $unsplashUrl से।';
  }

  @override
  String get homeMenuAboutUnsplash => 'अनस्प्लैश';

  @override
  String get introTitleJourney => 'झारखंड की यात्रा';

  @override
  String get introDescriptionNavigate => 'जंगलों, झरनों और जीवंत जनजातीय धरोहर की भूमि में सफ़र करें।';

  @override
  String get introTitleExplore => 'स्थलों की खोज करें';

  @override
  String get introDescriptionUncover => 'झारखंड के प्राचीन मंदिरों, भव्य झरनों और छुपी गुफाओं की खोज करें।';

  @override
  String get introTitleDiscover => 'परंपराओं को जानें';

  @override
  String get introDescriptionLearn => 'झारखंड की विविध जनजातीय संस्कृति, त्यौहारों और अमर कला रूपों के बारे में जानें।';

  @override
  String get introSemanticNavigate => 'सफ़र करें';

  @override
  String get introSemanticSwipeLeft => 'आगे बढ़ने के लिए बाएँ स्वाइप करें';

  @override
  String get introSemanticEnterApp => 'ऐप में प्रवेश करें';

  @override
  String get introSemanticWonderous => 'वंडरस';

  @override
  String get labelledToggleSemanticToggle => 'टॉगल';

  @override
  String get photoGallerySemanticCollectible => 'संग्रहणीय!';

  @override
  String photoGallerySemanticFocus(Object photoIndex, Object photoTotal) {
    return 'फ़ोटो $photoIndex का $photoTotal। फ़ोकस करने के लिए टैप करें।';
  }

  @override
  String photoGallerySemanticFullscreen(Object photoIndex, Object photoTotal) {
    return 'फ़ोटो $photoIndex का $photoTotal। फुलस्क्रीन खोलने के लिए टैप करें।';
  }

  @override
  String get eraPrehistory => 'प्रागैतिहासिक काल';

  @override
  String get eraClassical => 'शास्त्रीय युग';

  @override
  String get eraEarlyModern => 'प्रारंभिक आधुनिक युग';

  @override
  String get eraModern => 'आधुनिक युग';

  @override
  String get yearBCE => 'ईसा पूर्व';

  @override
  String get yearCE => 'ईस्वी';

  @override
  String yearFormat(Object date, Object era) {
    return '$date $era';
  }

  @override
  String get year => 'वर्ष';

  @override
  String timelineLabelConstruction(Object title) {
    return '$title का निर्माण प्रारंभ होता है।';
  }

  @override
  String get timelineTitleGlobalTimeline => 'वैश्विक समयरेखा';

  @override
  String get wallpaperModalSave => 'क्या आप इस पोस्टर को अपनी फोटो गैलरी में सहेजना चाहते हैं?';

  @override
  String get wallpaperModalSaving => 'चित्र सहेजा जा रहा है। कृपया प्रतीक्षा करें...';

  @override
  String get wallpaperModalSaveComplete => 'सहेजना पूरा हुआ!';

  @override
  String get wallpaperSemanticSharePhoto => 'फ़ोटो साझा करें';

  @override
  String get wallpaperSemanticTakePhoto => 'फ़ोटो लें';

  @override
  String get wallpaperCheckboxShowTitle => 'शीर्षक दिखाएँ';

  @override
  String get wonderDetailsTabLabelInformation => 'जानकारी और इतिहास';

  @override
  String get wonderDetailsTabLabelImages => 'फ़ोटो गैलरी';

  @override
  String get wonderDetailsTabLabelArtifacts => 'कलाकृतियाँ';

  @override
  String get wonderDetailsTabLabelEvents => 'घटनाएँ';

  @override
  String get wonderDetailsTabSemanticBack => 'वंडर चयन पर वापस जाएँ';

  @override
  String get homeSemanticOpenMain => 'मुख्य मेन्यू खोलें';

  @override
  String get homeSemanticWonder => 'वंडर';

  @override
  String get JagannathTempleTitle => 'जगन्नाथ मंदिर';

  @override
  String get JagannathTempleSubTitle => 'सृष्टि के स्वामी';

  @override
  String get JagannathTempleRegionTitle => 'पुरी, ओडिशा';

  @override
  String get JagannathTempleArtifactCulture => 'हिंदू';

  @override
  String get JagannathTempleArtifactGeolocation => 'पूर्वी भारत';

  @override
  String get JagannathTemplePullQuote1Top => 'पृथ्वी और पवित्र लोक के बीच';

  @override
  String get JagannathTemplePullQuote1Bottom => 'दिव्य संबंध';

  @override
  String get JagannathTemplePullQuote2 =>
      'जगन्नाथ मंदिर भक्ति और दिव्यता के शाश्वत बंधन का प्रतीक है, जहाँ लाखों लोग आध्यात्मिक शांति और दिव्य आशीर्वाद प्राप्त करते हैं।';

  @override
  String get JagannathTemplePullQuote2Author => 'भक्ति शास्त्र';

  @override
  String get JagannathTempleCallout1 =>
      'मंदिर भव्य कलिंग वास्तुकला शैली को दर्शाता है, जिसमें ऊँचा शिखर पुरी के आकाश को छूता है और तीर्थयात्रियों के लिए एक प्रकाशस्तंभ का कार्य करता है।';

  @override
  String get JagannathTempleCallout2 =>
      'मंदिर परिसर विशाल क्षेत्र में फैला है और इसमें प्रसिद्ध लकड़ी की मूर्तियाँ भगवान जगन्नाथ, बलभद्र और सुभद्रा की रत्न सिंहासन (रत्न सिंहासन) पर प्रतिष्ठित हैं।';

  @override
  String get JagannathTempleVideoCaption => 'जगन्नाथ मंदिर: पुरी की पवित्र यात्रा और दिव्य वास्तुकला';

  @override
  String get JagannathTempleMapCaption => 'भारत के पूर्वी तट पर ओडिशा के पुरी में स्थित जगन्नाथ मंदिर का मानचित्र।';

  @override
  String get JagannathTempleHistoryInfo1 =>
      'जगन्नाथ मंदिर भगवान जगन्नाथ (विष्णु का एक रूप) को समर्पित एक हिंदू मंदिर है, जो पुरी, ओडिशा में स्थित है। वर्तमान मंदिर का निर्माण 12वीं शताब्दी में पूर्वी गंगा वंश के राजा अनंतवर्मन चोडगंग देव ने कराया था। मंदिर के अभिलेखों के अनुसार, मूल मंदिर का निर्माण अवंति के पौराणिक राजा इंद्रद्युम्न ने कराया था।';

  @override
  String get JagannathTempleHistoryInfo2 =>
      'मंदिर हिंदू धर्म के चार पवित्र धामों (चारधाम) में से एक है, अन्य हैं द्वारका, बद्रीनाथ और रामेश्वरम। यह सहस्राब्दियों से वैष्णव परंपरा का एक प्रमुख केंद्र रहा है और विशेषकर विश्वप्रसिद्ध रथ यात्रा उत्सव के दौरान हर वर्ष लाखों भक्तों को आकर्षित करता है।';

  @override
  String get JagannathTempleConstructionInfo1 =>
      'मंदिर पारंपरिक कलिंग वास्तुकला शैली का अद्भुत उदाहरण है, जिसमें नागर शैली के रेखा देउला में बना ऊँचा शिखर (विमान) और पीढ़ा देउला शैली में बना सभा मंडप (जगमोहन) शामिल है। मुख्य संरचना आंतरिक प्रांगण के मध्य ऊँचे मंच पर स्थित है और इसमें बारीक पत्थर की नक्काशी की गई है।';

  @override
  String get JagannathTempleConstructionInfo2 =>
      'मंदिर परिसर में मुख्य गर्भगृह है, जहाँ रत्न सिंहासन (रत्न सिंहासन) पर लकड़ी की मूर्तियाँ प्रतिष्ठित हैं। इसके साथ ही कई छोटे मंदिर और संरचनाएँ भी शामिल हैं। जगन्नाथ, बलभद्र और सुभद्रा की प्रसिद्ध लकड़ी की मूर्तियाँ अपनी अनोखी, प्रतीकात्मक और शैलीबद्ध रूपों के लिए जानी जाती हैं, जिन्हें पवित्र नवीकरण अनुष्ठान \'नवकलेबर\' में पुनः स्थापित किया जाता है।';

  @override
  String get JagannathTempleLocationInfo1 =>
      'जगन्नाथ मंदिर पुरी में स्थित है, जो भारत के पूर्वी समुद्रतट पर ओडिशा राज्य का एक तटीय शहर है। यह मंदिर बंगाल की खाड़ी के निकट स्थित है, जिससे यह भारत और विदेश से आने वाले तीर्थयात्रियों के लिए सुगम है।';

  @override
  String get JagannathTempleLocationInfo2 =>
      'पुरी सड़क, रेल और हवाई मार्ग से अच्छी तरह जुड़ा हुआ है, और मंदिर शहर का आध्यात्मिक और सांस्कृतिक हृदय है। वार्षिक रथ यात्रा उत्सव में रथ जुलूस \'बड़ा दंडा\' (ग्रैंड रोड) से गुंडीचा मंदिर तक जाता है, जो लाखों भक्तों के लिए एक पवित्र मार्ग बन जाता है।';

  @override
  String get JagannathTemple600ce =>
      'प्राचीन काल: क्षेत्र में जगन्नाथ उपासना की प्रारंभिक स्थापना, जिसकी जड़ें जनजातीय और वैदिक परंपराओं में थीं।';

  @override
  String get JagannathTemple832ce =>
      'मध्यकाल: संगठित मंदिर उपासना का विकास और स्थल पर प्राचीन मंदिर संरचनाओं का निर्माण।';

  @override
  String get JagannathTemple998ce =>
      'लगातार विस्तार और मंदिर को पूर्वी भारत में एक प्रमुख तीर्थ केंद्र के रूप में स्थापित करना।';

  @override
  String get JagannathTemple1100ce =>
      '12वीं शताब्दी: राजा अनंतवर्मन चोडगंग देव के शासनकाल में वर्तमान मंदिर का निर्माण प्रारंभ हुआ।';

  @override
  String get JagannathTemple1527ce =>
      'मुगल काल: मंदिर ने चुनौतियों का सामना किया, फिर भी अपनी धार्मिक महत्ता और भक्ति परंपराओं को बनाए रखा।';

  @override
  String get JagannathTemple1535ce =>
      '1558 ईस्वी: पहली दर्ज की गई रथ यात्रा प्रारंभ हुई, जिससे वार्षिक रथ उत्सव की परंपरा स्थापित हुई, जो आज भी जारी है।';

  @override
  String get JagannathTempleCollectible1Title => 'पवित्र तुलसी की माला';

  @override
  String get JagannathTempleCollectible1Icon => 'आभूषण';

  @override
  String get JagannathTempleCollectible2Title => 'मंदिर की घंटी का अलंकरण';

  @override
  String get JagannathTempleCollectible2Icon => 'आभूषण';

  @override
  String get JagannathTempleCollectible3Title => 'पट्टचित्र चित्रकला';

  @override
  String get JagannathTempleCollectible3Icon => 'चित्र';

  @override
  String get BetlaNationalParkTitle => 'बेतला राष्ट्रीय उद्यान';

  @override
  String get BetlaNationalParkSubTitle => 'वन्यजीव अभयारण्य और बाघ अभयारण्य';

  @override
  String get BetlaNationalParkRegionTitle => 'लातेहार जिला, झारखंड';

  @override
  String get BetlaNationalParkArtifactGeolocation => 'पूर्वी भारत';

  @override
  String get BetlaNationalParkPullQuote1Top => 'वन्यजीव और संरक्षण के बीच';

  @override
  String get BetlaNationalParkPullQuote1Bottom => 'एक आदर्श संगम';

  @override
  String get BetlaNationalParkPullQuote2 =>
      'बेतला में कदम रखना ऐसा है जैसे किसी और लोक में प्रवेश करना, जहाँ शेर, तेंदुए, भेड़िए और जंगली कुत्तों जैसे भव्य शिकारी घूमते हैं।';

  @override
  String get BetlaNationalParkPullQuote2Author => 'वन्यजीव गाइड';

  @override
  String get BetlaNationalParkCallout1 =>
      'बेतला का नाम बाइसन, हाथी, बाघ, तेंदुआ और अक्ष-अक्षिस (चित्तीदार हिरण) से बना है, जो पार्क में पाए जाने वाले विविध वन्यजीवों का प्रतिनिधित्व करता है।';

  @override
  String get BetlaNationalParkCallout2 =>
      'यह 1973 में प्रोजेक्ट टाइगर के तहत बनाए गए भारत के पहले नौ बाघ अभयारण्यों में से एक था और 1986 में इसे राष्ट्रीय उद्यान घोषित किया गया, जो 226.32 वर्ग किलोमीटर क्षेत्र में फैला है।';

  @override
  String get BetlaNationalParkVideoCaption => 'बेतला राष्ट्रीय उद्यान: झारखंड में वन्यजीव सफारी और संरक्षण';

  @override
  String get BetlaNationalParkMapCaption =>
      'लातेहार और पलामू जिलों, झारखंड में स्थित बेतला राष्ट्रीय उद्यान का मानचित्र।';

  @override
  String get BetlaNationalParkHistoryInfo1 =>
      'बेतला राष्ट्रीय उद्यान की शुरुआत पलामू वन्यजीव अभयारण्य के रूप में हुई थी और 1973 में प्रोजेक्ट टाइगर शुरू होने पर यह पलामू टाइगर रिजर्व का हिस्सा बन गया। यह क्षेत्र सदियों से उरांव और मुंडा जैसी जनजातियों का निवास स्थान रहा है, जिन्होंने वन्यजीवों के साथ सहअस्तित्व बनाए रखा।';

  @override
  String get BetlaNationalParkHistoryInfo2 =>
      'यह पार्क प्रोजेक्ट टाइगर पहल के तहत भारत के पहले नौ बाघ अभयारण्यों में से एक के रूप में प्रसिद्ध हुआ। यह विश्व का पहला ऐसा अभयारण्य है जहाँ कुछ महत्वपूर्ण बाघ संरक्षण उपलब्धियाँ हासिल की गईं। 1986 में इस क्षेत्र को वन्यजीव अभयारण्य से राष्ट्रीय उद्यान का दर्जा दिया गया।';

  @override
  String get BetlaNationalParkConstructionInfo1 =>
      'यह उद्यान छोटा नागपुर पठार पर लगभग 1000 फीट की औसत ऊँचाई पर स्थित है। यह इंडो-मलायन जैवभौगोलिक क्षेत्र का हिस्सा है और इसमें जंगलों, पहाड़ियों, घाटियों और घास के मैदानों की विविध भौगोलिक संरचना के बीच अद्भुत वनस्पति और जीव-जंतु पाए जाते हैं।';

  @override
  String get BetlaNationalParkConstructionInfo2 =>
      'पार्क के ढांचे में वॉच टावर, वन्यजीव देखने के लिए ग्राउंड हाइड्स, जीप और हाथी सफारी मार्ग, और आगंतुक सुविधाएँ शामिल हैं। पार्क का डिजाइन इस प्रकार है कि यह वन्यजीव अवलोकन के कई अवसर प्रदान करता है और साथ ही संरक्षण प्रोटोकॉल का पालन भी करता है।';

  @override
  String get BetlaNationalParkLocationInfo1 =>
      'बेतला राष्ट्रीय उद्यान झारखंड के लातेहार और पलामू जिलों में स्थित है, जो रांची से लगभग 170 किलोमीटर दूर है। यह छोटा नागपुर पठार क्षेत्र में बसा है और हरे-भरे जंगलों, पहाड़ियों, घाटियों और झरनों से घिरा हुआ है।';

  @override
  String get BetlaNationalParkLocationInfo2 =>
      'यह पार्क बड़े पलामू टाइगर रिजर्व का मुख्य क्षेत्र है, जो कुल 1,129.93 वर्ग किलोमीटर में फैला है। यह स्थान झारखंड की जनजातीय पट्टी के मध्य विविध वन्यजीवों के लिए प्राकृतिक आवास प्रदान करता है।';

  @override
  String get BetlaNationalPark1850ce =>
      'उरांव और मुंडा जैसी जनजातियाँ सदियों से इस क्षेत्र में बसी हुई हैं और यहाँ के विविध वन्यजीवों के साथ सामंजस्य में रहती आई हैं।';

  @override
  String get BetlaNationalPark1921ce =>
      'क्षेत्र की जैव विविधता के प्रारंभिक वन्यजीव सर्वेक्षण और दस्तावेजीकरण शुरू हुए, जिससे संरक्षण की संभावनाएँ पहचानी गईं।';

  @override
  String get BetlaNationalPark1922ce =>
      'क्षेत्र अपने समृद्ध वन्यजीव और वन संसाधनों के कारण औपनिवेशिक वन प्रशासन का ध्यान आकर्षित करने लगा।';

  @override
  String get BetlaNationalPark1926ce => 'क्षेत्र में व्यवस्थित वन्यजीव प्रबंधन और संरक्षण उपाय लागू होने लगे।';

  @override
  String get BetlaNationalPark1931ce =>
      'क्षेत्र को इसके अद्वितीय पारिस्थितिकी तंत्र और वन्यजीव जनसंख्या के कारण विशेष संरक्षण की आवश्यकता वाला क्षेत्र घोषित किया गया।';

  @override
  String get BetlaNationalPark2006ce =>
      'संरक्षण प्रयास जारी रहे और पार्क सुविधाओं का आधुनिकीकरण हुआ, जिसमें बेहतर सफारी ढाँचा और आगंतुक सुविधाएँ शामिल हैं।';

  @override
  String get BetlaNationalParkCollectible1Title => 'बाघ के पंजों की छाप (पगमार्क कास्ट)';

  @override
  String get BetlaNationalParkCollectible1Icon => 'प्रतिमा';

  @override
  String get BetlaNationalParkCollectible2Title => 'औषधीय पौधों का संग्रह';

  @override
  String get BetlaNationalParkCollectible2Icon => 'आभूषण';

  @override
  String get BetlaNationalParkCollectible3Title => 'जनजातीय हस्तशिल्प';

  @override
  String get BetlaNationalParkCollectible3Icon => 'वस्त्र';

  @override
  String get ParasnathHillTitle => 'पारसनाथ पर्वत';

  @override
  String get ParasnathHillSubTitle => 'सम्मेद शिखर';

  @override
  String get ParasnathHillRegionTitle => 'गिरिडीह, झारखंड';

  @override
  String get ParasnathHillArtifactCulture => 'जैन';

  @override
  String get ParasnathHillArtifactGeolocation => 'पूर्वी भारत';

  @override
  String get ParasnathHillPullQuote1Top => 'पवित्र शिखर जहाँ बीस';

  @override
  String get ParasnathHillPullQuote1Bottom => 'तीर्थंकरों ने मोक्ष प्राप्त किया';

  @override
  String get ParasnathHillPullQuote2 =>
      'सम्मेद शिखर वह परम आध्यात्मिक स्थल है जहाँ दिव्य आत्माओं ने ध्यान और सांसारिक बंधनों से विरक्ति द्वारा मुक्ति प्राप्त की।';

  @override
  String get ParasnathHillPullQuote2Author => 'जैन शास्त्र';

  @override
  String get ParasnathHillCallout1 =>
      'यह जैनों का सबसे पवित्र तीर्थ स्थल है, जहाँ 24 में से 20 तीर्थंकरों ने मोक्ष (निर्वाण) प्राप्त किया। इनमें 23वें तीर्थंकर भगवान पार्श्वनाथ भी शामिल हैं, जिन्होंने 772 ईसा पूर्व यहाँ मुक्ति पाई।';

  @override
  String get ParasnathHillCallout2 =>
      '1,370 मीटर (4,480 फीट) की ऊँचाई पर स्थित यह झारखंड की सबसे ऊँची चोटी है, जहाँ 32 प्राचीन मंदिर हैं जिनमें जैन धर्म की शिक्षाओं और पौराणिक कथाओं की अद्भुत शिल्पकला उकेरी गई है।';

  @override
  String get ParasnathHillVideoCaption => 'सम्मेद शिखर: पारसनाथ पर्वत पर जैन तीर्थ यात्रा की पवित्र यात्रा';

  @override
  String get ParasnathHillMapCaption => 'गिरिडीह जिला, झारखंड, पूर्वी भारत में स्थित पारसनाथ पर्वत का मानचित्र';

  @override
  String get ParasnathHillHistoryInfo1 =>
      'पारसनाथ पर्वत, जिसे सम्मेद शिखर (एकाग्रता का शिखर) भी कहा जाता है, एक प्राचीन जैन तीर्थ स्थल है। पुरातात्विक प्रमाण बताते हैं कि यहाँ जैन उपस्थिति कम से कम 1500 ईसा पूर्व से रही है। इसका सबसे प्राचीन साहित्यिक उल्लेख 6वीं शताब्दी ईसा पूर्व में संकलित \'ज्ञात्रधर्मकथा\' में मिलता है।';

  @override
  String get ParasnathHillHistoryInfo2 =>
      'इस स्थल का नाम भगवान पार्श्वनाथ से जुड़ा है, जो 23वें तीर्थंकर थे और जिन्होंने 772 ईसा पूर्व यहाँ मोक्ष प्राप्त किया। इतिहास भर में यह सबसे पवित्र जैन तीर्थ रहा है, जहाँ भक्त आध्यात्मिक मुक्ति और ज्ञान की खोज में आते रहे हैं।';

  @override
  String get ParasnathHillConstructionInfo1 =>
      'मंदिर परिसर मुख्यतः 18वीं शताब्दी में निर्मित भव्य जैन वास्तुकला का उदाहरण है, जिसमें पहाड़ी पर 32 मंदिर फैले हुए हैं। इनमें अद्भुत पत्थर की नक्काशी, मंदिर की दीवारों पर सुंदर भित्तिचित्र और बारीक मूर्तिकला जैन धार्मिक सिद्धांतों को दर्शाती है।';

  @override
  String get ParasnathHillConstructionInfo2 =>
      'मंदिरों में विशिष्ट मेहराबदार द्वार और विस्तृत दीवार नक्काशियाँ हैं, जो जैन आचार्यों की कहानियाँ सुनाती हैं। आधार पर मधुवन में आठ मुख्य मंदिर, दो दादावाड़ी (तीर्थयात्रा विश्राम स्थल) और भोमियाजी महाराज का मंदिर है, जो एक दिव्य स्थापत्य समूह बनाते हैं।';

  @override
  String get ParasnathHillLocationInfo1 =>
      'पारसनाथ पर्वत झारखंड राज्य के गिरिडीह जिले में स्थित है और 1,370 मीटर की ऊँचाई तक उठता है, जो राज्य का सबसे ऊँचा पर्वत है। यह ऐतिहासिक ग्रैंड ट्रंक रोड के एनएच-2 दिल्ली-कोलकाता मार्ग खंड पर स्थित है।';

  @override
  String get ParasnathHillLocationInfo2 =>
      'यह पर्वत पारसनाथ वन्यजीव अभयारण्य का हिस्सा है, जो प्राकृतिक पारिस्थितिकी तंत्र और पवित्र जैन धरोहर दोनों की रक्षा करता है। यह स्थल पूरे भारत और विदेश से आने वाले तीर्थयात्रियों के लिए सुलभ है और वैश्विक जैन धर्म का आध्यात्मिक केंद्र माना जाता है।';

  @override
  String get ParasnathHill70ce =>
      '1500 ईसा पूर्व: पुरातात्विक प्रमाण पारसनाथ पर्वत पर जैन उपस्थिति के शुरुआती संकेत देते हैं, जिससे यह जैन आध्यात्मिकता और ध्यान का प्राचीन केंद्र स्थापित होता है।';

  @override
  String get ParasnathHill82ce =>
      '772 ईसा पूर्व: भगवान पार्श्वनाथ, 23वें तीर्थंकर, पर्वत पर मोक्ष (निर्वाण) प्राप्त करते हैं, जिससे यह स्थल पवित्र नाम और सर्वोच्च धार्मिक महत्त्व प्राप्त करता है।';

  @override
  String get ParasnathHill1140ce =>
      '6वीं शताब्दी ईसा पूर्व: बारह मुख्य जैन आगमों में से एक \'ज्ञात्रधर्मकथा\' में शिखरजी का पवित्र तीर्थ के रूप में सबसे पुराना साहित्यिक उल्लेख मिलता है।';

  @override
  String get ParasnathHill1490ce =>
      '12वीं शताब्दी: ऐतिहासिक अभिलेख धार्मिक गतिविधियों और मंदिर रखरखाव की निरंतरता दर्शाते हैं, जिससे यह एक स्थापित तीर्थ केंद्र के रूप में प्रचलित रहा।';

  @override
  String get ParasnathHill1829ce =>
      '18वीं शताब्दी: प्रमुख मंदिर निर्माण काल आरंभ होता है, वर्तमान 32 मंदिरों का वास्तुशिल्प परिसर निर्मित होता है, जिसमें जैन स्थापत्य शैली और बारीक नक्काशियाँ दिखाई देती हैं।';

  @override
  String get ParasnathHill1990ce =>
      'आधुनिक काल: यह स्थल प्रतिवर्ष लाखों जैन तीर्थयात्रियों को आकर्षित करता है और एक संरक्षित वन्यजीव अभयारण्य के रूप में मान्यता प्राप्त करता है, जहाँ धार्मिक धरोहर और पर्यावरण संरक्षण का संतुलन साधा जाता है।';

  @override
  String get ParasnathHillCollectible1Title => 'जैन प्रार्थना माला';

  @override
  String get ParasnathHillCollectible1Icon => 'आभूषण';

  @override
  String get ParasnathHillCollectible2Title => 'तीर्थंकर की मूर्ति';

  @override
  String get ParasnathHillCollectible2Icon => 'प्रतिमा';

  @override
  String get ParasnathHillCollectible3Title => 'जैन पांडुलिपि (तालपत्र)';

  @override
  String get ParasnathHillCollectible3Icon => 'चित्र';

  @override
  String get PatratuValleyTitle => 'पतरातु घाटी';

  @override
  String get PatratuValleySubTitle => 'औद्योगिक धरोहर और प्राकृतिक सुंदरता';

  @override
  String get PatratuValleyRegionTitle => 'रामगढ़ जिला, झारखंड';

  @override
  String get PatratuValleyArtifactCulture => 'थर्मल पावर धरोहर वाली दर्शनीय घाटी';

  @override
  String get PatratuValleyArtifactGeolocation => 'पूर्वी भारत';

  @override
  String get PatratuValleyPullQuote1Top => 'प्रकृति और उद्योग का';

  @override
  String get PatratuValleyPullQuote1Bottom => 'सही संगम';

  @override
  String get PatratuValleyPullQuote2 =>
      'रांची से यहाँ तक की यात्रा स्वयं में एक रोमांच है, जहाँ घुमावदार रास्ते अनुपम दृश्यों की झलक प्रदान करते हैं।';

  @override
  String get PatratuValleyPullQuote2Author => 'मेक माय ट्रिप यात्रा गाइड';

  @override
  String get PatratuValleyCallout1 =>
      'पतरातु थर्मल पावर स्टेशन का निर्माण 1962 में रूसी सहयोग से हुआ था और इसकी बिजली उत्पादन क्षमता 840 मेगावाट है।';

  @override
  String get PatratuValleyCallout2 =>
      'नलकरी नदी पर पतरातु बाँध का निर्माण किया गया, जिसकी जल संग्रहण क्षमता 81 वर्ग मील है और जो थर्मल पावर स्टेशन को पानी उपलब्ध कराता है।';

  @override
  String get PatratuValleyVideoCaption => 'पतरातु घाटी: झारखंड के सुंदर परिदृश्य में उद्योग और प्रकृति का संगम';

  @override
  String get PatratuValleyMapCaption =>
      'रामगढ़ जिले में स्थित पतरातु घाटी का मानचित्र, जो रांची से लगभग एक घंटे की दूरी पर है।';

  @override
  String get PatratuValleyHistoryInfo1 =>
      'पतरातु घाटी झारखंड राज्य के रामगढ़ जिले में स्थित है। यह क्षेत्र 1962 में रूसी सहयोग से स्थापित पतरातु थर्मल पावर स्टेशन के कर्मचारियों के लिए आवासीय नगर के रूप में विकसित हुआ। घाटी अपने हरे-भरे परिदृश्य और नलकरी नदी पर बने बाँध के लिए प्रसिद्ध है।';

  @override
  String get PatratuValleyHistoryInfo2 =>
      'थर्मल पावर स्टेशन में चार चिमनियाँ हैं – दो रूसी कंपनी द्वारा निर्मित (रूसी भाग) और दो भारतीय कंपनी द्वारा निर्मित (भारतीय भाग)। बाँध पावर प्लांट के लिए मुख्य जलाशय के रूप में कार्य करता है और एक लोकप्रिय पर्यटन स्थल बन चुका है, खासकर सर्दियों में जब यहाँ बड़ी संख्या में लोग पिकनिक मनाने आते हैं।';

  @override
  String get PatratuValleyConstructionInfo1 =>
      'पतरातु बाँध का निर्माण 1962 में नलकरी नदी पर किया गया, जो रामगढ़ से 30 किमी पश्चिम में स्थित है। नदी और आसपास की पहाड़ियों से आने वाले झरनों का पानी इस बाँध में संग्रहित किया जाता है। इसका निर्माण विशेष रूप से थर्मल पावर स्टेशन को पानी उपलब्ध कराने के लिए किया गया था।';

  @override
  String get PatratuValleyConstructionInfo2 =>
      'थर्मल पावर प्लांट के निर्माण में रूसी और भारतीय इंजीनियरिंग दोनों का योगदान रहा। यहाँ कर्मचारियों के लिए आवासीय क्षेत्र और सहायक ढाँचे बनाए गए। बाँध के पास एक सर्किट हाउस का निर्माण हुआ और क्षेत्र में पंचवाहिनी मंदिर सहित कई मंदिर भी स्थित हैं।';

  @override
  String get PatratuValleyLocationInfo1 =>
      'पतरातु घाटी झारखंड के रामगढ़ जिले में स्थित है और रांची से एक घंटे की सुंदर ड्राइव द्वारा पहुँचा जा सकता है। घाटी के घुमावदार रास्ते और हेयरपिन मोड़ ऊपर से देखने पर मनमोहक दृश्य प्रदान करते हैं। यहाँ से आसपास की पहाड़ियों और विस्तृत बाँध का विहंगम दृश्य मिलता है।';

  @override
  String get PatratuValleyLocationInfo2 =>
      'यह घाटी केवल बिजली उत्पादन का केंद्र ही नहीं बल्कि एक प्रमुख पर्यटन स्थल भी है। यहाँ नौका विहार, पिकनिक स्थलों और मंदिरों की सुविधा है। क्षेत्र में माँ पंचवाहिनी मंदिर और माता रानी मंदिर शामिल हैं और स्थानीय भोजनालय पारंपरिक झारखंडी व्यंजन परोसते हैं।';

  @override
  String get PatratuValley700bce =>
      '1962 ई.: रूसी सहयोग से थर्मल पावर स्टेशन की स्थापना के साथ आधुनिक पतरातु की नींव पड़ी। इससे यह ग्रामीण घाटी एक औद्योगिक नगर में परिवर्तित होने लगी।';

  @override
  String get PatratuValley214bce =>
      '1962 ई.: नलकरी नदी पर पतरातु बाँध का निर्माण हुआ, जिसने 81 वर्ग मील का जलाशय बनाया। इससे थर्मल पावर स्टेशन को पानी की आपूर्ति सुनिश्चित हुई और घाटी का स्वरूप बदल गया।';

  @override
  String get PatratuValley121bce =>
      '1970 का दशक: पावर प्लांट कर्मचारियों के लिए आवासीय क्षेत्र विकसित होने लगे, जिससे पतरातु एक नियोजित नगर के रूप में विकसित हुआ। इसमें आवास, विद्यालय और सामुदायिक सुविधाएँ भी स्थापित की गईं।';

  @override
  String get PatratuValley556ce =>
      '1980-1990 का दशक: यह क्षेत्र पर्यटन स्थल के रूप में प्रसिद्ध होने लगा। झारखंड पर्यटन विभाग ने पतरातु झील पर पर्यटक परिसर सहित कई सुविधाएँ विकसित कीं और इसे शहरी जीवन से दूर एक आकर्षक स्थल के रूप में प्रचारित किया।';

  @override
  String get PatratuValley618ce =>
      '2000 का दशक: बेहतर सड़क मार्ग और सुविधाओं के कारण यहाँ पर्यटन में वृद्धि हुई, हालाँकि बाद के दशकों में थर्मल पावर स्टेशन को रखरखाव की चुनौतियों का सामना करना पड़ा।';

  @override
  String get PatratuValley1487ce =>
      '2020 का दशक: झारखंड सरकार ने आधुनिक पर्यटन योजनाओं के तहत घाटी के तटवर्ती क्षेत्र को विकसित किया और इसे अधिक आकर्षक बनाने का प्रयास किया। साथ ही, बिजली उत्पादन क्षमता बढ़ाने की योजनाएँ भी विचाराधीन हैं।';

  @override
  String get PatratuValleyCollectible1Title => 'पतरातु बाँध का जल';

  @override
  String get PatratuValleyCollectible1Icon => 'जल';

  @override
  String get PatratuValleyCollectible2Title => 'थर्मल पावर स्टेशन मॉडल';

  @override
  String get PatratuValleyCollectible2Icon => 'उद्योग';

  @override
  String get PatratuValleyCollectible3Title => 'पंचवाहिनी मंदिर प्रसाद';

  @override
  String get PatratuValleyCollectible3Icon => 'मंदिर';

  @override
  String get hundruFallsTitle => 'हुंडरू जलप्रपात';

  @override
  String get hundruFallsSubTitle => 'झारखंड का सबसे ऊँचा जलप्रपात';

  @override
  String get hundruFallsRegionTitle => 'रांची जिला, झारखंड';

  @override
  String get hundruFallsArtifactCulture => 'प्राकृतिक अजूबा';

  @override
  String get hundruFallsArtifactGeolocation => 'पूर्वी भारत';

  @override
  String get hundruFallsPullQuote1Top => 'ऊँचाई से गिरते जल का';

  @override
  String get hundruFallsPullQuote1Bottom => 'शानदार नज़ारा';

  @override
  String get hundruFallsPullQuote1Author => 'झारखंड सरकार';

  @override
  String get hundruFallsPullQuote2 =>
      'गिरते हुए जल की फुहार धुंधली वातावरण बनाती है और आधार पर झागदार जलकुंड निर्मित करती है, जो आगंतुकों के लिए अत्यंत रोमांचक दृश्य है।';

  @override
  String get hundruFallsPullQuote2Author => 'यात्रा गाइड';

  @override
  String get hundruFallsCallout1 =>
      'यह जलप्रपात 98 मीटर (322 फीट) की ऊँचाई से गिरता है, जो इसे झारखंड के सबसे ऊँचे जलप्रपातों में से एक और भारत का 34वाँ सबसे ऊँचा जलप्रपात बनाता है।';

  @override
  String get hundruFallsCallout2 =>
      'पानी के कटाव से बने चट्टानों के विभिन्न आकार और संरचनाएँ इस स्थान को लगभग अलौकिक रूप प्रदान करते हैं।';

  @override
  String get hundruFallsVideoCaption => 'हुंडरू जलप्रपात: झारखंड में प्रकृति का अद्भुत नज़ारा';

  @override
  String get hundruFallsMapCaption =>
      'मानचित्र जिसमें रांची जिले की सुवर्णरेखा नदी पर स्थित हुंडरू जलप्रपात दिखाया गया है।';

  @override
  String get hundruFallsHistoryInfo1 =>
      'हुंडरू जलप्रपात झारखंड राज्य के रांची जिले में स्थित एक प्राकृतिक जलप्रपात है। यह सुवर्णरेखा नदी से बनता है, जो पिस्का/नगरी के पास से निकलकर कई जिलों से होकर बहती है और अंततः बंगाल की खाड़ी में मिलती है।';

  @override
  String get hundruFallsHistoryInfo2 =>
      'यह जलप्रपात एक भूगर्भीय संरचना ‘निकपॉइंट’ का उदाहरण है, जो नदी की ढाल में टूटने से बनता है। इससे जल सीधा नीचे गिरता है, और यही इस जलप्रपात की विशेषता है जिसने इसे झारखंड के प्रमुख पर्यटन स्थलों में बदल दिया।';

  @override
  String get hundruFallsConstructionInfo1 =>
      'यह जलप्रपात सुवर्णरेखा नदी के हज़ारों वर्षों के अपरदन से बनी प्राकृतिक भूगर्भीय संरचना है। आसपास की चट्टानी सतह को निरंतर जल प्रवाह ने गढ़ा है, जिससे विशिष्ट चट्टानी संरचनाएँ और प्राकृतिक कुंड बने हैं।';

  @override
  String get hundruFallsConstructionInfo2 =>
      'झरने के तल पर एक प्राकृतिक जलकुंड है, जो दर्शनीय स्थल होने के साथ-साथ आगंतुकों के लिए स्नान का लोकप्रिय स्थान भी है। आसपास का क्षेत्र घने जंगलों और चट्टानी भूभाग से घिरा है, जो इसकी प्राकृतिक सुंदरता और जैव विविधता को बढ़ाता है।';

  @override
  String get hundruFallsLocationInfo1 =>
      'हुंडरू जलप्रपात रांची जिले में रांची शहर से लगभग 45 किलोमीटर दूर हुंडरू गाँव में स्थित है। यह सड़क मार्ग से आसानी से पहुँचा जा सकता है और पिकनिक व एकदिवसीय भ्रमण के लिए लोकप्रिय गंतव्य है।';

  @override
  String get hundruFallsLocationInfo2 =>
      'आसपास का क्षेत्र घने जंगलों और चट्टानी भूभाग से घिरा है। सुवर्णरेखा नदी यहाँ से निकलकर झारखंड, पश्चिम बंगाल और ओडिशा से होते हुए अंततः तालसारी में बंगाल की खाड़ी से मिलती है।';

  @override
  String get hundruFalls1438ce =>
      'प्राकृतिक: हज़ारों वर्षों में भूगर्भीय प्रक्रियाओं और नदी अपरदन से जलप्रपात का निर्माण।';

  @override
  String get hundruFalls1572ce =>
      'स्थानीय आदिवासी समुदाय पीढ़ियों से जलप्रपात को जानते थे और इसे जल स्रोत व सामुदायिक स्थल के रूप में उपयोग करते थे।';

  @override
  String get hundruFalls1867ce =>
      'परिवहन और संचार में सुधार के साथ जलप्रपात को स्थानीय समुदायों से परे पहचान मिलने लगी।';

  @override
  String get hundruFalls1911ce =>
      'स्वतंत्रता के बाद झारखंड क्षेत्र के विकास के साथ हुंडरू जलप्रपात जैसे प्राकृतिक स्थलों की लोकप्रियता बढ़ी।';

  @override
  String get hundruFalls1964ce =>
      'जलप्रपात के आसपास पर्यटन सुविधाओं का विकास शुरू हुआ, जिससे अन्य क्षेत्रों से आने वाले आगंतुकों की संख्या बढ़ी।';

  @override
  String get hundruFalls1997ce =>
      'हुंडरू जलप्रपात झारखंड का प्रमुख पर्यटन स्थल स्थापित हुआ, जहाँ प्रकृति प्रेमी और रोमांचक यात्रियों की भीड़ उमड़ने लगी।';

  @override
  String get hundruFallsCollectible1Title => 'नदी पत्थरों का संग्रह';

  @override
  String get hundruFallsCollectible1Icon => 'पत्थर';

  @override
  String get hundruFallsCollectible2Title => 'वनस्पति संग्रह';

  @override
  String get hundruFallsCollectible2Icon => 'पत्ता';

  @override
  String get hundruFallsCollectible3Title => 'जल क्रिस्टल संरचना';

  @override
  String get hundruFallsCollectible3Icon => 'क्रिस्टल';

  @override
  String get TapovanCavesTitle => 'तपोवन गुफाएँ';

  @override
  String get TapovanCavesSubTitle => 'ध्यान का वन';

  @override
  String get TapovanCavesRegionTitle => 'देवघर, झारखंड';

  @override
  String get TapovanCavesArtifactCulture => 'हिन्दू';

  @override
  String get TapovanCavesArtifactGeolocation => 'पूर्वी भारत';

  @override
  String get TapovanCavesPullQuote1Top => 'पवित्र गुफाएँ जहाँ ऋषि';

  @override
  String get TapovanCavesPullQuote1Bottom => 'वाल्मीकि ने पाया दिव्य एकांत';

  @override
  String get TapovanCavesPullQuote1Author => 'प्राचीन हिन्दू परंपरा';

  @override
  String get TapovanCavesPullQuote2 =>
      'तपोवन आत्मज्ञान की अनंत खोज का प्रतीक है, जहाँ ध्यान साधक को दिव्यता में परिवर्तित कर देता है।';

  @override
  String get TapovanCavesPullQuote2Author => 'हिन्दू शास्त्र';

  @override
  String get TapovanCavesCallout1 =>
      '\'तपोवन\' नाम का अर्थ संस्कृत में \'ध्यान का वन\' है, जो इस पवित्र स्थल की आध्यात्मिक आभा को दर्शाता है, जहाँ प्राचीन ऋषियों ने ज्ञान की खोज की।';

  @override
  String get TapovanCavesCallout2 =>
      'पहाड़ियों में बनी ये ऐतिहासिक गुफाएँ जटिल मूर्तियों और शांत आंतरिक संरचना से सुसज्जित हैं, जो क्षेत्र की समृद्ध आध्यात्मिक विरासत और ध्यान परंपराओं की झलक प्रदान करती हैं।';

  @override
  String get TapovanCavesVideoCaption => 'तपोवन गुफाएँ: देवघर की पहाड़ियों में पवित्र ध्यान स्थल';

  @override
  String get TapovanCavesMapCaption => 'देवघर से 10 किलोमीटर दूर झारखंड में स्थित तपोवन गुफाओं का मानचित्र।';

  @override
  String get TapovanCavesHistoryInfo1 =>
      'तपोवन गुफाएँ हज़ारों वर्षों से आध्यात्मिक शरणस्थली रही हैं। परंपरा के अनुसार त्रेता युग में भगवान राम, सीता और लक्ष्मण ने अपने 14 वर्ष के वनवास के दौरान यहाँ निवास किया। गुफाओं का पवित्र महत्व ऋषि वाल्मीकि के ध्यान स्थल होने से है, जिन्होंने रामायण की रचना यहीं की।';

  @override
  String get TapovanCavesHistoryInfo2 =>
      'यह स्थल कठोर तपस्या (तप) के केंद्र के रूप में प्रसिद्ध हुआ, जब ऋषि वाल्मीकि यहाँ प्रायश्चित करने आए और बाद में रामायण के अंशों की रचना यहीं की। इतिहास में अनेक संतों और तपस्वियों ने यहाँ एकांत और ज्ञान प्राप्त किया।';

  @override
  String get TapovanCavesConstructionInfo1 =>
      'तपोवन गुफाएँ प्राकृतिक रूप से बनी हुई हैं, जिनमें मानव निर्मित नक्काशियाँ भी हैं। पहाड़ी की चोटी पर तपोनाथ महादेव मंदिर स्थित है। मुख्य गुफाओं में से एक में प्राकृतिक शिवलिंग है, जो भक्तों के लिए प्रमुख आस्था केंद्र है।';

  @override
  String get TapovanCavesConstructionInfo2 =>
      'गुफाओं में पत्थरों पर बनी मूर्तियाँ और शिल्प हिन्दू देवी-देवताओं और आध्यात्मिक प्रतीकों को दर्शाते हैं। प्राकृतिक संरचना और मानवीय शिल्पकला का सुंदर संगम यहाँ ध्यान और साधना के लिए उपयुक्त वातावरण बनाता है।';

  @override
  String get TapovanCavesLocationInfo1 =>
      'तपोवन गुफाएँ झारखंड राज्य के देवघर से 10 किलोमीटर दूर स्थित हैं। यह स्थल पवित्र शहर देवघर की पहाड़ियों में है, जो वैद्यनाथ मंदिर (बारह ज्योतिर्लिंगों में से एक) के लिए प्रसिद्ध है।';

  @override
  String get TapovanCavesLocationInfo2 =>
      'गुफाएँ एक पहाड़ी पर स्थित हैं, जहाँ आधार से 30 मिनट की चढ़ाई करके पहुँचा जा सकता है। यह स्थल तीर्थयात्रियों और रोमांच प्रेमियों दोनों के लिए लोकप्रिय है। यहाँ से आसपास का विहंगम दृश्य दिखता है और प्राचीन शांति का वातावरण महसूस होता है।';

  @override
  String get TapovanCaves1200bce =>
      'त्रेता युग: परंपरा के अनुसार भगवान राम, सीता और लक्ष्मण ने अपने 14 वर्ष के वनवास के दौरान इन गुफाओं में निवास किया।';

  @override
  String get TapovanCaves106bce =>
      'प्राचीन काल: ऋषि वाल्मीकि तप करने यहाँ आए और यहीं ध्यान लगाकर रामायण के अंशों की रचना की।';

  @override
  String get TapovanCaves551ce => 'मध्यकाल: गुफाएँ संतों और तपस्वियों के आकर्षण का केंद्र बनी रहीं।';

  @override
  String get TapovanCaves1812ce =>
      '19वीं सदी: संत बलानंद ब्रह्मचारी ने तपोवन में 50 वर्षों से अधिक समय तक कठोर तप किया और आध्यात्मिक सिद्धियाँ प्राप्त कीं।';

  @override
  String get TapovanCaves1958ce =>
      'आधुनिक काल: श्री बलानंद ब्रह्मचारी और अन्य संतों ने इस स्थल की ख्याति एक शक्तिशाली साधना केंद्र के रूप में स्थापित की।';

  @override
  String get TapovanCaves1989ce =>
      'समकालीन काल: यह स्थल एक प्रमुख तीर्थ बन गया, जहाँ भारतभर से भक्त आते हैं और यहाँ की पवित्रता व शांति बनी रहती है।';

  @override
  String get TapovanCavesCollectible1Title => 'पवित्र रुद्राक्ष माला';

  @override
  String get TapovanCavesCollectible1Icon => 'आभूषण';

  @override
  String get TapovanCavesCollectible2Title => 'शिवलिंग शिला';

  @override
  String get TapovanCavesCollectible2Icon => 'प्रतिमा';

  @override
  String get TapovanCavesCollectible3Title => 'ताड़पत्र संस्कृत पांडुलिपि';

  @override
  String get TapovanCavesCollectible3Icon => 'चित्र';

  @override
  String get HargaddiChokahatuTitle => 'टैगोर हिल';

  @override
  String get HargaddiChokahatuSubTitle => 'साहित्यिक धरोहर की मोराबादी पहाड़ी';

  @override
  String get HargaddiChokahatuRegionTitle => 'रांची, झारखंड';

  @override
  String get HargaddiChokahatuArtifactCulture => 'बंगाली साहित्यिक';

  @override
  String get HargaddiChokahatuArtifactGeolocation => 'पूर्वी भारत';

  @override
  String get HargaddiChokahatuPullQuote1Top => 'जहाँ प्रकृति की सुंदरता ने प्रेरित किया';

  @override
  String get HargaddiChokahatuPullQuote1Bottom => 'टैगोर परिवार की साहित्यिक आत्मा को';

  @override
  String get HargaddiChokahatuPullQuote2 =>
      'यह शांत पहाड़ी साहित्यिक प्रतिभा का आश्रय बनी जहाँ प्रकृति की भव्यता के बीच कला और परिवेश का अनूठा संगम हुआ।';

  @override
  String get HargaddiChokahatuPullQuote2Author => 'साहित्यिक धरोहर';

  @override
  String get HargaddiChokahatuCallout1 =>
      '300 मीटर (900 फीट) ऊँची यह दर्शनीय पहाड़ी अल्बर्ट एक्का चौक से केवल 4 किलोमीटर की दूरी पर स्थित है। यहाँ के मनमोहक सूर्योदय और सूर्यास्त के दृश्य ने टैगोर परिवार को मंत्रमुग्ध किया था।';

  @override
  String get HargaddiChokahatuCallout2 =>
      'इस पहाड़ी पर ऐतिहासिक शांति धाम निवास और ब्रह्म स्थल स्मारक हैं जिन्हें ज्योतिरिंद्रनाथ टैगोर ने बनवाया था। साथ ही यहाँ रामकृष्ण मिशन आश्रम और शैक्षिक संस्थान भी हैं जो आज भी शिक्षा और अध्यात्म की परंपरा को आगे बढ़ा रहे हैं।';

  @override
  String get HargaddiChokahatuVideoCaption => 'टैगोर हिल: साहित्यिक धरोहर और प्राकृतिक सुंदरता, रांची, झारखंड';

  @override
  String get HargaddiChokahatuMapCaption =>
      'मानचित्र जिसमें रांची के मोराबादी क्षेत्र में स्थित टैगोर हिल का स्थान दिखाया गया है।';

  @override
  String get HargaddiChokahatuHistoryInfo1 =>
      'टैगोर हिल, जिसे मोराबादी हिल भी कहा जाता है, का ऐतिहासिक महत्व 1898 में बढ़ा जब ज्योतिरिंद्रनाथ और सत्येंद्रनाथ टैगोर रांची आए। 1908 में ज्योतिरिंद्रनाथ टैगोर यहाँ दोबारा आए और इसकी अद्भुत सुंदरता से इतने प्रभावित हुए कि उन्होंने यहाँ अपना शिविर निवास स्थापित किया।';

  @override
  String get HargaddiChokahatuHistoryInfo2 =>
      '1912 में पत्नी कादंबरी देवी की मृत्यु के बाद ज्योतिरिंद्रनाथ टैगोर यहीं बस गए और शांति धाम तथा ब्रह्म स्थल का निर्माण करवाया। वे 1925 तक यहीं रहे, जिससे यह स्थान साहित्यिक तीर्थ और सांस्कृतिक धरोहर बन गया।';

  @override
  String get HargaddiChokahatuConstructionInfo1 =>
      'पहाड़ी पर स्थित शांति धाम बंगाली स्थापत्य शैली में बनाया गया था जो स्थानीय जलवायु और भू-भाग के अनुसार अनुकूलित था। यह घर चिंतन और सृजनात्मक कार्य के लिए उपयुक्त स्थान बना।';

  @override
  String get HargaddiChokahatuConstructionInfo2 =>
      'ब्रह्म स्थल स्मारक इस पहाड़ी का आध्यात्मिक केंद्र है, जो टैगोर परिवार की दार्शनिक और धार्मिक प्रवृत्ति को दर्शाता है। यहाँ रामकृष्ण मिशन आश्रम और दिव्यायन केंद्र तथा कृषि व्यावसायिक संस्थान भी हैं जो शिक्षा और सेवा की परंपरा को जारी रखते हैं।';

  @override
  String get HargaddiChokahatuLocationInfo1 =>
      'टैगोर हिल रांची के मोराबादी क्षेत्र में स्थित है, जिसकी ऊँचाई लगभग 300 मीटर (900 फीट) है और यह अल्बर्ट एक्का चौक से केवल 4 किलोमीटर की दूरी पर है।';

  @override
  String get HargaddiChokahatuLocationInfo2 =>
      'यह स्थान ऐतिहासिक धरोहर और पर्यटन स्थल दोनों है। प्रकृति प्रेमियों, साहित्य प्रेमियों और शांति चाहने वालों के लिए यह आकर्षण का केंद्र है। रोमांच प्रेमियों के लिए यहाँ रॉक क्लाइम्बिंग जैसी गतिविधियाँ भी लोकप्रिय हैं।';

  @override
  String get HargaddiChokahatu2575bce =>
      '1898 ईस्वी: ज्योतिरिंद्रनाथ और सत्येंद्रनाथ टैगोर पहली बार रांची आए और मोराबादी हिल की सुंदरता को देखा।';

  @override
  String get HargaddiChokahatu2465bce =>
      '1908 ईस्वी: ज्योतिरिंद्रनाथ टैगोर पुनः यहाँ आए और इस पहाड़ी की सुंदरता से प्रभावित होकर अपना शिविर निवास बनाया।';

  @override
  String get HargaddiChokahatu443bce =>
      '1912 ईस्वी: पत्नी की मृत्यु के बाद ज्योतिरिंद्रनाथ टैगोर यहाँ स्थायी रूप से बस गए और शांति धाम व ब्रह्म स्थल का निर्माण किया।';

  @override
  String get HargaddiChokahatu1925ce =>
      '1925 ईस्वी: ज्योतिरिंद्रनाथ टैगोर का यहीं निधन हुआ, जिससे यह स्थान साहित्यिक और आध्यात्मिक धरोहर का केंद्र बन गया।';

  @override
  String get HargaddiChokahatu1979ce =>
      '20वीं सदी का मध्य: रामकृष्ण मिशन आश्रम की स्थापना यहाँ हुई, जिसने शिक्षा और सेवा की परंपरा को आगे बढ़ाया।';

  @override
  String get HargaddiChokahatu1990ce =>
      'आधुनिक काल: झारखंड पर्यटन विभाग द्वारा टैगोर हिल को आधिकारिक पर्यटन स्थल घोषित किया गया।';

  @override
  String get HargaddiChokahatuCollectible1Title => 'टैगोर परिवार की पांडुलिपि';

  @override
  String get HargaddiChokahatuCollectible1Icon => 'scroll';

  @override
  String get HargaddiChokahatuCollectible2Title => 'ब्रह्म स्थल शिल्प';

  @override
  String get HargaddiChokahatuCollectible2Icon => 'statue';

  @override
  String get HargaddiChokahatuCollectible3Title => 'शांति धाम स्थापत्य तत्व';

  @override
  String get HargaddiChokahatuCollectible3Icon => 'jewelry';

  @override
  String get DeogharTitle => 'देवघर ज़िला';

  @override
  String get DeogharSubTitle => 'देवताओं की धरती';

  @override
  String get DeogharRegionTitle => 'संथाल परगना डिवीजन, झारखंड';

  @override
  String get DeogharArtifactCulture => 'हिंदू तीर्थयात्रा';

  @override
  String get DeogharArtifactGeolocation => 'पूर्वी भारत';

  @override
  String get DeogharPullQuote1Top => 'सिर्फ एक ज़िला नहीं,';

  @override
  String get DeogharPullQuote1Bottom => 'बल्कि एक पवित्र तीर्थस्थल।';

  @override
  String get DeogharPullQuote1Author => 'बाबा वैद्यनाथ के भक्त';

  @override
  String get DeogharPullQuote2 =>
      'भक्तों के लिए बाबा वैद्यनाथ धाम की तीर्थयात्रा आत्मज्ञान और आध्यात्मिक जागरण की एक पवित्र यात्रा है।';

  @override
  String get DeogharPullQuote2Author => 'इन्क्रेडिबल इंडिया';

  @override
  String get DeogharCallout1 =>
      'देवघर बाबा वैद्यनाथ मंदिर का घर है, जो बारह पवित्र ज्योतिर्लिंगों में से एक और भारत के 51 शक्तिपीठों में से एक है।';

  @override
  String get DeogharCallout2 =>
      'श्रावणी मेला दुनिया का सबसे लंबा धार्मिक मेला है, जहाँ लाखों भक्त 100 किलोमीटर की पैदल यात्रा करके यहाँ पहुँचते हैं।';

  @override
  String get DeogharVideoCaption => 'देवघर ज़िला: पवित्र तीर्थ और सांस्कृतिक धरोहर, झारखंड';

  @override
  String get DeogharMapCaption =>
      'मानचित्र जिसमें झारखंड के संथाल परगना डिवीजन में स्थित देवघर ज़िले का स्थान दिखाया गया है।';

  @override
  String get DeogharHistoryInfo1 =>
      'देवघर का अर्थ है \'देवताओं का घर\'। यहाँ स्थित प्राचीन वैद्यनाथ मंदिर की कथा के अनुसार भगवान शिव ने रावण को रोगमुक्त किया था और इसी कारण यह स्थान \'वैद्यनाथ\' कहलाया।';

  @override
  String get DeogharHistoryInfo2 =>
      'वैद्यनाथ मंदिर परिसर में मुख्य मंदिर के साथ 21 अतिरिक्त मंदिर हैं। यह पवित्र स्थल सदियों से एक प्रमुख तीर्थ रहा है जहाँ आने से भक्त आत्मिक मुक्ति और मनोकामना पूर्ण होने का विश्वास रखते हैं।';

  @override
  String get DeogharConstructionInfo1 =>
      'वैद्यनाथ मंदिर का निर्माण 16वीं सदी के मध्य में हुआ था। यह मंदिर पारंपरिक हिंदू स्थापत्य शैली में निर्मित है जिसमें जटिल पत्थर की नक्काशी और कई छोटे-छोटे मंदिर शामिल हैं। मुख्य मंदिर 72 फीट ऊँचा है।';

  @override
  String get DeogharConstructionInfo2 =>
      'देवघर ज़िले का क्षेत्रफल 2,479 वर्ग किलोमीटर है। यहाँ ऊँची-नीची ज़मीन, पहाड़ियाँ, उपजाऊ मैदान और जंगल हैं। लगभग 28% भूमि अत्यंत उपजाऊ और खेती योग्य है।';

  @override
  String get DeogharLocationInfo1 =>
      'देवघर ज़िला झारखंड के संथाल परगना डिवीजन में स्थित है। यह सड़क, रेल और हवाई मार्ग से जुड़ा हुआ है। देवघर हवाई अड्डे से दिल्ली, कोलकाता और पटना जैसी प्रमुख नगरों तक सीधी उड़ान उपलब्ध है।';

  @override
  String get DeogharLocationInfo2 =>
      'देवघर झारखंड की सांस्कृतिक राजधानी है। यह हर साल लाखों श्रद्धालुओं को आकर्षित करता है, विशेषकर सावन महीने में जब श्रावणी मेला आयोजित होता है।';

  @override
  String get Deoghar1631ce => 'प्राचीन काल: यहाँ पर आदिकाल से जनजातीय संस्कृति और हिंदू धार्मिक परंपराएँ स्थापित हुईं।';

  @override
  String get Deoghar1647ce => 'मध्यकाल: 16वीं सदी में वैद्यनाथ मंदिर का निर्माण पूरा हुआ और यह एक प्रमुख तीर्थ बन गया।';

  @override
  String get Deoghar1658ce =>
      'मंदिर परिसर बारह ज्योतिर्लिंगों में से एक के रूप में स्थापित हुआ और पूरे भारतीय उपमहाद्वीप से भक्त आने लगे।';

  @override
  String get Deoghar1901ce =>
      'ब्रिटिश शासन काल: यह क्षेत्र संथाल परगना ज़िले का हिस्सा बना और प्रशासनिक ढाँचे विकसित हुए।';

  @override
  String get Deoghar1984ce => 'आधुनिक काल: यातायात और यात्रियों के लिए सुविधाओं का विकास शुरू हुआ।';

  @override
  String get Deoghar1998ce =>
      'झारखंड राज्य गठन के बाद: देवघर एक अलग ज़िला बना और तीर्थ पर्यटन तथा सांस्कृतिक संरक्षण पर विशेष ध्यान दिया गया।';

  @override
  String get DeogharCollectible1Title => 'पवित्र रुद्राक्ष माला';

  @override
  String get DeogharCollectible1Icon => 'jewelry';

  @override
  String get DeogharCollectible2Title => 'मंदिर स्थापत्य मॉडल';

  @override
  String get DeogharCollectible2Icon => 'picture';

  @override
  String get DeogharCollectible3Title => 'संस्कृत पांडुलिपि';

  @override
  String get DeogharCollectible3Icon => 'scroll';

  @override
  String get timelineEvent2900bce => 'मिस्रवासियों द्वारा पपीरस का पहला ज्ञात उपयोग';

  @override
  String get timelineEvent2700bce => 'मिस्र में पुराना साम्राज्य शुरू होता है';

  @override
  String get timelineEvent2600bce => 'युकातान प्रायद्वीप में माया संस्कृति का उद्भव';

  @override
  String get timelineEvent2560bce => 'राजा खुफू महान गीज़ा पिरामिड का निर्माण पूरा करते हैं';

  @override
  String get timelineEvent2500bce => 'मैमथ का विलुप्त होना';

  @override
  String get timelineEvent2200bce => 'स्टोनहेंज का निर्माण पूरा हुआ';

  @override
  String get timelineEvent2000bce => 'घोड़े का पालतू बनना';

  @override
  String get timelineEvent1800bce => 'वर्णमाला लेखन का उदय';

  @override
  String get timelineEvent890bce => 'होमर इलियड और ओडिसी लिखते हैं';

  @override
  String get timelineEvent776bce => 'प्रथम दर्ज प्राचीन ओलंपिक खेल';

  @override
  String get timelineEvent753bce => 'रोम की स्थापना';

  @override
  String get timelineEvent447bce => 'एथेंस में पार्थेनन का निर्माण शुरू हुआ';

  @override
  String get timelineEvent427bce => 'यूनानी दार्शनिक प्लेटो का जन्म';

  @override
  String get timelineEvent322bce => 'अरस्तू की मृत्यु (61), पहले वास्तविक वैज्ञानिक';

  @override
  String get timelineEvent200bce => 'हान राजवंश में कागज का आविष्कार';

  @override
  String get timelineEvent44bce => 'जूलियस सीज़र की मृत्यु; रोमन साम्राज्य की शुरुआत';

  @override
  String get timelineEvent4bce => 'ईसा मसीह का जन्म';

  @override
  String get timelineEvent43ce => 'रोमन साम्राज्य पहली बार ग्रेट ब्रिटेन में प्रवेश करता है';

  @override
  String get timelineEvent79ce => 'वेसुवियस ज्वालामुखी द्वारा पोम्पेई का विनाश';

  @override
  String get timelineEvent455ce => 'रोमन साम्राज्य का अंत';

  @override
  String get timelineEvent500ce => 'टिकाल पहला महान माया शहर बना';

  @override
  String get timelineEvent632ce => 'मुहम्मद (61) की मृत्यु, इस्लाम के संस्थापक';

  @override
  String get timelineEvent793ce => 'वाइकिंग्स पहली बार ब्रिटेन पर आक्रमण करते हैं';

  @override
  String get timelineEvent800ce => 'चीन में बारूद का आविष्कार';

  @override
  String get timelineEvent1001ce => 'लीफ़ एरिक्सन वर्तमान पूर्वी कनाडा में सर्दियों के दौरान बसते हैं';

  @override
  String get timelineEvent1077ce => 'लंदन टॉवर का निर्माण शुरू होता है';

  @override
  String get timelineEvent1117ce => 'ऑक्सफ़ोर्ड विश्वविद्यालय की स्थापना';

  @override
  String get timelineEvent1199ce => 'यूरोपियों द्वारा पहली बार कंपास का उपयोग';

  @override
  String get timelineEvent1227ce => 'चंगेज़ ख़ान (65) की मृत्यु';

  @override
  String get timelineEvent1337ce =>
      'सौ वर्षीय युद्ध शुरू होता है जब इंग्लैंड और फ्रांस प्रभुत्व के लिए संघर्ष करते हैं';

  @override
  String get timelineEvent1347ce => 'ब्लैक डेथ महामारी की पहली लहर, जिसने यूरोप की 50% तक आबादी का सफाया किया';

  @override
  String get timelineEvent1428ce => 'मेक्सिको में एज़्टेक साम्राज्य का जन्म';

  @override
  String get timelineEvent1439ce => 'जोहान्स गुटेनबर्ग ने मुद्रण प्रेस का आविष्कार किया';

  @override
  String get timelineEvent1492ce => 'क्रिस्टोफर कोलंबस ने नई दुनिया की खोज की';

  @override
  String get timelineEvent1760ce => 'औद्योगिक क्रांति शुरू होती है';

  @override
  String get timelineEvent1763ce => 'वाट स्टीम इंजन का विकास';

  @override
  String get timelineEvent1783ce => 'अमेरिकी स्वतंत्रता युद्ध का अंत ब्रिटिश साम्राज्य से';

  @override
  String get timelineEvent1789ce => 'फ्रांसीसी क्रांति शुरू होती है';

  @override
  String get timelineEvent1914ce => 'प्रथम विश्व युद्ध';

  @override
  String get timelineEvent1929ce => 'ब्लैक ट्यूज़डे से महामंदी की शुरुआत';

  @override
  String get timelineEvent1939ce => 'द्वितीय विश्व युद्ध';

  @override
  String get timelineEvent1957ce => 'सोवियत संघ द्वारा स्पुतनिक 1 का प्रक्षेपण';

  @override
  String get timelineEvent1969ce => 'अपोलो 11 मिशन चंद्रमा पर उतरा';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String privacyStatement(Object privacyUrl) {
    return 'जैसा कि हमारी $privacyUrl में समझाया गया है, हम कोई व्यक्तिगत जानकारी एकत्र नहीं करते।';
  }

  @override
  String get pageNotFoundBackButton => 'सभ्यता में लौटें';

  @override
  String get pageNotFoundMessage => 'आप जिस पृष्ठ की तलाश कर रहे हैं वह मौजूद नहीं है।';

  @override
  String get chatAssistantName => 'वंडरस एआई सहायक';

  @override
  String get chatAssistantStatus => 'ऑनलाइन';

  @override
  String get chatDefaultMessage =>
      'आपके संदेश के लिए धन्यवाद! मैं आपको दुनिया के अद्भुत स्थलों की खोज में मदद करने के लिए यहां हूं।';

  @override
  String get chatStartConversation => 'वार्तालाप शुरू करें...';

  @override
  String get chatTypeMessage => 'संदेश लिखें...';

  @override
  String get chatWelcomeMessage =>
      'नमस्ते! मैं आपका एआई सहायक हूं जिसे Google Gemini द्वारा संचालित किया गया है। मैं आज आपकी कैसे मदद कर सकता हूं?';

  @override
  String get chatImageReady => 'चित्र भेजने के लिए तैयार';

  @override
  String get chatImageUploaded => 'चित्र अपलोड किया गया';

  @override
  String get chatPermissionRequired => 'चित्र चुनने के लिए अनुमति आवश्यक है';

  @override
  String get chatErrorPickingImage => 'चित्र चुनने में त्रुटि';

  @override
  String get chatErrorProcessingImage => 'चित्र संसाधित करने में त्रुटि';

  @override
  String get chatErrorProcessingRequest => 'क्षमा करें, आपके अनुरोध को संसाधित करने में त्रुटि हुई';

  @override
  String get chatNoResponse => 'मुझे यकीन नहीं है कि इसका उत्तर कैसे दूं।';

  @override
  String get chatTypingMessage => 'अपना संदेश लिखें...';

  @override
  String get speechPermissionRequired => 'वॉयस इनपुट के लिए माइक्रोफ़ोन की अनुमति आवश्यक है';

  @override
  String get speechLanguageSelector => 'भाषा';

  @override
  String get speechLanguageSelectorTitle => 'भाषा चुनें';

  @override
  String get speechCancel => 'रद्द करें';

  @override
  String get speechListening => 'सुन रहा है';

  @override
  String get speechPaused => 'रुका हुआ';

  @override
  String get speechStopped => 'बंद हुआ';

  @override
  String get speechProcessing => 'प्रक्रिया कर रहा है...';

  @override
  String get speechSayingSomething => 'कुछ बोलें';

  @override
  String get speechDoubleTapLanguage => 'भाषा बदलने के लिए डबल टैप करें';

  @override
  String get speechLongPressToTalk => 'बोलने के लिए लंबा दबाएं';

  @override
  String get loginWelcomeBack => 'वापसी पर स्वागत है!';

  @override
  String get loginCreateAccount => 'खाता बनाएं';

  @override
  String get loginEmailLabel => 'ईमेल';

  @override
  String get loginPasswordLabel => 'पासवर्ड';

  @override
  String get loginConfirmPasswordLabel => 'पासवर्ड की पुष्टि करें';

  @override
  String get loginSignInButton => 'साइन इन करें';

  @override
  String get loginSignUpButton => 'साइन अप करें';

  @override
  String get loginOrDivider => 'या';

  @override
  String get loginGoogleButton => 'Google के साथ जारी रखें';

  @override
  String get loginSwitchToSignUp => 'खाता नहीं है? साइन अप करें';

  @override
  String get loginSwitchToSignIn => 'पहले से खाता है? साइन इन करें';

  @override
  String get loginForgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get loginLogout => 'लॉग आउट';

  @override
  String get loginLoggingIn => 'लॉग इन हो रहे हैं...';

  @override
  String get loginSigningUp => 'साइन अप हो रहे हैं...';

  @override
  String get loginErrorInvalidEmail => 'कृपया एक वैध ईमेल पता दर्ज करें';

  @override
  String get loginErrorWeakPassword => 'पासवर्ड कम से कम 6 अक्षर का होना चाहिए';

  @override
  String get loginErrorPasswordMismatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get loginErrorGeneric => 'एक त्रुटि हुई। कृपया पुनः प्रयास करें।';

  @override
  String get loginSuccessWelcome => 'वंडरस में आपका स्वागत है!';

  @override
  String get loginFullNameLabel => 'पूरा नाम';

  @override
  String get loginPhoneLabel => 'फोन दर्ज करें';

  @override
  String get loginUserRoleLabel => 'उपयोगकर्ता भूमिका चुनें';

  @override
  String get loginRoleCustomer => 'ग्राहक';

  @override
  String get loginRoleGuide => 'गाइड';

  @override
  String get loginRoleMerchant => 'व्यापारी';

  @override
  String get loginRoleAdmin => 'एडमिन';
}
