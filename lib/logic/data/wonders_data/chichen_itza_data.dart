import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/data/wonders_data/search/search_data.dart';

part 'search/chichen_itza_search_data.dart';

class JagannathTempleData extends WonderData {
  JagannathTempleData()
    : super(
        searchData: _searchData, // included as a part from ./search/
        searchSuggestions: _searchSuggestions, // included as a part from ./search/
        type: WonderType.JagannathTemple,
        title: $strings.JagannathTempleTitle,
        subTitle: $strings.JagannathTempleSubTitle,
        regionTitle: $strings.JagannathTempleRegionTitle,
        videoId: 'Q6eBJjdca14',
        startYr: 550,
        endYr: 1550,
        artifactStartYr: 500,
        artifactEndYr: 1600,
        artifactCulture: $strings.JagannathTempleArtifactCulture,
        artifactGeolocation: $strings.JagannathTempleArtifactGeolocation,
        lat: 19.8049379,
        lng: 85.8179386,
        unsplashCollectionId: 'SUK0tuMnLLw',
        pullQuote1Top: $strings.JagannathTemplePullQuote1Top,
        pullQuote1Bottom: $strings.JagannathTemplePullQuote1Bottom,
        pullQuote1Author: '',
        pullQuote2: $strings.JagannathTemplePullQuote2,
        pullQuote2Author: $strings.JagannathTemplePullQuote2Author,
        callout1: $strings.JagannathTempleCallout1,
        callout2: $strings.JagannathTempleCallout2,
        videoCaption: $strings.JagannathTempleVideoCaption,
        mapCaption: $strings.JagannathTempleMapCaption,
        historyInfo1: $strings.JagannathTempleHistoryInfo1,
        historyInfo2: $strings.JagannathTempleHistoryInfo2,
        constructionInfo1: $strings.JagannathTempleConstructionInfo1,
        constructionInfo2: $strings.JagannathTempleConstructionInfo2,
        locationInfo1: $strings.JagannathTempleLocationInfo1,
        locationInfo2: $strings.JagannathTempleLocationInfo2,
        highlightArtifacts: const ['503940', '312595', '310551', '316304', '313151', '313256'],
        hiddenArtifacts: const ['701645', '310555', '286467'],
        events: {
          600: $strings.JagannathTemple600ce,
          832: $strings.JagannathTemple832ce,
          998: $strings.JagannathTemple998ce,
          1100: $strings.JagannathTemple1100ce,
          1527: $strings.JagannathTemple1527ce,
          1535: $strings.JagannathTemple1535ce,
        },
      );
}
