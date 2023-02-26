import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/theme/app_colors.dart';
import 'package:madbrains_lesson_project_movie/features/home/pages/home_page.dart';

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
          textTheme: Typography.blackCupertino),
      home: const HomePageFromLesson(),
    );
  }
}
