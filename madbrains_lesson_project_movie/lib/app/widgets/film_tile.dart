import 'package:flutter/material.dart';

import 'package:madbrains_lesson_project_movie/domain/models/film_card_model.dart';
import 'package:madbrains_lesson_project_movie/app/widgets/buttons/favorite_movie_button.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/image_network.dart';

class FilmTile extends StatefulWidget {
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final bool isFavorire;

  const FilmTile({
    Key? key,
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.description,
    required this.isFavorire,
  }) : super(key: key);

  factory FilmTile.fromModel({
    required FilmCardModel? model,
  }) {
    return FilmTile(
      id: model?.id ?? 0,
      title: model?.title ?? '',
      picture: model?.picture ?? '',
      voteAverage: model?.voteAverage ?? 0,
      releaseDate: model?.releaseDate ?? '',
      description: model?.description ?? '',
      isFavorire: model?.isFavorite ?? false,
    );
  }

  @override
  State<FilmTile> createState() => _FilmTileState();
}

class _FilmTileState extends State<FilmTile> {
  late var _isFavorite = widget.isFavorire;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 300,
        child: Row(
          children: [
            Expanded(child: ImageNetworkWidget(widget.picture)),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieTitle(title: widget.title),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      MovieColoredRaiting(voteAverage: widget.voteAverage),
                      MovieFavoriteButton(
                        isFavorite: _isFavorite,
                        onPress: () => setState(() {
                          _isFavorite = !_isFavorite;
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  MovieReleaseDate(releaseDate: widget.releaseDate),
                  const SizedBox(height: 50),
                  Text(widget.description,
                      maxLines: 5, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieTitle extends StatelessWidget {
  final String title;
  const MovieTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}

class MovieColoredRaiting extends StatelessWidget {
  const MovieColoredRaiting({
    super.key,
    required this.voteAverage,
  });

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.yellow),
        Text(
          voteAverage.toStringAsFixed(1),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            color: voteAverage < 4
                ? Colors.red
                : voteAverage >= 8
                    ? Colors.green
                    : Colors.black,
          ),
        ),
      ],
    );
  }
}

class MovieReleaseDate extends StatelessWidget {
  final String releaseDate;
  const MovieReleaseDate({
    Key? key,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Дата выхода: $releaseDate',
      style: Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
