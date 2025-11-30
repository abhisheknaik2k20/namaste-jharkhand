import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/logic/data/wonder_data.dart';
import 'package:namste_jharkhand/logic/data/wonders_data/search/search_data.dart';

part 'search/ParasnathHill_search_data.dart';

class ParasnathHillData extends WonderData {
  ParasnathHillData()
    : super(
        searchData: _searchData, // included as a part from ./search/
        searchSuggestions: _searchSuggestions, // included as a part from ./search/
        type: WonderType.ParasnathHill,
        title: $strings.ParasnathHillTitle,
        subTitle: $strings.ParasnathHillSubTitle,
        regionTitle: $strings.ParasnathHillRegionTitle,
        videoId: 'GXoEpNjgKzg',
        startYr: 70,
        endYr: 80,
        artifactStartYr: 0,
        artifactEndYr: 500,
        artifactCulture: $strings.ParasnathHillArtifactCulture,
        artifactGeolocation: $strings.ParasnathHillArtifactGeolocation,
        lat: 23.9649036,
        lng: 86.1446493,
        unsplashCollectionId: 'VPdti8Kjq9o',
        pullQuote1Top: $strings.ParasnathHillPullQuote1Top,
        pullQuote1Bottom: $strings.ParasnathHillPullQuote1Bottom,
        pullQuote1Author: '',
        pullQuote2: $strings.ParasnathHillPullQuote2,
        pullQuote2Author: $strings.ParasnathHillPullQuote2Author,
        callout1: $strings.ParasnathHillCallout1,
        callout2: $strings.ParasnathHillCallout2,
        videoCaption: $strings.ParasnathHillVideoCaption,
        mapCaption: $strings.ParasnathHillMapCaption,
        historyInfo1: $strings.ParasnathHillHistoryInfo1,
        historyInfo2: $strings.ParasnathHillHistoryInfo2,
        constructionInfo1: $strings.ParasnathHillConstructionInfo1,
        constructionInfo2: $strings.ParasnathHillConstructionInfo2,
        locationInfo1: $strings.ParasnathHillLocationInfo1,
        locationInfo2: $strings.ParasnathHillLocationInfo2,
        highlightArtifacts: const ['251350', '255960', '247993', '250464', '251476', '255960'],
        hiddenArtifacts: const ['245376', '256570', '286136'],
        events: {
          70: $strings.ParasnathHill70ce,
          82: $strings.ParasnathHill82ce,
          1140: $strings.ParasnathHill1140ce,
          1490: $strings.ParasnathHill1490ce,
          1829: $strings.ParasnathHill1829ce,
          1990: $strings.ParasnathHill1990ce,
        },
      );
}
