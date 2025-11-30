import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/data/wonders_data/search/search_data.dart';

part 'search/christ_redeemer_search_data.dart';

class BetlaNationalParkData extends WonderData {
  BetlaNationalParkData()
    : super(
        searchData: _searchData, // included as a part from ./search/
        searchSuggestions: _searchSuggestions, // included as a part from ./search/
        type: WonderType.BetlaNationalPark,
        title: $strings.BetlaNationalParkTitle,
        subTitle: $strings.BetlaNationalParkSubTitle,
        regionTitle: $strings.BetlaNationalParkRegionTitle,
        videoId: 'k_615AauSds',
        startYr: 1922,
        endYr: 1931,
        artifactStartYr: 1600,
        artifactEndYr: 2100,
        artifactCulture: '',
        artifactGeolocation: $strings.BetlaNationalParkArtifactGeolocation,
        lat: 23.8856486,
        lng: 84.1923982,
        unsplashCollectionId: 'dPgX5iK8Ufo',
        pullQuote1Top: $strings.BetlaNationalParkPullQuote1Top,
        pullQuote1Bottom: $strings.BetlaNationalParkPullQuote1Bottom,
        pullQuote1Author: '',
        pullQuote2: $strings.BetlaNationalParkPullQuote2,
        pullQuote2Author: $strings.BetlaNationalParkPullQuote2Author,
        callout1: $strings.BetlaNationalParkCallout1,
        callout2: $strings.BetlaNationalParkCallout2,
        videoCaption: $strings.BetlaNationalParkVideoCaption,
        mapCaption: $strings.BetlaNationalParkMapCaption,
        historyInfo1: $strings.BetlaNationalParkHistoryInfo1,
        historyInfo2: $strings.BetlaNationalParkHistoryInfo2,
        constructionInfo1: $strings.BetlaNationalParkConstructionInfo1,
        constructionInfo2: $strings.BetlaNationalParkConstructionInfo2,
        locationInfo1: $strings.BetlaNationalParkLocationInfo1,
        locationInfo2: $strings.BetlaNationalParkLocationInfo2,
        highlightArtifacts: const ['501319', '764815', '502019', '764814', '764816'],
        hiddenArtifacts: const ['501302', '157985', '227759'],
        events: {
          1850: $strings.BetlaNationalPark1850ce,
          1921: $strings.BetlaNationalPark1921ce,
          1922: $strings.BetlaNationalPark1922ce,
          1926: $strings.BetlaNationalPark1926ce,
          1931: $strings.BetlaNationalPark1931ce,
          2006: $strings.BetlaNationalPark2006ce,
        },
      );
}
