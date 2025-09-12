import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:namste_jharkhand/common_libs.dart';
import 'package:namste_jharkhand/l10n/app_localizations.dart';
import 'package:namste_jharkhand/logic/artifact_api_logic.dart';
import 'package:namste_jharkhand/logic/artifact_api_service.dart';
import 'package:namste_jharkhand/logic/collectibles_logic.dart';
import 'package:namste_jharkhand/logic/locale_logic.dart';
import 'package:namste_jharkhand/logic/native_widget_service.dart';
import 'package:namste_jharkhand/logic/timeline_logic.dart';
import 'package:namste_jharkhand/logic/unsplash_logic.dart';
import 'package:namste_jharkhand/logic/wonders_logic.dart';
import 'package:namste_jharkhand/ui/common/app_shortcuts.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  GoRouter.optionURLReflectsImperativeAPIs = true;
  registerSingletons();
  runApp(WondersApp());
  await appLogic.bootstrap();
  FlutterNativeSplash.remove();
}

class WondersApp extends StatefulWidget with GetItStatefulWidgetMixin {
  WondersApp({super.key});
  @override
  State<WondersApp> createState() => _WondersAppState();
}

class _WondersAppState extends State<WondersApp> with GetItStateMixin {
  @override
  void didChangeDependencies() => super.didChangeDependencies();
  @override
  Widget build(BuildContext context) {
    final locale = watchX((SettingsLogic s) => s.currentLocale);
    return MaterialApp.router(
        title: 'Namaste Jharkhand',
        routeInformationProvider: appRouter.routeInformationProvider,
        routeInformationParser: appRouter.routeInformationParser,
        locale: locale == null ? null : Locale(locale),
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.routerDelegate,
        shortcuts: AppShortcuts.defaults,
        theme: ThemeData(fontFamily: $styles.text.body.fontFamily, useMaterial3: true),
        color: $styles.colors.black,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: AppLocalizations.supportedLocales);
  }
}

void registerSingletons() {
  GetIt.I.registerLazySingleton<AppLogic>(() => AppLogic());
  GetIt.I.registerLazySingleton<WondersLogic>(() => WondersLogic());
  GetIt.I.registerLazySingleton<TimelineLogic>(() => TimelineLogic());
  GetIt.I.registerLazySingleton<ArtifactAPILogic>(() => ArtifactAPILogic());
  GetIt.I.registerLazySingleton<ArtifactAPIService>(() => ArtifactAPIService());
  GetIt.I.registerLazySingleton<SettingsLogic>(() => SettingsLogic());
  GetIt.I.registerLazySingleton<UnsplashLogic>(() => UnsplashLogic());
  GetIt.I.registerLazySingleton<CollectiblesLogic>(() => CollectiblesLogic());
  GetIt.I.registerLazySingleton<LocaleLogic>(() => LocaleLogic());
  GetIt.I.registerLazySingleton<NativeWidgetService>(() => NativeWidgetService());
}

AppLogic get appLogic => GetIt.I.get<AppLogic>();
WondersLogic get wondersLogic => GetIt.I.get<WondersLogic>();
TimelineLogic get timelineLogic => GetIt.I.get<TimelineLogic>();
SettingsLogic get settingsLogic => GetIt.I.get<SettingsLogic>();
UnsplashLogic get unsplashLogic => GetIt.I.get<UnsplashLogic>();
ArtifactAPILogic get artifactLogic => GetIt.I.get<ArtifactAPILogic>();
CollectiblesLogic get collectiblesLogic => GetIt.I.get<CollectiblesLogic>();
LocaleLogic get localeLogic => GetIt.I.get<LocaleLogic>();
AppLocalizations get $strings => localeLogic.strings;
AppStyle get $styles => WondersAppScaffold.style;
