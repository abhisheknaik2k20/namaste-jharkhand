import 'package:namste_jharkhand/common_libs.dart';

class LocaleSwitcher extends StatelessWidget with GetItMixin {
  LocaleSwitcher({super.key});
  final List<String> _availableLocals = ['en', 'zh', 'hi'];
  @override
  Widget build(BuildContext context) {
    final locale = watchX((SettingsLogic s) => s.currentLocale);
    Future<void> handleSwapLocale() async {
      var index = _availableLocals.indexOf(locale ?? 'en');
      var newIndex = (index + 1) % _availableLocals.length;
      await settingsLogic.changeLocale(Locale(_availableLocals[newIndex]));
    }

    return AppBtn.from(
        text: $strings.localeSwapButton, onPressed: handleSwapLocale, padding: EdgeInsets.all($styles.insets.sm));
  }
}
