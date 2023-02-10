import 'package:flutter/material.dart';
import 'package:noise_tool/screens/home_screen.dart';
import 'package:noise_tool/screens/info_screen.dart';
import 'package:noise_tool/screens/saves_screen.dart';
import 'package:noise_tool/screens/settings_screen.dart';

void main() {
  runApp(const MainApp());
}

class AllRoutes {
  static const String home = '/';
  static const String saves = '/saves';
  static const String info = '/info';
  static const String settings = '/settings';
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NeueMachina',
      ),
      routes: {
        AllRoutes.home: (context) => const HomeScreen(),
        AllRoutes.saves: (context) => const SavesScreen(),
        AllRoutes.info: (context) => const InfoScreen(),
        AllRoutes.settings: (context) => const SettingsScreen(),
      },
      initialRoute: '/',
    );
  }
}
