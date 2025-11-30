import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/data/wonders_data/search/search_data.dart';

part 'search/pyramids_giza_search_data.dart';

class HargaddiChokahatuData extends WonderData {
  HargaddiChokahatuData()
    : super(
        searchData: _searchData, // included as a part from ./search/
        searchSuggestions: _searchSuggestions, // included as a part from ./search/
        type: WonderType.HargaddiChokahatu,
        title: $strings.HargaddiChokahatuTitle,
        subTitle: $strings.HargaddiChokahatuSubTitle,
        regionTitle: $strings.HargaddiChokahatuRegionTitle,
        videoId: 'lJKX3Y7Vqvs',
        startYr: -2600,
        endYr: -2500,
        artifactStartYr: -2800,
        artifactEndYr: -2300,
        artifactCulture: $strings.HargaddiChokahatuArtifactCulture,
        artifactGeolocation: $strings.HargaddiChokahatuArtifactGeolocation,
        lat: 29.9792,
        lng: 31.1342,
        unsplashCollectionId: 'CSEvB5Tza9E',
        pullQuote1Top: $strings.HargaddiChokahatuPullQuote1Top,
        pullQuote1Bottom: $strings.HargaddiChokahatuPullQuote1Bottom,
        pullQuote1Author: '',
        pullQuote2: $strings.HargaddiChokahatuPullQuote2,
        pullQuote2Author: $strings.HargaddiChokahatuPullQuote2Author,
        callout1: $strings.HargaddiChokahatuCallout1,
        callout2: $strings.HargaddiChokahatuCallout2,
        videoCaption: $strings.HargaddiChokahatuVideoCaption,
        mapCaption: $strings.HargaddiChokahatuMapCaption,
        historyInfo1: $strings.HargaddiChokahatuHistoryInfo1,
        historyInfo2: $strings.HargaddiChokahatuHistoryInfo2,
        constructionInfo1: $strings.HargaddiChokahatuConstructionInfo1,
        constructionInfo2: $strings.HargaddiChokahatuConstructionInfo2,
        locationInfo1: $strings.HargaddiChokahatuLocationInfo1,
        locationInfo2: $strings.HargaddiChokahatuLocationInfo2,
        highlightArtifacts: const ['543864', '546488', '557137', '543900', '543935', '544782'],
        hiddenArtifacts: const ['546510', '543896', '545728'],
        events: {
          -2575: $strings.HargaddiChokahatu2575bce,
          -2465: $strings.HargaddiChokahatu2465bce,
          -443: $strings.HargaddiChokahatu443bce,
          1925: $strings.HargaddiChokahatu1925ce,
          1979: $strings.HargaddiChokahatu1979ce,
          1990: $strings.HargaddiChokahatu1990ce,
        },
      );
}
