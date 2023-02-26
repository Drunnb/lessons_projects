import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/film_list.dart';

class HomePageFromLesson extends StatefulWidget {
  const HomePageFromLesson({super.key});

  @override
  State<HomePageFromLesson> createState() => _HomePageFromLessonState();
}

class _HomePageFromLessonState extends State<HomePageFromLesson> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: const FilmList(),
      ),
    );
  }
}
