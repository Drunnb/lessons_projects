// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:madbrains_lesson_project_movie/app/models/film_card_model.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/film_tile.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/image_network.dart';

class DetailsFromListMovies extends StatelessWidget {
  final FilmCardModel movie;
  const DetailsFromListMovies({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              MovieColoredRaiting(voteAverage: movie.voteAverage),
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
