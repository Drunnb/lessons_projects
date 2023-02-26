import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/models/film_card_model.dart';

class FilmTile extends StatelessWidget {
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;

  const FilmTile({
    Key? key,
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.description,
  }) : super(key: key);

  factory FilmTile.fromModel({
    required FilmCardModel model,
  }) {
    return FilmTile(
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
    return Row(
      children: [
        Expanded(
          child: Image.network(
            picture,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        Expanded(
          // flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Дата выхода: $releaseDate',
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
