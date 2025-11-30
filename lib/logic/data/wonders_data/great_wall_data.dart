import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/data/wonders_data/search/search_data.dart';

part 'search/great_wall_search_data.dart';

class PatratuValleyData extends WonderData {
  PatratuValleyData()
    : super(
        searchData: _searchData, // included as a part from ./search/
        searchSuggestions: _searchSuggestions, // included as a part from ./search/
        type: WonderType.PatratuValley,
        title: $strings.PatratuValleyTitle,
        subTitle: $strings.PatratuValleySubTitle,
        regionTitle: $strings.PatratuValleyRegionTitle,
        videoId: 'do1Go22Wu8o',
        startYr: -700,
        endYr: 1644,
        artifactStartYr: -700,
        artifactEndYr: 1650,
        artifactCulture: $strings.PatratuValleyArtifactCulture,
        artifactGeolocation: $strings.PatratuValleyArtifactGeolocation,
        lat: 23.5748529,
        lng: 85.2740315,
        unsplashCollectionId: 'Kg_h04xvZEo',
        pullQuote1Top: $strings.PatratuValleyPullQuote1Top,
        pullQuote1Bottom: $strings.PatratuValleyPullQuote1Bottom,
        pullQuote1Author: '', //No key because it doesn't generate for empty values
        pullQuote2: $strings.PatratuValleyPullQuote2,
        pullQuote2Author: $strings.PatratuValleyPullQuote2Author,
        callout1: $strings.PatratuValleyCallout1,
        callout2: $strings.PatratuValleyCallout2,
        videoCaption: $strings.PatratuValleyVideoCaption,
        mapCaption: $strings.PatratuValleyMapCaption,
        historyInfo1: $strings.PatratuValleyHistoryInfo1,
        historyInfo2: $strings.PatratuValleyHistoryInfo2,
        constructionInfo1: $strings.PatratuValleyConstructionInfo1,
        constructionInfo2: $strings.PatratuValleyConstructionInfo2,
        locationInfo1: $strings.PatratuValleyLocationInfo1,
        locationInfo2: $strings.PatratuValleyLocationInfo2,
        highlightArtifacts: const ['79091', '781812', '40213', '40765', '57612', '666573'],
        hiddenArtifacts: const ['39918', '39666', '39735'],
        events: {
          -700: $strings.PatratuValley700bce,
          -214: $strings.PatratuValley214bce,
          -121: $strings.PatratuValley121bce,
          556: $strings.PatratuValley556ce,
          618: $strings.PatratuValley618ce,
          1487: $strings.PatratuValley1487ce,
        },
      );
}
