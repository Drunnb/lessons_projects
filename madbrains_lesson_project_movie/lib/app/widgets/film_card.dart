// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:madbrains_lesson_project_movie/domain/models/film_card_model.dart';
import 'package:madbrains_lesson_project_movie/app/theme/app_colors.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/buttons/favorite_movie_button.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/buttons/primary_button.dart';
import 'package:madbrains_lesson_project_movie/features/details/pages/details_from_grid_movies.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/image_network.dart';

class FilmCard extends StatefulWidget {
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final bool isFavorite;

  const FilmCard({
    Key? key,
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.description,
    required this.isFavorite,
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
      isFavorite: model.isFavorite,
    );
  }

  @override
  State<FilmCard> createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  late var _isFavorite = widget.isFavorite;
  @override
  Widget build(BuildContext context) {
    var fromCardtoModel = FilmCardModel(
        id: widget.id,
        title: widget.title,
        description: widget.description,
        picture: widget.picture,
        releaseDate: widget.releaseDate,
        voteAverage: widget.voteAverage);
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
                widget.picture,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: RaitingChip(widget.voteAverage),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: PrimaryButton('More', onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const DetailsFromGridMovie();
                      },
                      settings: RouteSettings(arguments: fromCardtoModel),
                    ),
                  );

                  // Navigator.pushNamed(context, DetailsFromGridMovie.path,
                  //     arguments: fromCardtoModel);
                }),
              )),
          Positioned(
            left: 4,
            top: 4,
            child: MovieFavoriteButton(
                isFavorite: _isFavorite,
                onPress: () => setState(() {
                      _isFavorite = !_isFavorite;
                    })),
          ),
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
