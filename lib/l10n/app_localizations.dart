import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
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
    Locale('zh')
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
  /// **'Colosseum'**
  String get colosseumTitle;

  /// No description provided for @colosseumSubTitle.
  ///
  /// In en, this message translates to:
  /// **'The icon of Rome'**
  String get colosseumSubTitle;

  /// No description provided for @colosseumRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Rome, Italy'**
  String get colosseumRegionTitle;

  /// No description provided for @colosseumArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Roman'**
  String get colosseumArtifactCulture;

  /// No description provided for @colosseumArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Roman Empire'**
  String get colosseumArtifactGeolocation;

  /// No description provided for @colosseumPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'Still the Largest Standing'**
  String get colosseumPullQuote1Top;

  /// No description provided for @colosseumPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Amphitheater in the World Today'**
  String get colosseumPullQuote1Bottom;

  /// No description provided for @colosseumPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'When falls the Coliseum, Rome shall fall; And when Rome falls - the World.'**
  String get colosseumPullQuote2;

  /// No description provided for @colosseumPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Lord Byron'**
  String get colosseumPullQuote2Author;

  /// No description provided for @colosseumCallout1.
  ///
  /// In en, this message translates to:
  /// **'It was used for gladiatorial contests and public spectacles including animal hunts, executions, reenactments of famous battles, and dramas based on Roman mythology, and mock sea battles.'**
  String get colosseumCallout1;

  /// No description provided for @colosseumCallout2.
  ///
  /// In en, this message translates to:
  /// **'It is the largest ancient amphitheater ever built, and is still the largest standing amphitheater in the world today, despite its age.'**
  String get colosseumCallout2;

  /// No description provided for @colosseumVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'“Ancient Rome 101 | National Geographic.” Youtube, uploaded by National Geographic.'**
  String get colosseumVideoCaption;

  /// No description provided for @colosseumMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Colosseum in Rome, Italy,'**
  String get colosseumMapCaption;

  /// No description provided for @colosseumHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'The Colosseum is an oval amphitheater in the center of the city of Rome, Italy. Unlike Roman theaters that were built into hillsides, the Colosseum is an entirely free-standing structure.'**
  String get colosseumHistoryInfo1;

  /// No description provided for @colosseumHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The building ceased to be used for entertainment in the early medieval era. By the late 6th century a small chapel had been built into the structure of the amphitheater, and the arena was converted into a cemetery. \nThe numerous vaulted spaces in the arcades under the seating were converted into housing and workshops, and are recorded as still being rented out as late as the 12th century.'**
  String get colosseumHistoryInfo2;

  /// No description provided for @colosseumConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'Construction began under the emperor Vespasian (r. 69-79 CE) in 72 and was completed in 80 CE under his successor and heir, Titus (r. 79-81). Further modifications were made during the reign of Domitian (r. 81-96).\nThe Colosseum is built of travertine limestone, tuff (volcanic rock), and brick-faced concrete. The outer wall is estimated to have required over 3.5 million cubic feet of travertine stone which were set without mortar; they were held together by 300 tons of iron clamps.'**
  String get colosseumConstructionInfo1;

  /// No description provided for @colosseumConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'It could hold an estimated 50,000 to 80,000 spectators at various points in its history, having an average audience of some 65,000.'**
  String get colosseumConstructionInfo2;

  /// No description provided for @colosseumLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Following the Great Fire of Rome in 64 CE, Emperor Nero seized much of the destroyed area to build his grandiose Domus Aurea (\"Golden House\"). A severe embarrassment to Nero\'s successors, parts of this extravagant palace and grounds, encompassing 1 sq mile, were filled with earth and built over.'**
  String get colosseumLocationInfo1;

  /// No description provided for @colosseumLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'On the site of the lake, in the middle of the palace grounds, Emperor Vespasian would build the Colosseum as part of a Roman resurgence.'**
  String get colosseumLocationInfo2;

  /// No description provided for @colosseum70ce.
  ///
  /// In en, this message translates to:
  /// **'Colosseum construction was started during the Vespasian reign overtop what used to be a private lake for the previous four emperors. This was done in an attempt to revitalize Rome from their tyrannical reign.'**
  String get colosseum70ce;

  /// No description provided for @colosseum82ce.
  ///
  /// In en, this message translates to:
  /// **'The uppermost floor was built, and the structure was officially completed by Domitian.'**
  String get colosseum82ce;

  /// No description provided for @colosseum1140ce.
  ///
  /// In en, this message translates to:
  /// **'The arena was repurposed as a fortress for the Frangipane and Annibaldi families. It was also at one point used as a church.'**
  String get colosseum1140ce;

  /// No description provided for @colosseum1490ce.
  ///
  /// In en, this message translates to:
  /// **'Pope Alexander VI permitted the site to be used as a quarry, for both storing and salvaging building materials.'**
  String get colosseum1490ce;

  /// No description provided for @colosseum1829ce.
  ///
  /// In en, this message translates to:
  /// **'Preservation of the colosseum officially began, after more than a millennia of dilapidation and vandalism. Pope Pius VIII was notably devoted to this project.'**
  String get colosseum1829ce;

  /// No description provided for @colosseum1990ce.
  ///
  /// In en, this message translates to:
  /// **'A restoration project was undertaken to ensure the colosseum remained a major tourist attraction for Rome. It currently stands as one of the greatest sources of tourism revenue in Italy.'**
  String get colosseum1990ce;

  /// No description provided for @colosseumCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Glass hexagonal amphoriskos'**
  String get colosseumCollectible1Title;

  /// No description provided for @colosseumCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'vase'**
  String get colosseumCollectible1Icon;

  /// No description provided for @colosseumCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Bronze plaque of Mithras slaying the bull'**
  String get colosseumCollectible2Title;

  /// No description provided for @colosseumCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'statue'**
  String get colosseumCollectible2Icon;

  /// No description provided for @colosseumCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Interno del Colosseo'**
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
  /// **'Petra'**
  String get petraTitle;

  /// No description provided for @petraSubTitle.
  ///
  /// In en, this message translates to:
  /// **'The Lost City'**
  String get petraSubTitle;

  /// No description provided for @petraRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Ma’an, Jordan'**
  String get petraRegionTitle;

  /// No description provided for @petraArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Nabataean'**
  String get petraArtifactCulture;

  /// No description provided for @petraArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Levant'**
  String get petraArtifactGeolocation;

  /// No description provided for @petraPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'A Rose-Red City'**
  String get petraPullQuote1Top;

  /// No description provided for @petraPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Half as Old as Time'**
  String get petraPullQuote1Bottom;

  /// No description provided for @petraPullQuote1Author.
  ///
  /// In en, this message translates to:
  /// **'John William Burgon'**
  String get petraPullQuote1Author;

  /// No description provided for @petraPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'Petra is a brilliant display of man’s artistry in turning barren rock into a majestic wonder.'**
  String get petraPullQuote2;

  /// No description provided for @petraPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Edward Dawson'**
  String get petraPullQuote2Author;

  /// No description provided for @petraCallout1.
  ///
  /// In en, this message translates to:
  /// **'They were particularly skillful in harvesting rainwater, agriculture and stone carving.'**
  String get petraCallout1;

  /// No description provided for @petraCallout2.
  ///
  /// In en, this message translates to:
  /// **'Perhaps a more prominent resemblance to Hellenistic style in Petra comes with its Treasury.'**
  String get petraCallout2;

  /// No description provided for @petraVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'“Stunning Stone Monuments of Petra | National Geographic.” Youtube, uploaded by National Geographic.'**
  String get petraVideoCaption;

  /// No description provided for @petraMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Petra in Ma’an Governorate, Jordan.'**
  String get petraMapCaption;

  /// No description provided for @petraHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'The area around Petra has been inhabited from as early as 7000  BCE, and the Nabataeans might have settled in what would become the capital city of their kingdom as early as the 4th century BCE.\nThe trading business gained the Nabataeans considerable revenue and Petra became the focus of their wealth. The Nabataeans were accustomed to living in the barren deserts, unlike their enemies, and were able to repel attacks by taking advantage of the area\'s mountainous terrain.'**
  String get petraHistoryInfo1;

  /// No description provided for @petraHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'Petra flourished in the 1st century CE, when its famous Al-Khazneh structure - believed to be the mausoleum of Nabataean king Aretas IV - was constructed, and its population peaked at an estimated 20,000 inhabitants.\nAccess to the city is through a 3/4 mile-long (1.2 km) gorge called the Siq, which leads directly to the Khazneh.'**
  String get petraHistoryInfo2;

  /// No description provided for @petraConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'Famous for its rock-cut architecture and water conduit system, Petra is also called the \"Red Rose City\" because of the color of the stone from which it is carved.\nAnother thing Petra is known for is its Hellenistic (“Greek”) architecture. These influences can be seen in many of the facades at Petra and are a reflection of the cultures that the Nabataens traded with.'**
  String get petraConstructionInfo1;

  /// No description provided for @petraConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'The facade of the Treasury features a broken pediment with a central tholos (“dome”) inside, and two obelisks appear to form into the rock of Petra at the top. Near the bottom of the Treasury we see twin Greek Gods: Pollux, Castor, and Dioscuri, who protect travelers on their journeys. \nNear the top of the Treasury, two victories are seen standing on each side of a female figure on the tholos. This female figure is believed to be the Isis-Tyche, Isis being the Egyptian Goddess and Tyche being the Greek Goddess of good fortune.'**
  String get petraConstructionInfo2;

  /// No description provided for @petraLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'Petra is located in southern Jordan. It is adjacent to the mountain of Jabal Al-Madbah, in a basin surrounded by mountains forming the eastern flank of the Arabah valley running from the Dead Sea to the Gulf of Aqaba.'**
  String get petraLocationInfo1;

  /// No description provided for @petraLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'The area around Petra has been inhabited from as early as 7000 BC, and the Nabataeans might have settled in what would become the capital city of their kingdom as early as the 4th century BC.\nArchaeological work has only discovered evidence of Nabataean presence dating back to the second century BC, by which time Petra had become their capital. The Nabataeans were nomadic Arabs who invested in Petra\'s proximity to the incense trade routes by establishing it as a major regional trading hub.'**
  String get petraLocationInfo2;

  /// No description provided for @petra1200bce.
  ///
  /// In en, this message translates to:
  /// **'First Edomites occupied the area and established a foothold.'**
  String get petra1200bce;

  /// No description provided for @petra106bce.
  ///
  /// In en, this message translates to:
  /// **'Became part of the Roman province Arabia'**
  String get petra106bce;

  /// No description provided for @petra551ce.
  ///
  /// In en, this message translates to:
  /// **'After being damaged by earthquakes, habitation of the city all but ceased.'**
  String get petra551ce;

  /// No description provided for @petra1812ce.
  ///
  /// In en, this message translates to:
  /// **'Rediscovered by the Swiss traveler Johann Ludwig Burckhardt.'**
  String get petra1812ce;

  /// No description provided for @petra1958ce.
  ///
  /// In en, this message translates to:
  /// **'Excavations led on the site by the British School of Archaeology and the American Center of Oriental Research.'**
  String get petra1958ce;

  /// No description provided for @petra1989ce.
  ///
  /// In en, this message translates to:
  /// **'Appeared in the film Indiana Jones and The Last Crusade.'**
  String get petra1989ce;

  /// No description provided for @petraCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Camel and riders'**
  String get petraCollectible1Title;

  /// No description provided for @petraCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'statue'**
  String get petraCollectible1Icon;

  /// No description provided for @petraCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Vessel'**
  String get petraCollectible2Title;

  /// No description provided for @petraCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'vase'**
  String get petraCollectible2Icon;

  /// No description provided for @petraCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Open bowl'**
  String get petraCollectible3Title;

  /// No description provided for @petraCollectible3Icon.
  ///
  /// In en, this message translates to:
  /// **'vase'**
  String get petraCollectible3Icon;

  /// No description provided for @pyramidsGizaTitle.
  ///
  /// In en, this message translates to:
  /// **'Pyramids of Giza'**
  String get pyramidsGizaTitle;

  /// No description provided for @pyramidsGizaSubTitle.
  ///
  /// In en, this message translates to:
  /// **'The ancient wonder'**
  String get pyramidsGizaSubTitle;

  /// No description provided for @pyramidsGizaRegionTitle.
  ///
  /// In en, this message translates to:
  /// **'Cairo, Egypt'**
  String get pyramidsGizaRegionTitle;

  /// No description provided for @pyramidsGizaArtifactCulture.
  ///
  /// In en, this message translates to:
  /// **'Egyptian'**
  String get pyramidsGizaArtifactCulture;

  /// No description provided for @pyramidsGizaArtifactGeolocation.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get pyramidsGizaArtifactGeolocation;

  /// No description provided for @pyramidsGizaPullQuote1Top.
  ///
  /// In en, this message translates to:
  /// **'The Tallest Structures on Earth'**
  String get pyramidsGizaPullQuote1Top;

  /// No description provided for @pyramidsGizaPullQuote1Bottom.
  ///
  /// In en, this message translates to:
  /// **'Until the Advent of Modern Skyscrapers'**
  String get pyramidsGizaPullQuote1Bottom;

  /// No description provided for @pyramidsGizaPullQuote2.
  ///
  /// In en, this message translates to:
  /// **'From the heights of these pyramids, forty centuries look down on us.'**
  String get pyramidsGizaPullQuote2;

  /// No description provided for @pyramidsGizaPullQuote2Author.
  ///
  /// In en, this message translates to:
  /// **'Napoleon Bonaparte'**
  String get pyramidsGizaPullQuote2Author;

  /// No description provided for @pyramidsGizaCallout1.
  ///
  /// In en, this message translates to:
  /// **'It is theorized the pyramid not only served as a tomb for the pharaoh, but also as a storage pit for various items he would need in the afterlife.'**
  String get pyramidsGizaCallout1;

  /// No description provided for @pyramidsGizaCallout2.
  ///
  /// In en, this message translates to:
  /// **'The Great Pyramid consists of an estimated 2.3 million blocks. Approximately 5.5 million tonnes of limestone, 8,000 tonnes of granite, and 500,000 tonnes of mortar were used in the construction.'**
  String get pyramidsGizaCallout2;

  /// No description provided for @pyramidsGizaVideoCaption.
  ///
  /// In en, this message translates to:
  /// **'“The Great Pyramids of Giza | Egypt’s Ancient Mysteries | National Geographic UK.” Youtube, uploaded by National Geographic UK.'**
  String get pyramidsGizaVideoCaption;

  /// No description provided for @pyramidsGizaMapCaption.
  ///
  /// In en, this message translates to:
  /// **'Map showing location of Giza Pyramids in Greater Cairo, Egypt.'**
  String get pyramidsGizaMapCaption;

  /// No description provided for @pyramidsGizaHistoryInfo1.
  ///
  /// In en, this message translates to:
  /// **'The Giza pyramid complex, also called the Giza necropolis, is the site on the Giza Plateau in Greater Cairo, Egypt that includes the Great Pyramid of Giza, the Pyramid of Khafre, and the Pyramid of Menkaure, along with their associated pyramid complexes and the Great Sphinx of Giza. All were built during the Fourth Dynasty of the Old Kingdom of Ancient Egypt, between 2600 and 2500 BCE.'**
  String get pyramidsGizaHistoryInfo1;

  /// No description provided for @pyramidsGizaHistoryInfo2.
  ///
  /// In en, this message translates to:
  /// **'The pyramids of Giza and others are thought to have been constructed to house the remains of the deceased pharaohs who ruled over Ancient Egypt. A portion of the pharaoh\'s spirit called his ka was believed to remain with his corpse. Proper care of the remains was necessary in order for the former Pharaoh to perform his new duties as king of the dead.'**
  String get pyramidsGizaHistoryInfo2;

  /// No description provided for @pyramidsGizaConstructionInfo1.
  ///
  /// In en, this message translates to:
  /// **'Most construction theories are based on the idea that the pyramids were built by moving huge stones from a quarry and dragging and lifting them into place. In building the pyramids, the architects might have developed their techniques over time.\nThey would select a site on a relatively flat area of bedrock — not sand — which provided a stable foundation. After carefully surveying the site and laying down the first level of stones, they constructed the pyramids in horizontal levels, one on top of the other.'**
  String get pyramidsGizaConstructionInfo1;

  /// No description provided for @pyramidsGizaConstructionInfo2.
  ///
  /// In en, this message translates to:
  /// **'For the Great Pyramid, most of the stone for the interior seems to have been quarried immediately to the south of the construction site. The smooth exterior of the pyramid was made of a fine grade of white limestone that was quarried across the Nile.\nTo ensure that the pyramid remained symmetrical, the exterior casing stones all had to be equal in height and width. Workers might have marked all the blocks to indicate the angle of the pyramid wall and trimmed the surfaces carefully so that the blocks fit together. During construction, the outer surface of the stone was smooth limestone; excess stone has eroded as time has passed.'**
  String get pyramidsGizaConstructionInfo2;

  /// No description provided for @pyramidsGizaLocationInfo1.
  ///
  /// In en, this message translates to:
  /// **'The site is at the edges of the Western Desert, approximately 5.6 miles (9 km) west of the Nile River in the city of Giza, and about 8 miles (13 km) southwest of the city center of Cairo.'**
  String get pyramidsGizaLocationInfo1;

  /// No description provided for @pyramidsGizaLocationInfo2.
  ///
  /// In en, this message translates to:
  /// **'Currently, the pyramids are located in the northwestern side of the Western Desert, and it is considered to be one of the best recognizable and the most visited tourist attractions of the planet.'**
  String get pyramidsGizaLocationInfo2;

  /// No description provided for @pyramidsGiza2575bce.
  ///
  /// In en, this message translates to:
  /// **'Construction of the 3 pyramids began for three kings of the 4th dynasty; Khufu, Khafre, and Menkaure.'**
  String get pyramidsGiza2575bce;

  /// No description provided for @pyramidsGiza2465bce.
  ///
  /// In en, this message translates to:
  /// **'Construction began on the smaller surrounding structures called Mastabas for royalty of the 5th and 6th dynasties.'**
  String get pyramidsGiza2465bce;

  /// No description provided for @pyramidsGiza443bce.
  ///
  /// In en, this message translates to:
  /// **'Greek Author Herodotus speculated that the pyramids were built in the span of 20 years with over 100,000 slave labourers. This assumption would last for over 1500 years'**
  String get pyramidsGiza443bce;

  /// No description provided for @pyramidsGiza1925ce.
  ///
  /// In en, this message translates to:
  /// **'Tomb of Queen Hetepheres was discovered, containing furniture and jewelry. One of the last remaining treasure-filled tombs after many years of looting and plundering.'**
  String get pyramidsGiza1925ce;

  /// No description provided for @pyramidsGiza1979ce.
  ///
  /// In en, this message translates to:
  /// **'Designated a UNESCO World Heritage Site to prevent any more unauthorized plundering and vandalism.'**
  String get pyramidsGiza1979ce;

  /// No description provided for @pyramidsGiza1990ce.
  ///
  /// In en, this message translates to:
  /// **'Discovery of labouror’s districts suggest that the workers building the pyramids were not slaves, and an ingenious building method proved a relatively small work-force was required to build such immense structures.'**
  String get pyramidsGiza1990ce;

  /// No description provided for @pyramidsGizaCollectible1Title.
  ///
  /// In en, this message translates to:
  /// **'Two papyrus fragments'**
  String get pyramidsGizaCollectible1Title;

  /// No description provided for @pyramidsGizaCollectible1Icon.
  ///
  /// In en, this message translates to:
  /// **'scroll'**
  String get pyramidsGizaCollectible1Icon;

  /// No description provided for @pyramidsGizaCollectible2Title.
  ///
  /// In en, this message translates to:
  /// **'Fragmentary Face of King Khafre'**
  String get pyramidsGizaCollectible2Title;

  /// No description provided for @pyramidsGizaCollectible2Icon.
  ///
  /// In en, this message translates to:
  /// **'statue'**
  String get pyramidsGizaCollectible2Icon;

  /// No description provided for @pyramidsGizaCollectible3Title.
  ///
  /// In en, this message translates to:
  /// **'Jewelry Elements'**
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
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
