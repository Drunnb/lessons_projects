import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/resources.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: AppImages.moviePlacholder,
      title: 'Mortal Kombat',
      time: 'April 7, 2021',
      description:
          'Washed-up MMA fighter Cole Young, unware of his heritage, and hunted by Emperator Shang Tsungs besons as he prepares to stand against the enemies of Outworld in a high stake battle for the universe.',
    ),
    Movie(
      id: 2,
      imageName: AppImages.moviePlacholder,
      title: 'Прибытие',
      time: 'April 7, 2021',
      description:
          'Washed-up MMA fighter Cole Young, unware of his heritage, and hunted by Emperator Shang Tsungs besons as he prepares to stand against the enemies of Outworld in a high stake battle for the universe.',
    ),
    Movie(
      id: 3,
      imageName: AppImages.moviePlacholder,
      title: 'Назад в будущее 1',
      time: 'April 7, 2021',
      description:
          'Washed-up MMA fighter Cole Young, unware of his heritage, and hunted by Emperator Shang Tsungs besons as he prepares to stand against the enemies of Outworld in a high stake battle for the universe.',
    ),
    Movie(
      id: 4,
      imageName: AppImages.moviePlacholder,
      title: 'Назад в будущее 2',
      time: 'April 7, 2021',
      description:
          'Washed-up MMA fighter Cole Young, unware of his heritage, and hunted by Emperator Shang Tsungs besons as he prepares to stand against the enemies of Outworld in a high stake battle for the universe.',
    ),
    Movie(
      id: 5,
      imageName: AppImages.moviePlacholder,
      title: 'Тихие Зори',
      time: 'April 7, 2021',
      description:
          'Washed-up MMA fighter Cole Young, unware of his heritage, and hunted by Emperator Shang Tsungs besons as he prepares to stand against the enemies of Outworld in a high stake battle for the universe.',
    ),
    Movie(
      id: 6,
      imageName: AppImages.moviePlacholder,
      title: 'Дюна',
      time: 'April 7, 2021',
      description:
          'Washed-up MMA fighter Cole Young, unware of his heritage, and hunted by Emperator Shang Tsungs besons as he prepares to stand against the enemies of Outworld in a high stake battle for the universe.',
    ),
    Movie(
      id: 7,
      imageName: AppImages.moviePlacholder,
      title: 'Остров проклятых',
      time: 'April 7, 2021',
      description:
          'Washed-up MMA fighter Cole Young, unware of his heritage, and hunted by Emperator Shang Tsungs besons as he prepares to stand against the enemies of Outworld in a high stake battle for the universe.',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/movie_details',
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 70.0),
          itemCount: _filteredMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filteredMovies[index];
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 2)),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(
                          image: AssetImage(movie.imageName),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20.0),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                movie.time,
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20.0),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                  Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.0),
                        onTap: () => _onMovieTap(index),
                      )),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
