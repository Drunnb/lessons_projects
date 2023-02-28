import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/models/film_card_model.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/film_card.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/image_network.dart';

class DetailsFromGridMovie extends StatelessWidget {
  const DetailsFromGridMovie({super.key});

  static const path = '/details';

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as FilmCardModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ImageNetworkWidget(movie.picture),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(movie.releaseDate),
              RaitingChip(movie.voteAverage),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(movie.description),
        ]),
      ),
    );
  }
}
