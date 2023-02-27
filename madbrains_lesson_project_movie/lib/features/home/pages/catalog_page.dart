import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/film_grid.dart';

class HomePageFromLessonWithGrid extends StatefulWidget {
  const HomePageFromLessonWithGrid({super.key});

  @override
  State<HomePageFromLessonWithGrid> createState() =>
      _HomePageFromLessonWithGridState();
}

class _HomePageFromLessonWithGridState
    extends State<HomePageFromLessonWithGrid> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: FilmGrid(),
      ),
    );
  }
}
