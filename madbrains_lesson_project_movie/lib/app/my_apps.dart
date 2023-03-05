import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/domain/models/film_card_model.dart';
import 'package:madbrains_lesson_project_movie/app/theme/app_colors.dart';
import 'package:madbrains_lesson_project_movie/app/main_page.dart';
import 'package:madbrains_lesson_project_movie/features/details/pages/details_from_grid_movies.dart';
import 'package:madbrains_lesson_project_movie/features/settings/pages/settings_page.dart';

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: AppColors.purpleMaterial,
          textTheme: Typography.blackCupertino),
      initialRoute: MainPage.path,
      onGenerateRoute: (settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const MainPage();
            },
          );
        }
        if (settings.name == SettingsPage.path) {
          final SettingsArguments arguments =
              settings.arguments as SettingsArguments;
          return MaterialPageRoute(
            builder: (context) {
              return SettingsPage(arguments: arguments);
            },
          );
        }
        if (settings.name == DetailsFromGridMovie.path) {
          final FilmCardModel arguments = settings.arguments as FilmCardModel;
          return MaterialPageRoute(
            builder: (context) {
              return const DetailsFromGridMovie();
            },
            settings: RouteSettings(arguments: arguments),
          );
        }
        return null;
      },
    );
  }
}
