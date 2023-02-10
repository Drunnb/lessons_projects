import 'package:flutter/material.dart';
import 'package:noise_tool/screens/home_screen.dart';
import 'package:noise_tool/screens/info_screen.dart';
import 'package:noise_tool/screens/saves_screen.dart';
import 'package:noise_tool/screens/settings_screen.dart';

void main() {
  runApp(const MainApp());
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
        '/': (context) => const HomeScreen(),
        '/saves': (context) => const SavesScreen(),
        '/info': (context) => const InfoScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      initialRoute: '/',
    );
  }
}
