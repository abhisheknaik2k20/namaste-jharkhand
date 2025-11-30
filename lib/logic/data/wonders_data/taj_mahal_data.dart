import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/data/wonders_data/search/search_data.dart';

part 'search/taj_mahal_search_data.dart';

class DeogharData extends WonderData {
  DeogharData()
    : super(
        searchData: _searchData, // included as a part from ./search/
        searchSuggestions: _searchSuggestions, // included as a part from ./search/
        type: WonderType.Deoghar,
        title: $strings.DeogharTitle,
        subTitle: $strings.DeogharSubTitle,
        regionTitle: $strings.DeogharRegionTitle,
        videoId: 'EWkDzLrhpXI',
        startYr: 1632,
        endYr: 1653,
        artifactStartYr: 1600,
        artifactEndYr: 1700,
        artifactCulture: $strings.DeogharArtifactCulture,
        artifactGeolocation: $strings.DeogharArtifactGeolocation,
        lat: 24.485179,
        lng: 86.694785,
        unsplashCollectionId: '684IRta86_c',
        pullQuote1Top: $strings.DeogharPullQuote1Top,
        pullQuote1Bottom: $strings.DeogharPullQuote1Bottom,
        pullQuote1Author: $strings.DeogharPullQuote1Author,
        pullQuote2: $strings.DeogharPullQuote2,
        pullQuote2Author: $strings.DeogharPullQuote2Author,
        callout1: $strings.DeogharCallout1,
        callout2: $strings.DeogharCallout2,
        videoCaption: $strings.DeogharVideoCaption,
        mapCaption: $strings.DeogharMapCaption,
        historyInfo1: $strings.DeogharHistoryInfo1,
        historyInfo2: $strings.DeogharHistoryInfo2,
        constructionInfo1: $strings.DeogharConstructionInfo1,
        constructionInfo2: $strings.DeogharConstructionInfo2,
        locationInfo1: $strings.DeogharLocationInfo1,
        locationInfo2: $strings.DeogharLocationInfo2,
        highlightArtifacts: const ['453341', '453243', '73309', '24932', '56230', '35633'],
        hiddenArtifacts: const ['24907', '453183', '453983'],
        events: {
          1631: $strings.Deoghar1631ce,
          1647: $strings.Deoghar1647ce,
          1658: $strings.Deoghar1658ce,
          1901: $strings.Deoghar1901ce,
          1984: $strings.Deoghar1984ce,
          1998: $strings.Deoghar1998ce,
        },
      );
}
