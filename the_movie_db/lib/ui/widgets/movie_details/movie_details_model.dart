import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_movie_db/Library/Widgets/inherited/localezed_model.dart';
import 'package:the_movie_db/domain/api_client/api_client_exception.dart';
import 'package:the_movie_db/domain/entity/movie_details.dart';
import 'package:the_movie_db/domain/services/auth_service.dart';
import 'package:the_movie_db/domain/services/movie_service.dart';
import 'package:the_movie_db/ui/navigation/maint_navigation.dart';

class MovieDetailsPosterData {
  final String? backdropPath;
  final String? posterPath;
  final bool isFavorite;
  IconData get favoriteIcon =>
      isFavorite ? Icons.favorite : Icons.favorite_outline;

  MovieDetailsPosterData({
    this.backdropPath,
    this.posterPath,
    this.isFavorite = false,
  });

  MovieDetailsPosterData copyWith({
    String? backdropPath,
    String? posterPath,
    bool? isFavorite,
  }) {
    return MovieDetailsPosterData(
      backdropPath: backdropPath ?? this.backdropPath,
      posterPath: posterPath ?? this.posterPath,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class MovieDetailsMovieNameData {
  final String name;
  final String year;

  MovieDetailsMovieNameData({
    required this.name,
    required this.year,
  });
}

class MovieDetailsScoreData {
  final double voteAverage;
  final String? trailerKey;

  MovieDetailsScoreData({
    required this.voteAverage,
    this.trailerKey,
  });
}

class MovieDetailsMoviePeopleData {
  final String name;
  final String job;

  MovieDetailsMoviePeopleData({
    required this.name,
    required this.job,
  });
}

class MovieDetailsMovieActorDataData {
  final String name;
  final String character;
  final String? profilePath;

  MovieDetailsMovieActorDataData({
    required this.name,
    required this.character,
    this.profilePath,
  });
}

class MovieDetailsData {
  String title = '';
  bool isLoading = true;
  String overview = '';
  MovieDetailsPosterData posterData = MovieDetailsPosterData(isFavorite: false);
  MovieDetailsMovieNameData nameData = MovieDetailsMovieNameData(
    name: '',
    year: '',
  );
  MovieDetailsScoreData scoreData = MovieDetailsScoreData(voteAverage: 0);
  String summary = '';
  List<List<MovieDetailsMoviePeopleData>> peopleData =
      const <List<MovieDetailsMoviePeopleData>>[];

  List<MovieDetailsMovieActorDataData> actorsData =
      const <MovieDetailsMovieActorDataData>[];
}

class MovieDetailsModel extends ChangeNotifier {
  final _authService = AuthService();
  final _movieService = MovieService();

  final int movieId;
  final data = MovieDetailsData();
  final _localeStorage = LocalizedModelStorage();

  late DateFormat _dateFormat;

  MovieDetailsModel(this.movieId);

  Future<void> setupLocale(BuildContext context, Locale locale) async {
    if (!_localeStorage.updateLocale(locale)) return;
    _dateFormat = DateFormat.yMMMMd(_localeStorage.localeTag);
    updateData(null, false);
    await loadDetails(context);
  }

  void updateData(MovieDetails? details, bool isFavorite) {
    data.title = details?.title ?? "Загрузка...";
    data.isLoading = details == null;
    if (details == null) {
      notifyListeners();
      return;
    }
    data.overview = details.overview ?? '';
    data.posterData = MovieDetailsPosterData(
      backdropPath: details.backdropPath,
      posterPath: details.posterPath,
      isFavorite: isFavorite,
    );

    var year = details.releaseDate?.year.toString();
    year = year != null ? ' ($year)' : '';
    data.nameData = MovieDetailsMovieNameData(
      name: details.title,
      year: year,
    );

    final videos = details.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');
    final trailerKey = videos.isNotEmpty == true ? videos.first.key : null;
    data.scoreData = MovieDetailsScoreData(
      voteAverage: details.voteAverage * 10,
      trailerKey: trailerKey,
    );

    data.summary = makeSummary(details);
    data.peopleData = makePeopleData(details);
    data.actorsData = details.credits.cast
        .map((e) => MovieDetailsMovieActorDataData(
              name: e.name,
              character: e.character,
              profilePath: e.profilePath,
            ))
        .toList();
    notifyListeners();
  }

  String makeSummary(MovieDetails details) {
    var texts = <String>[];
    final releaseDate = details.releaseDate;
    if (releaseDate != null) {
      texts.add(_dateFormat.format(releaseDate));
    }
    if (details.productionCountries.isNotEmpty) {
      texts.add('(${details.productionCountries.first.iso})');
    }
    final runtime = details.runtime ?? 0;
    final duration = Duration(minutes: runtime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    texts.add('${hours}h ${minutes}m');
    if (details.genres.isNotEmpty) {
      var genresNames = <String>[];
      for (var genr in details.genres) {
        genresNames.add(genr.name);
      }
      texts.add(genresNames.join(', '));
    }
    return texts.join(', ');
  }

  List<List<MovieDetailsMoviePeopleData>> makePeopleData(MovieDetails details) {
    var crew = details.credits.crew
        .map((e) => MovieDetailsMoviePeopleData(name: e.name, job: e.job))
        .toList();
    crew = crew.length > 4 ? crew.sublist(0, 4) : crew;
    var crewChunks = <List<MovieDetailsMoviePeopleData>>[];
    for (var i = 0; i < crew.length; i += 2) {
      crewChunks.add(
        crew.sublist(i, i + 2 > crew.length ? crew.length : i + 2),
      );
    }
    return crewChunks;
  }

  Future<void> loadDetails(BuildContext context) async {
    try {
      final details = await _movieService.loadDetails(
        movieId: movieId,
        locale: _localeStorage.localeTag,
      );
      updateData(details.details, details.isFavorite);
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }

  Future<void> toggleFavorite(BuildContext context) async {
    data.posterData =
        data.posterData.copyWith(isFavorite: !data.posterData.isFavorite);
    notifyListeners();
    try {
      await _movieService.updateFavorite(
          movieId: movieId, isFavorite: data.posterData.isFavorite);
    } on ApiClientException catch (e) {
      _handleApiClientException(e, context);
    }
  }

  void _handleApiClientException(
      ApiClientException exception, BuildContext context) {
    switch (exception.type) {
      case ApiClientExceptionType.sessionExpired:
        _authService.logout();
        MainNavigation.resetNavigation(context);
        break;
      default:
      // print(exception);
    }
  }
}
