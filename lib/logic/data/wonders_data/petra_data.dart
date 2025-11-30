import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/data/wonders_data/search/search_data.dart';

part 'search/TapovanCaves_search_data.dart';

class TapovanCavesData extends WonderData {
  TapovanCavesData()
    : super(
        searchData: _searchData, // included as a part from ./search/
        searchSuggestions: _searchSuggestions, // included as a part from ./search/
        type: WonderType.TapovanCaves,
        title: $strings.TapovanCavesTitle,
        subTitle: $strings.TapovanCavesSubTitle,
        regionTitle: $strings.TapovanCavesRegionTitle,
        videoId: 'ezDiSkOU0wc',
        startYr: -312,
        endYr: 100,
        artifactStartYr: -500,
        artifactEndYr: 500,
        artifactCulture: $strings.TapovanCavesArtifactCulture,
        artifactGeolocation: $strings.TapovanCavesArtifactGeolocation,
        lat: 19.9991394,
        lng: 73.8151994,
        unsplashCollectionId: 'qWQJbDvCMW8',
        pullQuote1Top: $strings.TapovanCavesPullQuote1Top,
        pullQuote1Bottom: $strings.TapovanCavesPullQuote1Bottom,
        pullQuote1Author: $strings.TapovanCavesPullQuote1Author,
        pullQuote2: $strings.TapovanCavesPullQuote2,
        pullQuote2Author: $strings.TapovanCavesPullQuote2Author,
        callout1: $strings.TapovanCavesCallout1,
        callout2: $strings.TapovanCavesCallout2,
        videoCaption: $strings.TapovanCavesVideoCaption,
        mapCaption: $strings.TapovanCavesMapCaption,
        historyInfo1: $strings.TapovanCavesHistoryInfo1,
        historyInfo2: $strings.TapovanCavesHistoryInfo2,
        constructionInfo1: $strings.TapovanCavesConstructionInfo1,
        constructionInfo2: $strings.TapovanCavesConstructionInfo2,
        locationInfo1: $strings.TapovanCavesLocationInfo1,
        locationInfo2: $strings.TapovanCavesLocationInfo2,
        highlightArtifacts: const ['325900', '325902', '325919', '325884', '325887', '325891'],
        hiddenArtifacts: const ['322592', '325918', '326243'],
        events: {
          -1200: $strings.TapovanCaves1200bce,
          -106: $strings.TapovanCaves106bce,
          551: $strings.TapovanCaves551ce,
          1812: $strings.TapovanCaves1812ce,
          1958: $strings.TapovanCaves1958ce,
          1989: $strings.TapovanCaves1989ce,
        },
      );
}
