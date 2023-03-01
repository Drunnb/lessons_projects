import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/models/film_card_model.dart';
import 'package:madbrains_lesson_project_movie/app/theme/app_colors.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/buttons/primary_button.dart';
import 'package:madbrains_lesson_project_movie/features/details/pages/details_from_grid_movies.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/image_network.dart';

class FilmCard extends StatelessWidget {
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;

  const FilmCard({
    Key? key,
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.description,
  }) : super(key: key);

  factory FilmCard.fromModel({
    required FilmCardModel model,
  }) {
    return FilmCard(
      id: model.id,
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      description: model.description,
    );
  }

  @override
  Widget build(BuildContext context) {
    var fromCardtoModel = FilmCardModel(
        id: id,
        title: title,
        description: description,
        picture: picture,
        releaseDate: releaseDate,
        voteAverage: voteAverage);
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageNetworkWidget(
                picture,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: RaitingChip(voteAverage),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: PrimaryButton('More', onPressed: () {
                  Navigator.pushNamed(context, DetailsFromGridMovie.path,
                      arguments: fromCardtoModel);
                }),
              )),
        ],
      ),
    );
  }
}

class RaitingChip extends StatelessWidget {
  final double voteAverage;
  const RaitingChip(
    this.voteAverage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      label: Text(
        voteAverage.toStringAsFixed(1),
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: Colors.white),
      ),
      backgroundColor: AppColors.purpleMaterial,
    );
  }
}
