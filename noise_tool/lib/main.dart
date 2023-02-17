import 'package:flutter/material.dart';
import 'package:noise_tool/screens/home_screen.dart';
import 'package:noise_tool/screens/info_screen.dart';
import 'package:noise_tool/screens/saves_screen.dart';
import 'package:noise_tool/screens/settings_screen.dart';
import 'package:noise_tool/services/all_routes.dart';
import 'package:noise_tool/services/inform_to_screens.dart';

void main() {
  runApp(const NoiseMeterApp());
}

class NoiseMeterApp extends StatefulWidget {
  const NoiseMeterApp({super.key});

  @override
  State<NoiseMeterApp> createState() => _NoiseMeterAppState();
}

class _NoiseMeterAppState extends State<NoiseMeterApp> {
  String thisRoute = AllRoutes.home;
  bool is404 = false;
  late InformToScreens informToScreens;

  void goToRoute(String route) {
    setState(() {
      thisRoute = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    final informToScreens = InformToScreens(thisRoute, goToRoute);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NeueMachina',
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: HomeScreen(informToScreens),
          ),
          if (thisRoute == AllRoutes.saves)
            MaterialPage(
              child: SavesScreen(informToScreens),
            ),
          if (thisRoute == AllRoutes.info)
            MaterialPage(
              child: InfoScreen(informToScreens),
            ),
          if (thisRoute == AllRoutes.settings)
            MaterialPage(
              child: SettingsScreen(informToScreens),
            ),
          if (is404 == true)
            const MaterialPage(
                child: Scaffold(
              body: Center(
                child: Text('Ошибка, перезагрузите приложение'),
              ),
            )),
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          return true;
        },
      ),
    );
  }
}
