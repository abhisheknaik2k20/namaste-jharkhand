import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('zh'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Wonderous'**
  String get appName;

  /// No description provided for @localeSwapButton.
  ///
  /// In en, this message translates to:
  /// **'简体中文'**
  String get localeSwapButton;

  /// No description provided for @animatedArrowSemanticSwipe.
  ///
  /// In en, this message translates to:
  /// **'Explore details about {title}.'**
  String animatedArrowSemanticSwipe(Object title);

  /// No description provided for @appBarTitleFactsHistory.
  ///
  /// In en, this message translates to:
  /// **'Facts and History'**
  String get appBarTitleFactsHistory;

  /// No description provided for @appBarTitleConstruction.
  ///
  /// In en, this message translates to:
  /// **'Construction'**
  String get appBarTitleConstruction;

  /// No description provided for @appBarTitleLocation.
  ///
  /// In en, this message translates to:
  /// **'Location Info'**
  String get appBarTitleLocation;

  /// No description provided for @bottomScrubberSemanticScrubber.
  ///
  /// In en, this message translates to:
  /// **'scrubber'**
  String get bottomScrubberSemanticScrubber;

  /// No description provided for @bottomScrubberSemanticTimeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline Scrubber, drag horizontally to navigate the timeline.'**
  String get bottomScrubberSemanticTimeline;

  /// No description provided for @collectionLabelDiscovered.
  ///
  /// In en, this message translates to:
  /// **'{percentage}% discovered'**
  String collectionLabelDiscovered(Object percentage);

  /// No description provided for @collectionLabelCount.
  ///
  /// In en, this message translates to:
  /// **'{count} of {total}'**
  String collectionLabelCount(Object count, Object total);

  /// No description provided for @collectionButtonReset.
  ///
  /// In en, this message translates to:
  /// **'Reset Collection'**
  String get collectionButtonReset;

  /// No description provided for @eventsListButtonOpenGlobal.
  ///
  /// In en, this message translates to:
  /// **'Open global timeline'**
  String get eventsListButtonOpenGlobal;

  /// No description provided for @newlyDiscoveredSemanticNew.
  ///
  /// In en, this message translates to:
  /// **'{count} new item{suffix} to explore. Scroll to new item'**
  String newlyDiscoveredSemanticNew(Object count, Object suffix);

  /// No description provided for @newlyDiscoveredLabelNew.
  ///
  /// In en, this message translates to:
  /// **'{count} new item{suffix} to explore'**
  String newlyDiscoveredLabelNew(Object count, Object suffix);

  /// No description provided for @resultsPopupEnglishContent.
  ///
  /// In en, this message translates to:
  /// **'This content is provided by the Metropolitan Museum of Art Collection API, and is only available in English.'**
  String get resultsPopupEnglishContent;

  /// No description provided for @resultsSemanticDismiss.
  ///
  /// In en, this message translates to:
  /// **'dismiss message'**
  String get resultsSemanticDismiss;

  /// No description provided for @scrollingContentSemanticYoutube.
  ///
  /// In en, this message translates to:
  /// **'Youtube thumbnail'**
  String get scrollingContentSemanticYoutube;

  /// No description provided for @scrollingContentSemanticOpen.
  ///
  /// In en, this message translates to:
  /// **'Open fullscreen maps view'**
  String get scrollingContentSemanticOpen;

  /// No description provided for @searchInputTitleSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get searchInputTitleSuggestions;

  /// No description provided for @searchInputHintSearch.
  ///
  /// In en, this message translates to:
  /// **'Search (ex. type or material)'**
  String get searchInputHintSearch;

  /// No description provided for @searchInputSemanticClear.
  ///
  /// In en, this message translates to:
  /// **'clear search'**
  String get searchInputSemanticClear;

  /// No description provided for @timelineSemanticDate.
  ///
  /// In en, this message translates to:
  /// **'{fromDate} to {endDate}'**
  String timelineSemanticDate(Object fromDate, Object endDate);

  /// No description provided for @titleLabelDate.
  ///
  /// In en, this message translates to:
  /// **'{fromDate} to {endDate}'**
  String titleLabelDate(Object fromDate, Object endDate);

  /// No description provided for @appModalsButtonOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get appModalsButtonOk;

  /// No description provided for @appModalsButtonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get appModalsButtonCancel;

  /// No description provided for @appPageDefaultTitlePage.
  ///
  /// In en, this message translates to:
  /// **'page'**
  String get appPageDefaultTitlePage;

  /// No description provided for @appPageSemanticSwipe.
  ///
  /// In en, this message translates to:
  /// **'{pageTitle} {current} of {total}.'**
  String appPageSemanticSwipe(Object pageTitle, Object current, Object total);

  /// No description provided for @semanticsPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous {title}'**
  String semanticsPrevious(Object title);

  /// No description provided for @semanticsNext.
  ///
  /// In en, this message translates to:
  /// **'Next {title}'**
  String semanticsNext(Object title);

  /// No description provided for @artifactsTitleArtifacts.
  ///
  /// In en, this message translates to:
  /// **'MARKETPLACE'**
  String get artifactsTitleArtifacts;

  /// No description provided for @artifactsSemanticsPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous marketplace'**
  String get artifactsSemanticsPrevious;

  /// No description provided for @artifactsSemanticsNext.
  ///
  /// In en, this message translates to:
  /// **'Next marketplace'**
  String get artifactsSemanticsNext;

  /// No description provided for @artifactsSemanticArtifact.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get artifactsSemanticArtifact;

  /// No description provided for @artifactsButtonBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse all marketplace'**
  String get artifactsButtonBrowse;

  /// No description provided for @artifactDetailsLabelDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get artifactDetailsLabelDate;

  /// No description provided for @artifactDetailsLabelPeriod.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get artifactDetailsLabelPeriod;

  /// No description provided for @artifactDetailsLabelGeography.
  ///
  /// In en, this message translates to:
  /// **'Geography'**
  String get artifactDetailsLabelGeography;

  /// No description provided for @artifactDetailsLabelMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get artifactDetailsLabelMedium;

  /// No description provided for @artifactDetailsLabelDimension.
  ///
  /// In en, this message translates to:
  /// **'Dimension'**
  String get artifactDetailsLabelDimension;

  /// No description provided for @artifactDetailsLabelClassification.
  ///
  /// In en, this message translates to:
  /// **'Classification'**
  String get artifactDetailsLabelClassification;

  /// No description provided for @artifactDetailsSemanticThumbnail.
  ///
  /// In en, this message translates to:
  /// **'thumbnail image'**
  String get artifactDetailsSemanticThumbnail;

  /// No description provided for @artifactDetailsErrorNotFound.
  ///
  /// In en, this message translates to:
  /// **'Unable to find info for marketplace {artifactId} '**
  String artifactDetailsErrorNotFound(Object artifactId);

  /// No description provided for @artifactsSearchTitleBrowse.
  ///
  /// In en, this message translates to:
  /// **'Browse Marketplace'**
  String get artifactsSearchTitleBrowse;

  /// No description provided for @artifactsSearchLabelNotFound.
  ///
  /// In en, this message translates to:
  /// **'No marketplace found'**
  String get artifactsSearchLabelNotFound;

  /// No description provided for @artifactsSearchButtonToggle.
  ///
  /// In en, this message translates to:
  /// **'Toggle Timeframe'**
  String get artifactsSearchButtonToggle;

  /// No description provided for @artifactsSearchSemanticTimeframe.
  ///
  /// In en, this message translates to:
  /// **'timeframe'**
  String get artifactsSearchSemanticTimeframe;

  /// No description provided for @artifactsSearchLabelFound.
  ///
  /// In en, this message translates to:
  /// **'{numFound} marketplace found, {numResults} in '**
  String artifactsSearchLabelFound(Object numFound, Object numResults);

  /// No description provided for @artifactsSearchLabelAdjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust your'**
  String get artifactsSearchLabelAdjust;

  /// No description provided for @artifactsSearchLabelSearch.
  ///
  /// In en, this message translates to:
  /// **'search terms'**
  String get artifactsSearchLabelSearch;

  /// No description provided for @artifactsSearchLabelTimeframe.
  ///
  /// In en, this message translates to:
  /// **'timeframe'**
  String get artifactsSearchLabelTimeframe;

  /// No description provided for @circleButtonsSemanticClose.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get circleButtonsSemanticClose;

  /// No description provided for @circleButtonsSemanticBack.
  ///
  /// In en, this message translates to:
  /// **'back'**
  String get circleButtonsSemanticBack;

  /// No description provided for @collectibleFoundTitleArtifactDiscovered.
  ///
  /// In en, this message translates to:
  /// **'Artifact Discovered'**
  String get collectibleFoundTitleArtifactDiscovered;

  /// No description provided for @collectibleFoundButtonViewCollection.
  ///
  /// In en, this message translates to:
  /// **'view in my collection'**
  String get collectibleFoundButtonViewCollection;

  /// No description provided for @collectibleItemSemanticCollectible.
  ///
  /// In en, this message translates to:
  /// **'collectible item'**
  String get collectibleItemSemanticCollectible;

  /// No description provided for @collectionTitleCollection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get collectionTitleCollection;

  /// No description provided for @collectionPopupResetConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reset your collection?'**
  String get collectionPopupResetConfirm;

  /// No description provided for @eightWaySemanticSwipeDetector.
  ///
  /// In en, this message translates to:
  /// **'eight-way swipe detector'**
  String get eightWaySemanticSwipeDetector;

  /// No description provided for @expandingTimeSelectorSemanticSelector.
  ///
  /// In en, this message translates to:
  /// **'time range selector'**
  String get expandingTimeSelectorSemanticSelector;

  /// No description provided for @fullscreenImageViewerSemanticFull.
  ///
  /// In en, this message translates to:
  /// **'full screen image, no description available'**
  String get fullscreenImageViewerSemanticFull;

  /// No description provided for @homeMenuButtonExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore the timeline'**
  String get homeMenuButtonExplore;

  /// No description provided for @homeMenuButtonView.
  ///
  /// In en, this message translates to:
  /// **'View your collection'**
  String get homeMenuButtonView;

  /// No description provided for @homeMenuButtonAbout.
  ///
  /// In en, this message translates to:
  /// **'About this app'**
  String get homeMenuButtonAbout;

  /// No description provided for @homeMenuAboutWonderous.
  ///
  /// In en, this message translates to:
  /// **'Wonderous is a visual showcase of eight wonders of the world. '**
  String get homeMenuAboutWonderous;

  /// No description provided for @homeMenuAboutBuilt.
  ///
  /// In en, this message translates to:
  /// **'Built with {flutterUrl} by the team at {gskinnerUrl}.'**
  String homeMenuAboutBuilt(Object flutterUrl, Object gskinnerUrl);

  /// No description provided for @homeMenuAboutLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn more at {wonderousUrl}.'**
  String homeMenuAboutLearn(Object wonderousUrl);

  /// No description provided for @homeMenuAboutSource.
  ///
  /// In en, this message translates to:
  /// **'To see the source code for this app, please visit the {githubUrl}.'**
  String homeMenuAboutSource(Object githubUrl);

  /// No description provided for @homeMenuAboutRepo.
  ///
  /// In en, this message translates to:
  /// **'Wonderous github repo'**
  String get homeMenuAboutRepo;

  /// No description provided for @homeMenuAboutFlutter.
  ///
  /// In en, this message translates to:
  /// **'Flutter'**
  String get homeMenuAboutFlutter;

  /// No description provided for @homeMenuAboutGskinner.
  ///
  /// In en, this message translates to:
  /// **'gskinner'**
  String get homeMenuAboutGskinner;

  /// No description provided for @homeMenuAboutApp.
  ///
  /// In en, this message translates to:
  /// **'wonderous.app'**
  String get homeMenuAboutApp;

  /// No description provided for @homeMenuAboutPublic.
  ///
  /// In en, this message translates to:
  /// **'Public-domain artworks from {metUrl}.'**
  String homeMenuAboutPublic(Object metUrl);

  /// No description provided for @homeMenuAboutMet.
  ///
  /// In en, this message translates to:
  /// **'The Metropolitan Museum of Art, New York'**
  String get homeMenuAboutMet;

  /// No description provided for @homeMenuAboutPhotography.
  ///
  /// In en, this message translates to:
  /// **'Photography from {unsplashUrl}.'**
  String homeMenuAboutPhotography(Object unsplashUrl);

  /// No description provided for @homeMenuAboutUnsplash.
  ///
  /// In en, this message translates to:
  /// **'Unsplash'**
  String get homeMenuAboutUnsplash;

  /// No description provided for @introTitleJourney.
  ///
  /// In en, this message translates to:
  /// **'Journey through Jharkhand'**
  String get introTitleJourney;

  /// No description provided for @introDescriptionNavigate.
  ///
  /// In en, this message translates to:
  /// **'Navigate the land of forests, waterfalls, and vibrant tribal heritage.'**
  String get introDescriptionNavigate;

  /// No description provided for @introTitleExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore landmarks'**
  String get introTitleExplore;

  /// No description provided for @introDescriptionUncover.
  ///
  /// In en, this message translates to:
  /// **'Uncover ancient temples, majestic waterfalls, and hidden caves across Jharkhand.'**
  String get introDescriptionUncover;

  /// No description provided for @introTitleDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover traditions'**
  String get introTitleDiscover;

  /// No description provided for @introDescriptionLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn about Jharkhand’s diverse tribal culture, festivals, and timeless art forms.'**
  String get introDescriptionLearn;

  /// No description provided for @introSemanticNavigate.
  ///
  /// In en, this message translates to:
  /// **'Navigate'**
  String get introSemanticNavigate;

  /// No description provided for @introSemanticSwipeLeft.
  ///
  /// In en, this message translates to:
  /// **'Swipe left to continue'**
  String get introSemanticSwipeLeft;

  /// No description provided for @introSemanticEnterApp.
  ///
  /// In en, this message translates to:
  /// **'Enter the app'**
  String get introSemanticEnterApp;

  /// No description provided for @introSemanticWonderous.
  ///
  /// In en, this message translates to:
  /// **'Wonderous'**
  String get introSemanticWonderous;

  /// No description provided for @labelledToggleSemanticToggle.
  ///
  /// In en, this message translates to:
  /// **'toggle'**
  String get labelledToggleSemanticToggle;

  /// No description provided for @photoGallerySemanticCollectible.
  ///
  /// In en, this message translates to:
  /// **'collectible!'**
  String get photoGallerySemanticCollectible;

  /// No description provided for @photoGallerySemanticFocus.
  ///
  /// In en, this message translates to:
  /// **'Photo {photoIndex} of {photoTotal}. Tap to focus.'**
  String photoGallerySemanticFocus(Object photoIndex, Object photoTotal);

  /// No description provided for @photoGallerySemanticFullscreen.
  ///
  /// In en, this message translates to:
  /// **'Photo {photoIndex} of {photoTotal}. Tap to open fullscreen view.'**
  String photoGallerySemanticFullscreen(Object photoIndex, Object photoTotal);

  /// No description provided for @eraPrehistory.
  ///
  /// In en, this message translates to:
  /// **'Prehistory'**
  String get eraPrehistory;

  /// No description provided for @eraClassical.
  ///
  /// In en, this message translates to:
  /// **'Classical Era'**
  String get eraClassical;

  /// No description provided for @eraEarlyModern.
  ///
  /// In en, this message translates to:
  /// **'Early Modern Era'**
  String get eraEarlyModern;

  /// No description provided for @eraModern.
  ///
  /// In en, this message translates to:
  /// **'Modern Era'**
  String get eraModern;

  /// No description provided for @yearBCE.
  ///
  /// In en, this message translates to:
  /// **'BCE'**
  String get yearBCE;

  /// No description provided for @yearCE.
  ///
  /// In en, this message translates to:
  /// **'CE'**
  String get yearCE;

  /// No description provided for @yearFormat.
  ///
  /// In en, this message translates to:
  /// **'{date} {era}'**
  String yearFormat(Object date, Object era);

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @timelineLabelConstruction.
  ///
  /// In en, this message translates to:
  /// **'Construction of {title} begins.'**
  String timelineLabelConstruction(Object title);

  /// No description provided for @timelineTitleGlobalTimeline.
  ///
  /// In en, this message translates to:
  /// **'Global Timeline'**
  String get timelineTitleGlobalTimeline;

  /// No description provided for @wallpaperModalSave.
  ///
  /// In en, this message translates to:
  /// **'Save this poster to your photo gallery?'**
  String get wallpaperModalSave;

  /// No description provided for @wallpaperModalSaving.
  ///
  /// In en, this message translates to:
  /// **'Saving Image. Please wait...'**
  String get wallpaperModalSaving;

  /// No description provided for @wallpaperModalSaveComplete.
  ///
  /// In en, this message translates to:
  /// **'Save complete!'**
  String get wallpaperModalSaveComplete;

  /// No description provided for @wallpaperSemanticSharePhoto.
  ///
  /// In en, this message translates to:
  /// **'share photo'**
  String get wallpaperSemanticSharePhoto;

  /// No description provided for @wallpaperSemanticTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'take photo'**
  String get wallpaperSemanticTakePhoto;

  /// No description provided for @wallpaperCheckboxShowTitle.
  ///
  /// In en, this message translates to:
  /// **'Show Title'**
  String get wallpaperCheckboxShowTitle;

  /// No description provided for @wonderDetailsTabLabelInformation.
  ///
  /// In en, this message translates to:
  /// **'information and history'**
  String get wonderDetailsTabLabelInformation;

  /// No description provided for @wonderDetailsTabLabelImages.
  ///
  /// In en, this message translates to:
  /// **'photo gallery'**
  String get wonderDetailsTabLabelImages;

  /// No description provided for @wonderDetailsTabLabelArtifacts.
  ///
  /// In en, this message translates to:
  /// **'artifacts'**
  String get wonderDetailsTabLabelArtifacts;

  /// No description provided for @wonderDetailsTabLabelEvents.
  ///
  /// In en, this message translates to:
  /// **'events'**
  String get wonderDetailsTabLabelEvents;

  /// No description provided for @wonderDetailsTabSemanticBack.
  ///
  /// In en, this message translates to:
  /// **'back to wonder selection'**
  String get wonderDetailsTabSemanticBack;

  /// No description provided for @homeSemanticOpenMain.
  ///
  /// In en, this message translates to:
  /// **'Open main menu'**
  String get homeSemanticOpenMain;

  /// No description provided for @homeSemanticWonder.
  ///
  /// In en, this message translates to:
  /// **'wonder'**
  String get homeSemanticWonder;

  /// No description provided for @chichenItzaTitle.
  ///
  /// In en, this message translates to:
  /// **'Jagannath Temple'**
  String get chichenItzaTitle;

  /// No description provided for @chichenItzaSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Lord of the Universe'**
  String get chichenItzaSubTitle;

  /// No description provided for @chichenItzaRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Puri, Odisha'**
  String get chichenItzaRegionTitle;

  /// No description provided for @chichenItzaArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Hindu'**
  String get chichenItzaArtifactCulture;

  /// No description provided for @chichenItzaArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Eastern India'**
  String get chichenItzaArtifactGeolocation;

  /// No description provided for @chichenItzaPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'The Divine Connection Between'**
  String get chichenItzaPullQuote1Top;

  /// No description provided for @chichenItzaPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Earth and the Sacred Realm'**
  String get chichenItzaPullQuote1Bottom;

  /// No description provided for @chichenItzaPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'The Jagannath Temple represents the eternal bond between devotion and divinity, where millions find spiritual solace and divine blessings.'**
  String get chichenItzaPullQuote2;

  /// No description provided for @chichenItzaPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Devotional Scripture'**
  String get chichenItzaPullQuote2Author;

  /// No description provided for @chichenItzaCallout1.
  ///
  /// In en, this message translates to:
  /// **'The temple exhibits the magnificent Kalinga architectural style, featuring a towering spire that dominates the skyline of Puri and serves as a beacon for pilgrims.'**
  String get chichenItzaCallout1;

  /// No description provided for @chichenItzaCallout2.
  ///
  /// In en, this message translates to:
  /// **'The temple complex covers a substantial area and houses the famous wooden deities of Lord Jagannath, Balabhadra, and Subhadra on the jeweled throne (Ratna Simhasana).'**
  String get chichenItzaCallout2;

  /// No description provided for @chichenItzaVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'Jagannath Temple: Sacred Journey and Divine Architecture of Puri'**
  String get chichenItzaVideoCaption;

  /// No description provided for @chichenItzaMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Jagannath Temple in Puri, Odisha, on the eastern coast of India.'**
  String get chichenItzaMapCaption;

  /// No description provided for @chichenItzaHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'The Jagannath Temple is a Hindu temple dedicated to Lord Jagannath, a form of Vishnu, located in Puri, Odisha. The present temple was constructed in the 12th century by King Anantavarman Chodaganga Deva of the Eastern Ganga dynasty. According to temple records, the original temple was built by the legendary King Indradyumna of Avanti.'**
  String get chichenItzaHistoryInfo1;

  /// No description provided for @chichenItzaHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The temple is one of the four sacred Char Dham pilgrimage sites in Hinduism, along with Dwarka, Badrinath, and Rameswaram. It has been a major center of Vaishnavism for over a thousand years and attracts millions of devotees annually, especially during the world-famous Rath Yatra festival.'**
  String get chichenItzaHistoryInfo2;

  /// No description provided for @chichenItzaConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'The temple showcases the classic Kalinga architectural style with its towering spire (vimana) built in the Nagara style Rekha deula and the assembly hall (jagamohana) in Pidha deula style. The main structure stands on a raised platform in the center of an inner courtyard and features intricate stone carvings.'**
  String get chichenItzaConstructionInfo1;

  /// No description provided for @chichenItzaConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'The temple complex includes the main shrine housing the wooden deities on the Ratna Simhasana (jeweled throne), along with multiple smaller temples and structures. The famous wooden idols of Jagannath, Balabhadra, and Subhadra are unique in their abstract, stylized forms and are renewed in a sacred ceremony called Nabakalebara.'**
  String get chichenItzaConstructionInfo2;

  /// No description provided for @chichenItzaLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'The Jagannath Temple is located in Puri, a coastal city in Odisha state on India\'s eastern seaboard. The temple sits near the Bay of Bengal, making it easily accessible to pilgrims from across India and beyond.'**
  String get chichenItzaLocationInfo1;

  /// No description provided for @chichenItzaLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'Puri is well-connected by road, rail, and air, with the temple serving as the spiritual and cultural heart of the city. The annual Rath Yatra procession moves through the Grand Road (Bada Danda) to the Gundicha Temple, covering a distance that becomes a sacred pathway for millions of devotees.'**
  String get chichenItzaLocationInfo2;

  /// No description provided for @chichenItza600ce.
  ///
  /// In en, this message translates to:
  /// **'Ancient period: Early establishment of Jagannath worship in the region, with roots in tribal and Vedic traditions.'**
  String get chichenItza600ce;

  /// No description provided for @chichenItza832ce.
  ///
  /// In en, this message translates to:
  /// **'Medieval period: Development of organized temple worship and construction of earlier temple structures on the site.'**
  String get chichenItza832ce;

  /// No description provided for @chichenItza998ce.
  ///
  /// In en, this message translates to:
  /// **'Continued expansion and establishment of the temple as a major pilgrimage center in eastern India.'**
  String get chichenItza998ce;

  /// No description provided for @chichenItza1100ce.
  ///
  /// In en, this message translates to:
  /// **'12th century: Construction of the present temple structure begins under King Anantavarman Chodaganga Deva.'**
  String get chichenItza1100ce;

  /// No description provided for @chichenItza1527ce.
  ///
  /// In en, this message translates to:
  /// **'Mughal period: Temple faces challenges but maintains its religious significance and devotional practices.'**
  String get chichenItza1527ce;

  /// No description provided for @chichenItza1535ce.
  ///
  /// In en, this message translates to:
  /// **'1558 CE: First recorded Rath Yatra festival begins, establishing the annual chariot procession tradition that continues today.'**
  String get chichenItza1535ce;

  /// No description provided for @chichenItzaCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Sacred Tulsi Beads'**
  String get chichenItzaCollectible1Title;

  /// No description provided for @chichenItzaCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'jewelry'**
  String get chichenItzaCollectible1Icon;

  /// No description provided for @chichenItzaCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Temple Bell Ornament'**
  String get chichenItzaCollectible2Title;

  /// No description provided for @chichenItzaCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'jewelry'**
  String get chichenItzaCollectible2Icon;

  /// No description provided for @chichenItzaCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Pattachitra Painting'**
  String get chichenItzaCollectible3Title;

  /// No description provided for @chichenItzaCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'picture'**
  String get chichenItzaCollectible3Icon;

  /// No description provided for @christRedeemerTitle.
  ///
  /// In en, this message translates to:
  /// **'Betla National Park'**
  String get christRedeemerTitle;

  /// No description provided for @christRedeemerSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Wildlife Sanctuary and Tiger Reserve'**
  String get christRedeemerSubTitle;

  /// No description provided for @christRedeemerRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Latehar District, Jharkhand'**
  String get christRedeemerRegionTitle;

  /// No description provided for @christRedeemerArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Eastern India'**
  String get christRedeemerArtifactGeolocation;

  /// No description provided for @christRedeemerPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'A Perfect Union Between'**
  String get christRedeemerPullQuote1Top;

  /// No description provided for @christRedeemerPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Wildlife and Conservation'**
  String get christRedeemerPullQuote1Bottom;

  /// No description provided for @christRedeemerPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'Stepping into Betla is like entering a different realm where majestic predators like tigers, leopards, wolves, and wild dogs roam.'**
  String get christRedeemerPullQuote2;

  /// No description provided for @christRedeemerPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Wildlife Guide'**
  String get christRedeemerPullQuote2Author;

  /// No description provided for @christRedeemerCallout1.
  ///
  /// In en, this message translates to:
  /// **'Betla is an acronym for Bison, Elephant, Tiger, Leopard, and Axis-axis, representing the diverse wildlife found in the park.'**
  String get christRedeemerCallout1;

  /// No description provided for @christRedeemerCallout2.
  ///
  /// In en, this message translates to:
  /// **'It was one of the first nine tiger reserves created in India under Project Tiger in 1973, and declared a national park in 1986, spreading over 226.32 square kilometers.'**
  String get christRedeemerCallout2;

  /// No description provided for @christRedeemerVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'Betla National Park: Wildlife Safari and Conservation in Jharkhand'**
  String get christRedeemerVideoCaption;

  /// No description provided for @christRedeemerMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Betla National Park in Latehar and Palamu districts, Jharkhand.'**
  String get christRedeemerMapCaption;

  /// No description provided for @christRedeemerHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'Betla National Park was originally established as Palamau Wildlife Sanctuary and later became part of the Palamau Tiger Reserve when Project Tiger was launched in 1973. The region has been inhabited for centuries by indigenous tribes like the Oraon and Munda, who have coexisted with the wildlife.'**
  String get christRedeemerHistoryInfo1;

  /// No description provided for @christRedeemerHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The park gained prominence as one of the first nine tiger reserves in India under Project Tiger initiative. It has the distinction of being the first sanctuary in the world where certain tiger conservation milestones were achieved. The area was upgraded from a wildlife sanctuary to a national park status in 1986.'**
  String get christRedeemerHistoryInfo2;

  /// No description provided for @christRedeemerConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'The park is located on the Chota Nagpur Plateau with an average elevation of about 1000 feet. It falls within the Indo-Malayan biogeographic realm and boasts remarkable diversity of flora and fauna across its varied terrain of forests, hills, valleys, and grasslands.'**
  String get christRedeemerConstructionInfo1;

  /// No description provided for @christRedeemerConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'Infrastructure within the park includes watch towers, ground hides for wildlife viewing, safari routes for jeeps and elephant rides, and visitor facilities. The park is designed to provide multiple opportunities for wildlife observation while maintaining conservation protocols.'**
  String get christRedeemerConstructionInfo2;

  /// No description provided for @christRedeemerLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Betla National Park is located in the Latehar and Palamu districts of Jharkhand, approximately 170 kilometers from Ranchi. It is situated in the Chota Nagpur Plateau region, surrounded by lush green forests, hills, valleys, and waterfalls.'**
  String get christRedeemerLocationInfo1;

  /// No description provided for @christRedeemerLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'The park forms the core area of the larger Palamau Tiger Reserve, which covers a total area of 1,129.93 square kilometers. The location provides a natural habitat for diverse wildlife in the heart of Jharkhand\'s tribal belt.'**
  String get christRedeemerLocationInfo2;

  /// No description provided for @christRedeemer1850ce.
  ///
  /// In en, this message translates to:
  /// **'Indigenous tribes like Oraon and Munda have inhabited the region for centuries, living in harmony with the diverse wildlife of the area.'**
  String get christRedeemer1850ce;

  /// No description provided for @christRedeemer1921ce.
  ///
  /// In en, this message translates to:
  /// **'Early wildlife surveys and documentation of the region\'s biodiversity begin, recognizing the area\'s potential for conservation.'**
  String get christRedeemer1921ce;

  /// No description provided for @christRedeemer1922ce.
  ///
  /// In en, this message translates to:
  /// **'The region gains attention from colonial forest administration for its rich wildlife and forest resources.'**
  String get christRedeemer1922ce;

  /// No description provided for @christRedeemer1926ce.
  ///
  /// In en, this message translates to:
  /// **'Systematic wildlife management and protection measures begin to be implemented in the region.'**
  String get christRedeemer1926ce;

  /// No description provided for @christRedeemer1931ce.
  ///
  /// In en, this message translates to:
  /// **'The area is formally recognized as requiring special protection due to its unique ecosystem and wildlife population.'**
  String get christRedeemer1931ce;

  /// No description provided for @christRedeemer2006ce.
  ///
  /// In en, this message translates to:
  /// **'Continued conservation efforts and modernization of park facilities, including improved safari infrastructure and visitor amenities.'**
  String get christRedeemer2006ce;

  /// No description provided for @christRedeemerCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Tiger Pugmark Cast'**
  String get christRedeemerCollectible1Title;

  /// No description provided for @christRedeemerCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'statue'**
  String get christRedeemerCollectible1Icon;

  /// No description provided for @christRedeemerCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Medicinal Plant Collection'**
  String get christRedeemerCollectible2Title;

  /// No description provided for @christRedeemerCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'jewelry'**
  String get christRedeemerCollectible2Icon;

  /// No description provided for @christRedeemerCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Tribal Handicrafts'**
  String get christRedeemerCollectible3Title;

  /// No description provided for @christRedeemerCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'textile'**
  String get christRedeemerCollectible3Icon;

  /// No description provided for @colosseumTitle.
  ///
  /// In en, this message translates to:
  /// **'Parasnath Hill'**
  String get colosseumTitle;

  /// No description provided for @colosseumSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Sammed Shikhar'**
  String get colosseumSubTitle;

  /// No description provided for @colosseumRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Giridih, Jharkhand'**
  String get colosseumRegionTitle;

  /// No description provided for @colosseumArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Jain'**
  String get colosseumArtifactCulture;

  /// No description provided for @colosseumArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Eastern India'**
  String get colosseumArtifactGeolocation;

  /// No description provided for @colosseumPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'Sacred Peak Where Twenty'**
  String get colosseumPullQuote1Top;

  /// No description provided for @colosseumPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Tirthankaras Attained Moksha'**
  String get colosseumPullQuote1Bottom;

  /// No description provided for @colosseumPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'Sammed Shikhar represents the ultimate spiritual destination where divine souls achieved liberation through meditation and detachment from worldly bonds.'**
  String get colosseumPullQuote2;

  /// No description provided for @colosseumPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Jain Scripture'**
  String get colosseumPullQuote2Author;

  /// No description provided for @colosseumCallout1.
  ///
  /// In en, this message translates to:
  /// **'It is the holiest pilgrimage site for Jains, where 20 out of 24 Tirthankaras attained Moksha (salvation), including the 23rd Tirthankara Lord Parshvanatha who achieved liberation here in 772 BCE.'**
  String get colosseumCallout1;

  /// No description provided for @colosseumCallout2.
  ///
  /// In en, this message translates to:
  /// **'At 1,370 meters (4,480 feet), it is the highest peak in Jharkhand state and houses 32 ancient temples with exquisite stone carvings depicting Jain spiritual teachings and mythology.'**
  String get colosseumCallout2;

  /// No description provided for @colosseumVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'Sammed Shikhar: Sacred Journey to Jain Pilgrimage Site on Parasnath Hill'**
  String get colosseumVideoCaption;

  /// No description provided for @colosseumMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Parasnath Hill in Giridih district, Jharkhand, Eastern India'**
  String get colosseumMapCaption;

  /// No description provided for @colosseumHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'Parasnath Hill, also known as Sammed Shikhar (Peak of Concentration), is an ancient Jain pilgrimage site with archaeological evidence indicating Jain presence dating back to at least 1500 BCE. The earliest literary reference appears in the Jñātṛdhārmakātha, compiled in the 6th century BCE.'**
  String get colosseumHistoryInfo1;

  /// No description provided for @colosseumHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The site derives its name from Lord Parshvanatha, the 23rd Tirthankara, who attained Moksha here in 772 BCE. Throughout history, it has remained the most sacred Jain tirth (pilgrimage site), continuously drawing devotees seeking spiritual liberation and enlightenment.'**
  String get colosseumHistoryInfo2;

  /// No description provided for @colosseumConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'The temple complex showcases magnificent Jain architecture built primarily in the 18th century, featuring 32 temples distributed across the hill. The structures display intricate stone carvings, beautiful murals on temple walls, and delicately carved sculptures that depict Jain religious tenets.'**
  String get colosseumConstructionInfo1;

  /// No description provided for @colosseumConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'The temples feature distinctive arched gateway structures and elaborate wall carvings that narrate stories of spiritual Jain teachers. At the base in Madhuvan, there are eight main temples, two Dadawadis (pilgrimage rest houses), and the temple of Bhomiyaji Maharaja, creating a divine architectural ensemble.'**
  String get colosseumConstructionInfo2;

  /// No description provided for @colosseumLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Parasnath Hill is located in the Giridih district of Jharkhand state in eastern India, rising to 1,370 meters as the highest mountain in the state. It lies on the NH-2 Delhi-Kolkata highway section of the historic Grand Trunk Road.'**
  String get colosseumLocationInfo1;

  /// No description provided for @colosseumLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'The hill is part of the Parasnath Wildlife Sanctuary, a protected area that preserves both the natural ecosystem and sacred Jain heritage. The site is accessible to pilgrims from across India and internationally, serving as the spiritual heart of global Jainism.'**
  String get colosseumLocationInfo2;

  /// No description provided for @colosseum70ce.
  ///
  /// In en, this message translates to:
  /// **'1500 BCE: Archaeological evidence indicates the earliest Jain presence on Parasnath Hill, establishing it as an ancient center of Jain spirituality and meditation.'**
  String get colosseum70ce;

  /// No description provided for @colosseum82ce.
  ///
  /// In en, this message translates to:
  /// **'772 BCE: Lord Parshvanatha, the 23rd Tirthankara, attains Moksha (salvation) on the hill, giving the site its sacred name and establishing its supreme religious significance.'**
  String get colosseum82ce;

  /// No description provided for @colosseum1140ce.
  ///
  /// In en, this message translates to:
  /// **'6th century BCE: The Jñātṛdhārmakātha, one of the twelve core Jain texts, makes the earliest literary reference to Shikharji as a sacred tirth (pilgrimage site).'**
  String get colosseum1140ce;

  /// No description provided for @colosseum1490ce.
  ///
  /// In en, this message translates to:
  /// **'12th century: Historical records indicate continued religious activities and temple maintenance, with the site serving as an established pilgrimage center.'**
  String get colosseum1490ce;

  /// No description provided for @colosseum1829ce.
  ///
  /// In en, this message translates to:
  /// **'18th century: Major temple construction period begins, with the current architectural complex of 32 temples being built, featuring the distinctive Jain architectural style with intricate carvings.'**
  String get colosseum1829ce;

  /// No description provided for @colosseum1990ce.
  ///
  /// In en, this message translates to:
  /// **'Modern era: The site continues to attract millions of Jain pilgrims annually and is recognized as a protected wildlife sanctuary, balancing religious heritage with environmental conservation.'**
  String get colosseum1990ce;

  /// No description provided for @colosseumCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Jain Prayer Beads (Mala)'**
  String get colosseumCollectible1Title;

  /// No description provided for @colosseumCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'jewelry'**
  String get colosseumCollectible1Icon;

  /// No description provided for @colosseumCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Tirthankara Sculpture'**
  String get colosseumCollectible2Title;

  /// No description provided for @colosseumCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'statue'**
  String get colosseumCollectible2Icon;

  /// No description provided for @colosseumCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Jain Manuscript Palm Leaf'**
  String get colosseumCollectible3Title;

  /// No description provided for @colosseumCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'picture'**
  String get colosseumCollectible3Icon;

  /// No description provided for @greatWallTitle.
  ///
  /// In en, this message translates to:
  /// **'Patratu Valley'**
  String get greatWallTitle;

  /// No description provided for @greatWallSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Industrial Heritage & Natural Beauty'**
  String get greatWallSubTitle;

  /// No description provided for @greatWallRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Ramgarh District, Jharkhand'**
  String get greatWallRegionTitle;

  /// No description provided for @greatWallArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Scenic Valley with Thermal Power Heritage '**
  String get greatWallArtifactCulture;

  /// No description provided for @greatWallArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Eastern India'**
  String get greatWallArtifactGeolocation;

  /// No description provided for @greatWallPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'A Perfect Blend of'**
  String get greatWallPullQuote1Top;

  /// No description provided for @greatWallPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Nature and Industry'**
  String get greatWallPullQuote1Bottom;

  /// No description provided for @greatWallPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'The journey from Ranchi is an adventure in itself with twisting ways providing you an unmatched scenery.'**
  String get greatWallPullQuote2;

  /// No description provided for @greatWallPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'MakeMyTrip Travel Guide'**
  String get greatWallPullQuote2Author;

  /// No description provided for @greatWallCallout1.
  ///
  /// In en, this message translates to:
  /// **'The Patratu Thermal Power Station was built with Russian collaboration in 1962 and has a power generation capacity of 840MW.'**
  String get greatWallCallout1;

  /// No description provided for @greatWallCallout2.
  ///
  /// In en, this message translates to:
  /// **'The Patratu Dam was constructed on the Nalkari River with a total storage capacity of 81 square miles to supply water to the thermal power station.'**
  String get greatWallCallout2;

  /// No description provided for @greatWallVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'Patratu Valley: Where Industry Meets Nature in Jharkhand\'s Beautiful Landscape'**
  String get greatWallVideoCaption;

  /// No description provided for @greatWallMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Patratu Valley in Ramgarh District, Jharkhand, about one hour from Ranchi.'**
  String get greatWallMapCaption;

  /// No description provided for @greatWallHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'Patratu Valley is located in Ramgarh district of Jharkhand state in eastern India. The area developed as a residential town for employees of the Patratu Thermal Power Station, which was established through Russian collaboration in 1962. The valley is known for its lush green terrains and the dam built upon the Nalkari River.'**
  String get greatWallHistoryInfo1;

  /// No description provided for @greatWallHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The thermal power station has four chimneys - two built by a Russian firm (called the Russian side) and two by an Indian firm (the Indian side). The dam serves as the main water reservoir for the power plant and has become a popular tourist destination, particularly during winter months when large numbers of visitors come for picnics.'**
  String get greatWallHistoryInfo2;

  /// No description provided for @greatWallConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'The Patratu Dam was constructed in 1962 on the Nalkari River, located 30 km west of Ramgarh. Water from the river and from waterfalls of the surrounding hills is stored in this dam. The construction was specifically designed to supply water to the Patratu Thermal Power Station\'s operations.'**
  String get greatWallConstructionInfo1;

  /// No description provided for @greatWallConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'The thermal power plant construction involved both Russian and Indian engineering expertise. The facility includes residential areas for employees and supporting infrastructure. A circuit house was built beside the dam, and the area features temples including the Panchawahini temple adjacent to the dam.'**
  String get greatWallConstructionInfo2;

  /// No description provided for @greatWallLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Patratu Valley lies in the Ramgarh district of Jharkhand, accessible via a scenic hour-long drive from Ranchi. The valley features twisting roads with hairpin bends that provide spectacular views, especially when seen from above. The location offers panoramic views of the surrounding hills and the expansive dam.'**
  String get greatWallLocationInfo1;

  /// No description provided for @greatWallLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'The valley serves multiple purposes beyond power generation - it has become a significant tourist destination offering boat rides, picnic spots, and temple visits. The area includes the Maa Panchwahini Mandir and Mata Rani Mandir temples, and provides access to local eateries serving traditional Jharkhandi cuisine.'**
  String get greatWallLocationInfo2;

  /// No description provided for @greatWall700bce.
  ///
  /// In en, this message translates to:
  /// **'1962 CE: The foundation of modern Patratu was laid with the establishment of the thermal power station through Russian collaboration, marking the beginning of the area\'s transformation from a rural valley to an industrial township.'**
  String get greatWall700bce;

  /// No description provided for @greatWall214bce.
  ///
  /// In en, this message translates to:
  /// **'1962 CE: Construction of the Patratu Dam was completed on the Nalkari River, creating an 81 square mile water reservoir to supply the newly built thermal power station, fundamentally changing the landscape of the valley.'**
  String get greatWall214bce;

  /// No description provided for @greatWall121bce.
  ///
  /// In en, this message translates to:
  /// **'1970s CE: Development of residential areas for power plant employees led to the growth of Patratu as a planned township, with infrastructure including housing, schools, and community facilities being established over a 20-year period.'**
  String get greatWall121bce;

  /// No description provided for @greatWall556ce.
  ///
  /// In en, this message translates to:
  /// **'1980s-1990s CE: The area began gaining recognition as a tourist destination, with the Jharkhand Tourism Department developing facilities including the tourist complex at Patratu Lake and promoting it as a scenic getaway from urban centers.'**
  String get greatWall556ce;

  /// No description provided for @greatWall618ce.
  ///
  /// In en, this message translates to:
  /// **'2000s CE: Patratu Valley saw increased tourism development with improved road access and facilities, though the thermal power station faced periods of reduced operation and maintenance challenges in later decades.'**
  String get greatWall618ce;

  /// No description provided for @greatWall1487ce.
  ///
  /// In en, this message translates to:
  /// **'2020s CE: Modern tourism initiatives by the Jharkhand government have focused on developing the waterfront and making the valley more attractive to visitors, while plans for expanding power generation capacity continue to be considered.'**
  String get greatWall1487ce;

  /// No description provided for @greatWallCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Patratu Dam Waters'**
  String get greatWallCollectible1Title;

  /// No description provided for @greatWallCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'water'**
  String get greatWallCollectible1Icon;

  /// No description provided for @greatWallCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Thermal Power Station Model'**
  String get greatWallCollectible2Title;

  /// No description provided for @greatWallCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'industry'**
  String get greatWallCollectible2Icon;

  /// No description provided for @greatWallCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Panchawahini Temple Offering'**
  String get greatWallCollectible3Title;

  /// No description provided for @greatWallCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'temple'**
  String get greatWallCollectible3Icon;

  /// No description provided for @machuPicchuTitle.
  ///
  /// In en, this message translates to:
  /// **'Hundru Falls'**
  String get machuPicchuTitle;

  /// No description provided for @machuPicchuSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Jharkhand\'s Highest Waterfall'**
  String get machuPicchuSubTitle;

  /// No description provided for @machuPicchuRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Ranchi District, Jharkhand'**
  String get machuPicchuRegionTitle;

  /// No description provided for @machuPicchuArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Natural Wonder'**
  String get machuPicchuArtifactCulture;

  /// No description provided for @machuPicchuArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Eastern India'**
  String get machuPicchuArtifactGeolocation;

  /// No description provided for @machuPicchuPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'A Spectacular Scene of Water'**
  String get machuPicchuPullQuote1Top;

  /// No description provided for @machuPicchuPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Falling from Great Height'**
  String get machuPicchuPullQuote1Bottom;

  /// No description provided for @machuPicchuPullQuote1Author.
  ///
  /// In en, this message translates to:
  /// **'Government of Jharkhand'**
  String get machuPicchuPullQuote1Author;

  /// No description provided for @machuPicchuPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'The cascading water creates a misty ambience and forms a frothy pool at the base, which is an exhilarating sight for visitors.'**
  String get machuPicchuPullQuote2;

  /// No description provided for @machuPicchuPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Travel Guide'**
  String get machuPicchuPullQuote2Author;

  /// No description provided for @machuPicchuCallout1.
  ///
  /// In en, this message translates to:
  /// **'The waterfall falls from a height of 98 metres (322 feet), making it one of the highest waterfalls in Jharkhand state and the 34th highest waterfall in India.'**
  String get machuPicchuCallout1;

  /// No description provided for @machuPicchuCallout2.
  ///
  /// In en, this message translates to:
  /// **'The different formations of rock due to water erosion create various shapes and niches, lending an almost otherworldly feel to the landscape.'**
  String get machuPicchuCallout2;

  /// No description provided for @machuPicchuVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'Hundru Falls: Nature\'s Spectacular Display in Jharkhand'**
  String get machuPicchuVideoCaption;

  /// No description provided for @machuPicchuMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Hundru Falls on the Subarnarekha River in Ranchi District, Jharkhand.'**
  String get machuPicchuMapCaption;

  /// No description provided for @machuPicchuHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'Hundru Falls is a natural waterfall located in Ranchi district of Jharkhand state in eastern India. The waterfall is formed by the Subarnarekha River, which originates near Piska/Nagri and flows through several districts before joining the Bay of Bengal.'**
  String get machuPicchuHistoryInfo1;

  /// No description provided for @machuPicchuHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The waterfall represents a geological feature called a knickpoint, caused by rejuvenation. This break in the river\'s gradient allows water to fall vertically, creating the spectacular waterfall that has become one of Jharkhand\'s most popular tourist destinations.'**
  String get machuPicchuHistoryInfo2;

  /// No description provided for @machuPicchuConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'The waterfall is a natural geological formation created by the erosion patterns of the Subarnarekha River over thousands of years. The rocky terrain around the falls has been shaped by continuous water flow, creating unique rock formations and natural pools.'**
  String get machuPicchuConstructionInfo1;

  /// No description provided for @machuPicchuConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'The base of the waterfall features a natural pool that serves as both a scenic attraction and a popular bathing spot for visitors. The surrounding landscape is characterized by lush forests and rocky terrain that provides natural beauty and biodiversity.'**
  String get machuPicchuConstructionInfo2;

  /// No description provided for @machuPicchuLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Hundru Falls is situated in the Ranchi district of Jharkhand, approximately 45 kilometers from Ranchi city. The waterfall is easily accessible by road and is located in the village of Hundru, making it a popular destination for day trips and picnics.'**
  String get machuPicchuLocationInfo1;

  /// No description provided for @machuPicchuLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'The surrounding area is characterized by dense forests and rocky terrain. The Subarnarekha River continues its journey from here through multiple states including Jharkhand, West Bengal, and Odisha before ultimately reaching the Bay of Bengal at Talsari.'**
  String get machuPicchuLocationInfo2;

  /// No description provided for @machuPicchu1438ce.
  ///
  /// In en, this message translates to:
  /// **'Natural formation of the waterfall begins through geological processes and river erosion over millennia.'**
  String get machuPicchu1438ce;

  /// No description provided for @machuPicchu1572ce.
  ///
  /// In en, this message translates to:
  /// **'Local tribal communities and residents of the region have known about the waterfall for generations, using it as a water source and gathering place.'**
  String get machuPicchu1572ce;

  /// No description provided for @machuPicchu1867ce.
  ///
  /// In en, this message translates to:
  /// **'The waterfall begins to gain recognition beyond local communities as transportation and communication improve in the region.'**
  String get machuPicchu1867ce;

  /// No description provided for @machuPicchu1911ce.
  ///
  /// In en, this message translates to:
  /// **'Post-independence development of Jharkhand region brings increased awareness of natural attractions like Hundru Falls.'**
  String get machuPicchu1911ce;

  /// No description provided for @machuPicchu1964ce.
  ///
  /// In en, this message translates to:
  /// **'Tourism infrastructure begins to develop around the waterfall, making it more accessible to visitors from other regions.'**
  String get machuPicchu1964ce;

  /// No description provided for @machuPicchu1997ce.
  ///
  /// In en, this message translates to:
  /// **'Hundru Falls becomes established as one of Jharkhand\'s premier tourist destinations, attracting nature lovers and adventure seekers from across India.'**
  String get machuPicchu1997ce;

  /// No description provided for @machuPicchuCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'River Stone Collection'**
  String get machuPicchuCollectible1Title;

  /// No description provided for @machuPicchuCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'stone'**
  String get machuPicchuCollectible1Icon;

  /// No description provided for @machuPicchuCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Forest Flora Sample'**
  String get machuPicchuCollectible2Title;

  /// No description provided for @machuPicchuCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'leaf'**
  String get machuPicchuCollectible2Icon;

  /// No description provided for @machuPicchuCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Water Crystal Formation'**
  String get machuPicchuCollectible3Title;

  /// No description provided for @machuPicchuCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'crystal'**
  String get machuPicchuCollectible3Icon;

  /// No description provided for @petraTitle.
  ///
  /// In en, this message translates to:
  /// **'Tapovan Caves'**
  String get petraTitle;

  /// No description provided for @petraSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Forest of Meditation'**
  String get petraSubTitle;

  /// No description provided for @petraRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Deoghar, Jharkhand'**
  String get petraRegionTitle;

  /// No description provided for @petraArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Hindu'**
  String get petraArtifactCulture;

  /// No description provided for @petraArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Eastern India'**
  String get petraArtifactGeolocation;

  /// No description provided for @petraPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'Sacred Caves Where Sage'**
  String get petraPullQuote1Top;

  /// No description provided for @petraPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Valmiki Found Divine Solitude'**
  String get petraPullQuote1Bottom;

  /// No description provided for @petraPullQuote1Author.
  ///
  /// In en, this message translates to:
  /// **'Ancient Hindu Tradition'**
  String get petraPullQuote1Author;

  /// No description provided for @petraPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'Tapovan represents the eternal quest for spiritual enlightenment, where meditation transforms the seeker into the divine.'**
  String get petraPullQuote2;

  /// No description provided for @petraPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Hindu Scripture'**
  String get petraPullQuote2Author;

  /// No description provided for @petraCallout1.
  ///
  /// In en, this message translates to:
  /// **'The name \'Tapovan\' translates to \'forest of meditation\' in Sanskrit, reflecting the spiritual aura permeating this sacred site where ancient sages sought enlightenment.'**
  String get petraCallout1;

  /// No description provided for @petraCallout2.
  ///
  /// In en, this message translates to:
  /// **'These historic caves carved into the hills feature intricate sculptures and quiet interiors, providing fascinating insights into the region\'s rich spiritual heritage and meditative traditions.'**
  String get petraCallout2;

  /// No description provided for @petraVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'Tapovan Caves: Sacred Meditation Retreat in the Hills of Deoghar, Jharkhand'**
  String get petraVideoCaption;

  /// No description provided for @petraMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Tapovan Caves, 10 kilometers from Deoghar in Jharkhand, Eastern India'**
  String get petraMapCaption;

  /// No description provided for @petraHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'Tapovan Caves have been a spiritual sanctuary for thousands of years, with legends dating back to the Treta Yuga when Lord Rama, Sita, and Lakshmana are believed to have stayed here during their 14-year exile. The caves derive their sacred significance from being the meditation retreat of Sage Valmiki, the composer of the Ramayana.'**
  String get petraHistoryInfo1;

  /// No description provided for @petraHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The site gained prominence as a center for intense spiritual practice (tapas) when Sage Valmiki came here to do penance for his past wrongdoings and later composed parts of the Ramayana in these very caves. Throughout history, numerous saints and ascetics have found solitude and enlightenment in these tranquil surroundings.'**
  String get petraHistoryInfo2;

  /// No description provided for @petraConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'The Tapovan Caves are naturally formed caverns enhanced with carved elements, featuring the sacred Taponath Mahadeva temple at the summit. Inside one of the main caves, a naturally formed Shiva lingam has been installed, creating a powerful spiritual focal point for devotees and pilgrims.'**
  String get petraConstructionInfo1;

  /// No description provided for @petraConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'The cave complex showcases intricate stone sculptures and carvings that depict various Hindu deities and spiritual symbols. The architectural elements blend natural rock formations with human craftsmanship, creating spaces perfectly suited for meditation and spiritual contemplation amidst the hill\'s serene environment.'**
  String get petraConstructionInfo2;

  /// No description provided for @petraLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Tapovan Caves are located 10 kilometers from Deoghar in Jharkhand state, Eastern India. The site is nestled in the hills surrounding the holy city of Deoghar, which is famous for the Baidyanath Temple, one of the twelve Jyotirlingas.'**
  String get petraLocationInfo1;

  /// No description provided for @petraLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'The caves are situated on a hill that can be reached by a 30-minute trek from the base, making them a popular destination for both pilgrims seeking spiritual solace and adventure enthusiasts. The location offers panoramic views of the surrounding landscape and maintains its ancient atmosphere of tranquility.'**
  String get petraLocationInfo2;

  /// No description provided for @petra1200bce.
  ///
  /// In en, this message translates to:
  /// **'Treta Yuga: According to Hindu tradition, Lord Rama, Sita, and Lakshmana stayed in these caves during their 14-year exile, establishing the site\'s initial sacred significance.'**
  String get petra1200bce;

  /// No description provided for @petra106bce.
  ///
  /// In en, this message translates to:
  /// **'Ancient Period: Sage Valmiki arrives at Tapovan to perform penance for his past deeds, later composing portions of the Ramayana while meditating in these caves.'**
  String get petra106bce;

  /// No description provided for @petra551ce.
  ///
  /// In en, this message translates to:
  /// **'Medieval Period: The caves continue to attract saints and ascetics, with various spiritual masters using the site for intense meditation and tapas (spiritual austerities).'**
  String get petra551ce;

  /// No description provided for @petra1812ce.
  ///
  /// In en, this message translates to:
  /// **'19th Century: Saint Balananda Brahmachari performs intense tapas for more than 50 years at Tapovan, achieving spiritual siddhis (supernatural powers) through his dedication.'**
  String get petra1812ce;

  /// No description provided for @petra1958ce.
  ///
  /// In en, this message translates to:
  /// **'Modern Era: Sri Balananda Brahmachari and other spiritual masters establish the site\'s reputation as a powerful center for achieving spiritual enlightenment and divine realization.'**
  String get petra1958ce;

  /// No description provided for @petra1989ce.
  ///
  /// In en, this message translates to:
  /// **'Contemporary Period: The site becomes recognized as an important pilgrimage destination, attracting devotees from across India while maintaining its pristine spiritual atmosphere.'**
  String get petra1989ce;

  /// No description provided for @petraCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Sacred Rudraksha Beads'**
  String get petraCollectible1Title;

  /// No description provided for @petraCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'jewelry'**
  String get petraCollectible1Icon;

  /// No description provided for @petraCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Shiva Lingam Stone'**
  String get petraCollectible2Title;

  /// No description provided for @petraCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'statue'**
  String get petraCollectible2Icon;

  /// No description provided for @petraCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Palm Leaf Sanskrit Manuscript'**
  String get petraCollectible3Title;

  /// No description provided for @petraCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'picture'**
  String get petraCollectible3Icon;

  /// No description provided for @pyramidsGizaTitle.
  ///
  /// In en, this message translates to:
  /// **'Tagore Hill'**
  String get pyramidsGizaTitle;

  /// No description provided for @pyramidsGizaSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Morabadi Hill of Literary Heritage'**
  String get pyramidsGizaSubTitle;

  /// No description provided for @pyramidsGizaRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Ranchi, Jharkhand'**
  String get pyramidsGizaRegionTitle;

  /// No description provided for @pyramidsGizaArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Bengali Literary'**
  String get pyramidsGizaArtifactCulture;

  /// No description provided for @pyramidsGizaArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Eastern India'**
  String get pyramidsGizaArtifactGeolocation;

  /// No description provided for @pyramidsGizaPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'Where Nature\'s Beauty Inspired'**
  String get pyramidsGizaPullQuote1Top;

  /// No description provided for @pyramidsGizaPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'The Tagore Family\'s Literary Spirit'**
  String get pyramidsGizaPullQuote1Bottom;

  /// No description provided for @pyramidsGizaPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'The serene hilltop became a sanctuary where literary genius found solace amidst nature\'s grandeur, creating a lasting bond between art and landscape.'**
  String get pyramidsGizaPullQuote2;

  /// No description provided for @pyramidsGizaPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Literary Heritage'**
  String get pyramidsGizaPullQuote2Author;

  /// No description provided for @pyramidsGizaCallout1.
  ///
  /// In en, this message translates to:
  /// **'Standing 300 meters (900 feet) high and located just 4 kilometers from Albert Ekka Chowk, this scenic hilltop offers breathtaking sunrise and sunset views that captivated the Tagore family.'**
  String get pyramidsGizaCallout1;

  /// No description provided for @pyramidsGizaCallout2.
  ///
  /// In en, this message translates to:
  /// **'The hill houses the historic Shanti Dham residence and Brahma Sthal monument built by Jyotirindranath Tagore, along with the Ramakrishna Mission Ashram and educational institutions that continue the legacy of learning.'**
  String get pyramidsGizaCallout2;

  /// No description provided for @pyramidsGizaVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'Tagore Hill: Literary Heritage and Natural Beauty in Ranchi, Jharkhand'**
  String get pyramidsGizaVideoCaption;

  /// No description provided for @pyramidsGizaMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Tagore Hill in Morabadi area, Ranchi, Jharkhand'**
  String get pyramidsGizaMapCaption;

  /// No description provided for @pyramidsGizaHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'Tagore Hill, also known as Morabadi Hill, gained historical significance when Jyotirindranath and Satyendranath Tagore first visited Ranchi in 1898, captivated by the natural beauty of the region. Jyotirindranath Tagore visited again in 1908 and was so enamored by the captivating beauty of Morabadi Hill that he set up his camp home on the hillock.'**
  String get pyramidsGizaHistoryInfo1;

  /// No description provided for @pyramidsGizaHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'After the death of his wife Kadambari Devi,rindranath Tagore settled here in 1912, building a house named Shanti Dham and a monument named Brahma Sthal. He lived here until his death in 1925, making the hill a place of literary pilgrimage and cultural heritage.'**
  String get pyramidsGizaHistoryInfo2;

  /// No description provided for @pyramidsGizaConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'The hill features the historic Shanti Dham house built by Jyotirindranath Tagore as his residence, designed to harmonize with the natural landscape. The architecture reflects the Bengali style adapted to the local climate and terrain, creating spaces for contemplation and creative work.'**
  String get pyramidsGizaConstructionInfo1;

  /// No description provided for @pyramidsGizaConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'The Brahma Sthal monument stands as a spiritual focal point on the hilltop, representing the philosophical and religious inclinations of the Tagore family. The site also houses the Ramakrishna Mission Ashram and educational institutions including the Centre of Divyayan and Agrarian Vocational Institute, continuing the tradition of learning and spiritual development.'**
  String get pyramidsGizaConstructionInfo2;

  /// No description provided for @pyramidsGizaLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Tagore Hill is situated in Morabadi, Ranchi, Jharkhand, standing approximately 300 meters high (900 feet) and located 4 kilometers from Albert Ekka Chowk. The scenic locality of Morabadi offers spectacular views of sunrise and sunset from the hilltop.'**
  String get pyramidsGizaLocationInfo1;

  /// No description provided for @pyramidsGizaLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'The hill serves as both a historical landmark and a popular tourist destination, attracting nature lovers, literature enthusiasts, and those seeking peaceful retreats. The destination is popular among adventure lovers for activities like rock climbing, while also serving as inspiration for creative works.'**
  String get pyramidsGizaLocationInfo2;

  /// No description provided for @pyramidsGiza2575bce.
  ///
  /// In en, this message translates to:
  /// **'1898 CE: Jyotirindranath and Satyendranath Tagore first visit Ranchi and discover the natural beauty of Morabadi Hill, beginning the Tagore family\'s connection with the region.'**
  String get pyramidsGiza2575bce;

  /// No description provided for @pyramidsGiza2465bce.
  ///
  /// In en, this message translates to:
  /// **'1908 CE: Jyotirindranath Tagore returns to the hill and establishes his camp home, deeply moved by the captivating beauty and tranquil environment of the hilltop location.'**
  String get pyramidsGiza2465bce;

  /// No description provided for @pyramidsGiza443bce.
  ///
  /// In en, this message translates to:
  /// **'1912 CE: Following the death of his wife Kadambari Devi, Jyotirindranath Tagore permanently settles on the hill, constructing Shanti Dham residence and Brahma Sthal monument.'**
  String get pyramidsGiza443bce;

  /// No description provided for @pyramidsGiza1925ce.
  ///
  /// In en, this message translates to:
  /// **'1925 CE: Jyotirindranath Tagore passes away on the hill, leaving behind a legacy of literary and spiritual heritage that transforms the location into a place of cultural pilgrimage.'**
  String get pyramidsGiza1925ce;

  /// No description provided for @pyramidsGiza1979ce.
  ///
  /// In en, this message translates to:
  /// **'Mid-20th Century: The Ramakrishna Mission Ashram is established on the hill, continuing the tradition of spiritual learning and community service initiated by the Tagore family.'**
  String get pyramidsGiza1979ce;

  /// No description provided for @pyramidsGiza1990ce.
  ///
  /// In en, this message translates to:
  /// **'Contemporary Period: Tagore Hill becomes a recognized tourist destination managed by Jharkhand Tourism, attracting visitors interested in literary heritage, natural beauty, and spiritual retreats.'**
  String get pyramidsGiza1990ce;

  /// No description provided for @pyramidsGizaCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Tagore Family Manuscript'**
  String get pyramidsGizaCollectible1Title;

  /// No description provided for @pyramidsGizaCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'scroll'**
  String get pyramidsGizaCollectible1Icon;

  /// No description provided for @pyramidsGizaCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Brahma Sthal Stone Carving'**
  String get pyramidsGizaCollectible2Title;

  /// No description provided for @pyramidsGizaCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'statue'**
  String get pyramidsGizaCollectible2Icon;

  /// No description provided for @pyramidsGizaCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Shanti Dham Architectural Element'**
  String get pyramidsGizaCollectible3Title;

  /// No description provided for @pyramidsGizaCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'jewelry'**
  String get pyramidsGizaCollectible3Icon;

  /// No description provided for @tajMahalTitle.
  ///
  /// In en, this message translates to:
  /// **'Deoghar District'**
  String get tajMahalTitle;

  /// No description provided for @tajMahalSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Land of the Gods'**
  String get tajMahalSubTitle;

  /// No description provided for @tajMahalRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Santhal Parganas Division, Jharkhand'**
  String get tajMahalRegionTitle;

  /// No description provided for @tajMahalArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Hindu Pilgrimage'**
  String get tajMahalArtifactCulture;

  /// No description provided for @tajMahalArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Eastern India'**
  String get tajMahalArtifactGeolocation;

  /// No description provided for @tajMahalPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'Not just a District,'**
  String get tajMahalPullQuote1Top;

  /// No description provided for @tajMahalPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'but a Sacred Pilgrimage.'**
  String get tajMahalPullQuote1Bottom;

  /// No description provided for @tajMahalPullQuote1Author.
  ///
  /// In en, this message translates to:
  /// **'Devotees of Baba Baidyanath'**
  String get tajMahalPullQuote1Author;

  /// No description provided for @tajMahalPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'For devotees, a pilgrimage to Baba Baidyanath Dham is a sacred journey of self-discovery and spiritual awakening.'**
  String get tajMahalPullQuote2;

  /// No description provided for @tajMahalPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Incredible India'**
  String get tajMahalPullQuote2Author;

  /// No description provided for @tajMahalCallout1.
  ///
  /// In en, this message translates to:
  /// **'Deoghar is home to the Baidyanath Temple, one of the twelve sacred Jyotirlingas of Lord Shiva and one of the 51 Shakti Peethas in India.'**
  String get tajMahalCallout1;

  /// No description provided for @tajMahalCallout2.
  ///
  /// In en, this message translates to:
  /// **'The Shrawani Mela is the longest religious fair in the world, attracting countless devotees who undertake a rigorous 100 km pilgrimage on foot.'**
  String get tajMahalCallout2;

  /// No description provided for @tajMahalVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'Deoghar District: Sacred Pilgrimage and Cultural Heritage of Jharkhand'**
  String get tajMahalVideoCaption;

  /// No description provided for @tajMahalMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Deoghar District in Santhal Parganas Division, Jharkhand.'**
  String get tajMahalMapCaption;

  /// No description provided for @tajMahalHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'Deoghar, meaning \'Abode of Gods\', is the main city of Deoghar District in the Santhal Parganas division of Jharkhand state. The district is renowned for the ancient Baidyanath Temple, which according to legend was built after Lord Shiva appeared to cure the demon king Ravana, earning the name \'Baidyanath\' meaning \'Doctor of Doctors\'.'**
  String get tajMahalHistoryInfo1;

  /// No description provided for @tajMahalHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The district has deep historical and mythological significance, with the Baidyanath Temple complex comprising the central shrine along with 21 additional temples. The region has been a major pilgrimage center for centuries, attracting devotees from across India who believe that visiting this sacred site provides spiritual liberation and fulfills their wishes.'**
  String get tajMahalHistoryInfo2;

  /// No description provided for @tajMahalConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'The Baidyanath Temple was constructed in the mid-16th century by Puran Mal, an ancestor of Maharastra Giddhour. The temple complex showcases traditional Hindu temple architecture with intricate stone carvings and multiple shrines dedicated to various deities. The main temple stands 72 feet tall and follows classical North Indian temple architectural style.'**
  String get tajMahalConstructionInfo1;

  /// No description provided for @tajMahalConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'The district covers an area of 2,479 square kilometers with diverse topography including high and low lands, hills, and fertile plains. The landscape consists of several clusters of rocky hills covered with forests, but also features long ridges and valleys. About 28% of the land is very fertile and suitable for cultivation.'**
  String get tajMahalConstructionInfo2;

  /// No description provided for @tajMahalLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Deoghar district is located in the Santhal Parganas division of Jharkhand state, positioned at 24°49\'N latitude and 86°70\'E longitude. The district is well-connected by road, rail, and air, with Deoghar Airport providing connectivity to major cities like Delhi, Kolkata, and Patna.'**
  String get tajMahalLocationInfo1;

  /// No description provided for @tajMahalLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'The district is strategically located in eastern Jharkhand and serves as the cultural capital of the state due to its religious and cultural significance. It borders several other districts and is easily accessible for the millions of pilgrims who visit annually, particularly during the monsoon season.'**
  String get tajMahalLocationInfo2;

  /// No description provided for @tajMahal1631ce.
  ///
  /// In en, this message translates to:
  /// **'Ancient period: The region has been inhabited for centuries with rich tribal heritage and early Hindu settlements establishing the area\'s spiritual significance.'**
  String get tajMahal1631ce;

  /// No description provided for @tajMahal1647ce.
  ///
  /// In en, this message translates to:
  /// **'Medieval period: Construction of the main Baidyanath Temple complex is completed in the mid-16th century, establishing it as a major pilgrimage center.'**
  String get tajMahal1647ce;

  /// No description provided for @tajMahal1658ce.
  ///
  /// In en, this message translates to:
  /// **'The temple complex gains prominence as one of the twelve Jyotirlingas, attracting pilgrims from across the Indian subcontinent.'**
  String get tajMahal1658ce;

  /// No description provided for @tajMahal1901ce.
  ///
  /// In en, this message translates to:
  /// **'British colonial period: The region becomes part of the Santhal Parganas district, with administrative structures established for governance.'**
  String get tajMahal1901ce;

  /// No description provided for @tajMahal1984ce.
  ///
  /// In en, this message translates to:
  /// **'Modern infrastructure development begins with improved transportation and facilities for the growing number of pilgrims visiting the district.'**
  String get tajMahal1984ce;

  /// No description provided for @tajMahal1998ce.
  ///
  /// In en, this message translates to:
  /// **'Post-Jharkhand statehood: Deoghar becomes a separate district with enhanced administrative focus on pilgrimage tourism and cultural preservation.'**
  String get tajMahal1998ce;

  /// No description provided for @tajMahalCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Sacred Rudraksha Beads'**
  String get tajMahalCollectible1Title;

  /// No description provided for @tajMahalCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'jewelry'**
  String get tajMahalCollectible1Icon;

  /// No description provided for @tajMahalCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Temple Architecture Model'**
  String get tajMahalCollectible2Title;

  /// No description provided for @tajMahalCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'picture'**
  String get tajMahalCollectible2Icon;

  /// No description provided for @tajMahalCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Sanskrit Manuscript'**
  String get tajMahalCollectible3Title;

  /// No description provided for @tajMahalCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'scroll'**
  String get tajMahalCollectible3Icon;

  /// No description provided for @timelineEvent2900bce.
  ///
  /// In en, this message translates to:
  /// **'First known use of papyrus by Egyptians'**
  String get timelineEvent2900bce;

  /// No description provided for @timelineEvent2700bce.
  ///
  /// In en, this message translates to:
  /// **'The Old Kingdom begins in Egypt'**
  String get timelineEvent2700bce;

  /// No description provided for @timelineEvent2600bce.
  ///
  /// In en, this message translates to:
  /// **'Emergence of Mayan culture in the Yucatán Peninsula'**
  String get timelineEvent2600bce;

  /// No description provided for @timelineEvent2560bce.
  ///
  /// In en, this message translates to:
  /// **'King Khufu completes the Great Pyramid of Giza'**
  String get timelineEvent2560bce;

  /// No description provided for @timelineEvent2500bce.
  ///
  /// In en, this message translates to:
  /// **'The mammoth goes extinct'**
  String get timelineEvent2500bce;

  /// No description provided for @timelineEvent2200bce.
  ///
  /// In en, this message translates to:
  /// **'Completion of Stonehenge'**
  String get timelineEvent2200bce;

  /// No description provided for @timelineEvent2000bce.
  ///
  /// In en, this message translates to:
  /// **'Domestication of the horse'**
  String get timelineEvent2000bce;

  /// No description provided for @timelineEvent1800bce.
  ///
  /// In en, this message translates to:
  /// **'Alphabetic writing emerges'**
  String get timelineEvent1800bce;

  /// No description provided for @timelineEvent890bce.
  ///
  /// In en, this message translates to:
  /// **'Homer writes the Iliad and the Odyssey'**
  String get timelineEvent890bce;

  /// No description provided for @timelineEvent776bce.
  ///
  /// In en, this message translates to:
  /// **'First recorded Ancient Olympic Games'**
  String get timelineEvent776bce;

  /// No description provided for @timelineEvent753bce.
  ///
  /// In en, this message translates to:
  /// **'Founding of Rome'**
  String get timelineEvent753bce;

  /// No description provided for @timelineEvent447bce.
  ///
  /// In en, this message translates to:
  /// **'Building of the Parthenon at Athens started'**
  String get timelineEvent447bce;

  /// No description provided for @timelineEvent427bce.
  ///
  /// In en, this message translates to:
  /// **'Birth of Greek Philosopher Plato'**
  String get timelineEvent427bce;

  /// No description provided for @timelineEvent322bce.
  ///
  /// In en, this message translates to:
  /// **'Death of Aristotle (61), the first genuine scientist'**
  String get timelineEvent322bce;

  /// No description provided for @timelineEvent200bce.
  ///
  /// In en, this message translates to:
  /// **'Paper is invented in the Han Dynasty'**
  String get timelineEvent200bce;

  /// No description provided for @timelineEvent44bce.
  ///
  /// In en, this message translates to:
  /// **'Death of Julius Caesar; beginning of the Roman Empire'**
  String get timelineEvent44bce;

  /// No description provided for @timelineEvent4bce.
  ///
  /// In en, this message translates to:
  /// **'Birth of Jesus Christ'**
  String get timelineEvent4bce;

  /// No description provided for @timelineEvent43ce.
  ///
  /// In en, this message translates to:
  /// **'The Roman Empire enters Great Britain for the first time'**
  String get timelineEvent43ce;

  /// No description provided for @timelineEvent79ce.
  ///
  /// In en, this message translates to:
  /// **'Destruction of Pompeii by the volcano Vesuvius'**
  String get timelineEvent79ce;

  /// No description provided for @timelineEvent455ce.
  ///
  /// In en, this message translates to:
  /// **'End of the Roman Empire'**
  String get timelineEvent455ce;

  /// No description provided for @timelineEvent500ce.
  ///
  /// In en, this message translates to:
  /// **'Tikal becomes the first great Maya city'**
  String get timelineEvent500ce;

  /// No description provided for @timelineEvent632ce.
  ///
  /// In en, this message translates to:
  /// **'Death of Muhammad (61), founder of Islam'**
  String get timelineEvent632ce;

  /// No description provided for @timelineEvent793ce.
  ///
  /// In en, this message translates to:
  /// **'The Vikings first invade Britain'**
  String get timelineEvent793ce;

  /// No description provided for @timelineEvent800ce.
  ///
  /// In en, this message translates to:
  /// **'Gunpowder is invented in China'**
  String get timelineEvent800ce;

  /// No description provided for @timelineEvent1001ce.
  ///
  /// In en, this message translates to:
  /// **'Leif Erikson settles during the winter in present-day eastern Canada'**
  String get timelineEvent1001ce;

  /// No description provided for @timelineEvent1077ce.
  ///
  /// In en, this message translates to:
  /// **'The Construction of the Tower of London begins'**
  String get timelineEvent1077ce;

  /// No description provided for @timelineEvent1117ce.
  ///
  /// In en, this message translates to:
  /// **'The University of Oxford is founded'**
  String get timelineEvent1117ce;

  /// No description provided for @timelineEvent1199ce.
  ///
  /// In en, this message translates to:
  /// **'Europeans first use compasses'**
  String get timelineEvent1199ce;

  /// No description provided for @timelineEvent1227ce.
  ///
  /// In en, this message translates to:
  /// **'Death of Genghis Khan (65)'**
  String get timelineEvent1227ce;

  /// No description provided for @timelineEvent1337ce.
  ///
  /// In en, this message translates to:
  /// **'The Hundred Years\' War begins as England and France struggle for dominance.'**
  String get timelineEvent1337ce;

  /// No description provided for @timelineEvent1347ce.
  ///
  /// In en, this message translates to:
  /// **'The first of many concurrences of the Black Death plague, believed to have wiped out as many as 50% of Europe\'s population by its end'**
  String get timelineEvent1347ce;

  /// No description provided for @timelineEvent1428ce.
  ///
  /// In en, this message translates to:
  /// **'Birth of the Aztec Empire in Mexico'**
  String get timelineEvent1428ce;

  /// No description provided for @timelineEvent1439ce.
  ///
  /// In en, this message translates to:
  /// **'Johannes Gutenberg invents the printing press'**
  String get timelineEvent1439ce;

  /// No description provided for @timelineEvent1492ce.
  ///
  /// In en, this message translates to:
  /// **'Christopher Columbus reaches the New World'**
  String get timelineEvent1492ce;

  /// No description provided for @timelineEvent1760ce.
  ///
  /// In en, this message translates to:
  /// **'The industrial revolution begins'**
  String get timelineEvent1760ce;

  /// No description provided for @timelineEvent1763ce.
  ///
  /// In en, this message translates to:
  /// **'Development of the Watt steam engine'**
  String get timelineEvent1763ce;

  /// No description provided for @timelineEvent1783ce.
  ///
  /// In en, this message translates to:
  /// **'End of the American War of Independence from the British Empire'**
  String get timelineEvent1783ce;

  /// No description provided for @timelineEvent1789ce.
  ///
  /// In en, this message translates to:
  /// **'The French Revolution begins'**
  String get timelineEvent1789ce;

  /// No description provided for @timelineEvent1914ce.
  ///
  /// In en, this message translates to:
  /// **'World War I'**
  String get timelineEvent1914ce;

  /// No description provided for @timelineEvent1929ce.
  ///
  /// In en, this message translates to:
  /// **'Black Tuesday signals the beginning of the Great Depression'**
  String get timelineEvent1929ce;

  /// No description provided for @timelineEvent1939ce.
  ///
  /// In en, this message translates to:
  /// **'World War II'**
  String get timelineEvent1939ce;

  /// No description provided for @timelineEvent1957ce.
  ///
  /// In en, this message translates to:
  /// **'launch of Sputnik 1 by the Soviet Union'**
  String get timelineEvent1957ce;

  /// No description provided for @timelineEvent1969ce.
  ///
  /// In en, this message translates to:
  /// **'Apollo 11 mission lands on the moon'**
  String get timelineEvent1969ce;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyStatement.
  ///
  /// In en, this message translates to:
  /// **'As explained in our {privacyUrl} we do not collect any personal information.'**
  String privacyStatement(Object privacyUrl);

  /// No description provided for @pageNotFoundBackButton.
  ///
  /// In en, this message translates to:
  /// **'Back to civilization'**
  String get pageNotFoundBackButton;

  /// No description provided for @pageNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The page you are looking for does not exist.'**
  String get pageNotFoundMessage;

  /// No description provided for @chatAssistantName.
  ///
  /// In en, this message translates to:
  /// **'Wonderous AI Assistant'**
  String get chatAssistantName;

  /// No description provided for @chatAssistantStatus.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get chatAssistantStatus;

  /// No description provided for @chatDefaultMessage.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your message! I\'m here to help you explore the wonders of the world.'**
  String get chatDefaultMessage;

  /// No description provided for @chatStartConversation.
  ///
  /// In en, this message translates to:
  /// **'Start a conversation...'**
  String get chatStartConversation;

  /// No description provided for @chatTypeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message...'**
  String get chatTypeMessage;

  /// No description provided for @chatWelcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Hello! I\'m your AI assistant powered by Google Gemini. How can I help you explore the wonders of the world today?'**
  String get chatWelcomeMessage;

  /// No description provided for @chatImageReady.
  ///
  /// In en, this message translates to:
  /// **'Image ready to send'**
  String get chatImageReady;

  /// No description provided for @chatImageUploaded.
  ///
  /// In en, this message translates to:
  /// **'Image uploaded'**
  String get chatImageUploaded;

  /// No description provided for @chatPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission is required to pick images'**
  String get chatPermissionRequired;

  /// No description provided for @chatErrorPickingImage.
  ///
  /// In en, this message translates to:
  /// **'Error picking image'**
  String get chatErrorPickingImage;

  /// No description provided for @chatErrorProcessingImage.
  ///
  /// In en, this message translates to:
  /// **'Error processing image'**
  String get chatErrorProcessingImage;

  /// No description provided for @chatErrorProcessingRequest.
  ///
  /// In en, this message translates to:
  /// **'Sorry, there was an error processing your request'**
  String get chatErrorProcessingRequest;

  /// No description provided for @chatNoResponse.
  ///
  /// In en, this message translates to:
  /// **'I\'m not sure how to respond to that.'**
  String get chatNoResponse;

  /// No description provided for @chatTypingMessage.
  ///
  /// In en, this message translates to:
  /// **'Type your message...'**
  String get chatTypingMessage;

  /// No description provided for @speechPermissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Microphone permission is required for voice input'**
  String get speechPermissionRequired;

  /// No description provided for @speechLanguageSelector.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get speechLanguageSelector;

  /// No description provided for @speechLanguageSelectorTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get speechLanguageSelectorTitle;

  /// No description provided for @speechCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get speechCancel;

  /// No description provided for @speechListening.
  ///
  /// In en, this message translates to:
  /// **'Listening'**
  String get speechListening;

  /// No description provided for @speechPaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get speechPaused;

  /// No description provided for @speechStopped.
  ///
  /// In en, this message translates to:
  /// **'Stopped'**
  String get speechStopped;

  /// No description provided for @speechProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing...'**
  String get speechProcessing;

  /// No description provided for @speechSayingSomething.
  ///
  /// In en, this message translates to:
  /// **'Say something'**
  String get speechSayingSomething;

  /// No description provided for @speechDoubleTapLanguage.
  ///
  /// In en, this message translates to:
  /// **'Double tap to change language'**
  String get speechDoubleTapLanguage;

  /// No description provided for @speechLongPressToTalk.
  ///
  /// In en, this message translates to:
  /// **'Long press to talk'**
  String get speechLongPressToTalk;

  /// No description provided for @loginWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get loginWelcomeBack;

  /// No description provided for @loginCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get loginCreateAccount;

  /// No description provided for @loginEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get loginEmailLabel;

  /// No description provided for @loginPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get loginPasswordLabel;

  /// No description provided for @loginConfirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get loginConfirmPasswordLabel;

  /// No description provided for @loginSignInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get loginSignInButton;

  /// No description provided for @loginSignUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get loginSignUpButton;

  /// No description provided for @loginOrDivider.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get loginOrDivider;

  /// No description provided for @loginGoogleButton.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get loginGoogleButton;

  /// No description provided for @loginSwitchToSignUp.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? Sign up'**
  String get loginSwitchToSignUp;

  /// No description provided for @loginSwitchToSignIn.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Sign in'**
  String get loginSwitchToSignIn;

  /// No description provided for @loginForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get loginForgotPassword;

  /// No description provided for @loginLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get loginLogout;

  /// No description provided for @loginLoggingIn.
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get loginLoggingIn;

  /// No description provided for @loginSigningUp.
  ///
  /// In en, this message translates to:
  /// **'Signing up...'**
  String get loginSigningUp;

  /// No description provided for @loginErrorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get loginErrorInvalidEmail;

  /// No description provided for @loginErrorWeakPassword.
  ///
  /// In en, this message translates to:
  /// **'Password should be at least 6 characters'**
  String get loginErrorWeakPassword;

  /// No description provided for @loginErrorPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get loginErrorPasswordMismatch;

  /// No description provided for @loginErrorGeneric.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.'**
  String get loginErrorGeneric;

  /// No description provided for @loginSuccessWelcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Wonderous!'**
  String get loginSuccessWelcome;

  /// No description provided for @loginFullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get loginFullNameLabel;

  /// No description provided for @loginPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone'**
  String get loginPhoneLabel;

  /// No description provided for @loginUserRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Select User Role'**
  String get loginUserRoleLabel;

  /// No description provided for @loginRoleCustomer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get loginRoleCustomer;

  /// No description provided for @loginRoleGuide.
  ///
  /// In en, this message translates to:
  /// **'Guide'**
  String get loginRoleGuide;

  /// No description provided for @loginRoleMerchant.
  ///
  /// In en, this message translates to:
  /// **'Merchant'**
  String get loginRoleMerchant;

  /// No description provided for @loginRoleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get loginRoleAdmin;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
