import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/film_list.dart';

class HomePageFromLessonWithList extends StatefulWidget {
  const HomePageFromLessonWithList({super.key});

  @override
  State<HomePageFromLessonWithList> createState() =>
      _HomePageFromLessonWithListState();
}

class _HomePageFromLessonWithListState
    extends State<HomePageFromLessonWithList> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: FilmList(),
      ),
    );
  }
}
