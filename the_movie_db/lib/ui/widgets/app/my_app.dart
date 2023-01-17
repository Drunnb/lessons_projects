import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/Theme/app_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_movie_db/ui/navigation/main_navigation_route_name.dart';

abstract class MyAppNavigation {
  Map<String, Widget Function(BuildContext)> get routes;
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {
  final MyAppNavigation navigation;
  const MyApp({super.key, required this.navigation});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDakrBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDakrBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),
        Locale('en', ''),
      ],
      routes: navigation.routes,
      initialRoute: MainNavigationRouteNames.loaderWidget,
      onGenerateRoute: navigation.onGenerateRoute,
    );
  }
}
