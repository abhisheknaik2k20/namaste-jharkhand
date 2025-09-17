import 'package:flutter/material.dart';
import 'views/google_maps_style_screen.dart';
import 'services/app_state.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = AppState();
    return AppStateScope(
      notifier: appState,
      child: MaterialApp(
        title: 'AR Maps Explorer',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const GoogleMapsStyleMapScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
