import 'package:the_movie_db/configuration/configuration.dart';
import 'package:the_movie_db/domain/api_client/account_api_client.dart';
import 'package:the_movie_db/domain/api_client/movie_api_client.dart';
import 'package:the_movie_db/domain/data_providers/session_data_provider.dart';
import 'package:the_movie_db/domain/entity/popular_movie_response.dart';
import 'package:the_movie_db/domain/local_entity/movie_details_local.dart';
import 'package:the_movie_db/ui/widgets/movie_details/movie_details_model.dart';
import 'package:the_movie_db/ui/widgets/movie_list/movie_list_model.dart';

class MovieService
    implements
        MovieDetailsModelMovieProvider,
        MovieListViewModelMoviesProvider {
  final MovieApiClient movieApiClient;
  final SessionDataProvider sessionDataProvider;
  final AccountApiClient accountApiClient;

  const MovieService({
    required this.movieApiClient,
    required this.sessionDataProvider,
    required this.accountApiClient,
  });

  @override
  Future<PopularMovieResponse> popularMovie(int page, String locale) async =>
      movieApiClient.popularMovie(page, locale, Configuration.apiKey);

  @override
  Future<PopularMovieResponse> searchMovie(
          int page, String locale, String query) async =>
      movieApiClient.searchMovie(page, locale, query, Configuration.apiKey);

  @override
  Future<MovieDetailsLocal> loadDetails({
    required int movieId,
    required String locale,
  }) async {
    final movieDetails = await movieApiClient.movieDetails(movieId, locale);
    final sessionId = await sessionDataProvider.getSessionId();
    var isFavorite = false;
    if (sessionId != null) {
      isFavorite = await movieApiClient.isFavorite(movieId, sessionId);
    }
    return MovieDetailsLocal(details: movieDetails, isFavorite: isFavorite);
  }

  @override
  Future<void> updateFavorite({
    required int movieId,
    required bool isFavorite,
  }) async {
    final sessionId = await sessionDataProvider.getSessionId();
    final accountId = await sessionDataProvider.getAccountId();
    if (sessionId == null || accountId == null) return;

    await accountApiClient.markAsFavorite(
        accountId: accountId,
        sessionId: sessionId,
        mediaType: MediaType.movie,
        mediaId: movieId,
        isFavorite: isFavorite);
  }
}
