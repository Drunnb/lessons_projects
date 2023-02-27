import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/film_card.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/film_list.dart';

class FilmGrid extends StatelessWidget {
  const FilmGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemBuilder: (context, index) {
        return FilmCard.fromModel(
            model: FilmList.films[index % FilmList.films.length]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
      ),
    );
  }
}
