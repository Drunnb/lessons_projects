// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/ui/theme/app_colors.dart';
import 'package:madbrains_lesson_project_movie/ui/widgets/home_screen/from_lesson.dart';
import 'package:madbrains_lesson_project_movie/ui/widgets/home_screen/home_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: AppColors.purpleMaterial,
          textTheme: Typography.whiteCupertino),
      home: const HomePageFromLesson(),
    );
  }
}
