import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/data/wonders_data/search/search_data.dart';
part 'search/machu_picchu_search_data.dart';

class hundruFallsData extends WonderData {
  hundruFallsData()
    : super(
        searchData: _searchData,
        searchSuggestions: _searchSuggestions,
        type: WonderType.hundruFalls,
        title: $strings.hundruFallsTitle,
        subTitle: $strings.hundruFallsSubTitle,
        regionTitle: $strings.hundruFallsRegionTitle,
        videoId: 'cnMa-Sm9H4k',
        startYr: 1450,
        endYr: 1572,
        artifactStartYr: 1200,
        artifactEndYr: 1700,
        artifactCulture: $strings.hundruFallsArtifactCulture,
        artifactGeolocation: $strings.hundruFallsArtifactGeolocation,
        lat: 23.4497246,
        lng: 85.6666868,
        unsplashCollectionId: 'wUhgZTyUnl8',
        pullQuote1Top: $strings.hundruFallsPullQuote1Top,
        pullQuote1Bottom: $strings.hundruFallsPullQuote1Bottom,
        pullQuote1Author: $strings.hundruFallsPullQuote1Author,
        pullQuote2: $strings.hundruFallsPullQuote2,
        pullQuote2Author: $strings.hundruFallsPullQuote2Author,
        callout1: $strings.hundruFallsCallout1,
        callout2: $strings.hundruFallsCallout2,
        videoCaption: $strings.hundruFallsVideoCaption,
        mapCaption: $strings.hundruFallsMapCaption,
        historyInfo1: $strings.hundruFallsHistoryInfo1,
        historyInfo2: $strings.hundruFallsHistoryInfo2,
        constructionInfo1: $strings.hundruFallsConstructionInfo1,
        constructionInfo2: $strings.hundruFallsConstructionInfo2,
        locationInfo1: $strings.hundruFallsLocationInfo1,
        locationInfo2: $strings.hundruFallsLocationInfo2,
        highlightArtifacts: const ['313295', '316926', '309944', '309436', '309960', '316873'],
        hiddenArtifacts: const ['308120', '309960', '313341'],
        events: {
          1438: $strings.hundruFalls1438ce,
          1572: $strings.hundruFalls1572ce,
          1867: $strings.hundruFalls1867ce,
          1911: $strings.hundruFalls1911ce,
          1964: $strings.hundruFalls1964ce,
          1997: $strings.hundruFalls1997ce,
        },
      );
}
