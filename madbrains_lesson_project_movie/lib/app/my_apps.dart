import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/theme/app_colors.dart';
import 'package:madbrains_lesson_project_movie/features/home/pages/home_page.dart';

class MyApps extends StatelessWidget {
  const MyApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: AppColors.purpleMaterial,
          textTheme: Typography.blackCupertino),
      home: const HomePageFromLesson(),
    );
  }
}
