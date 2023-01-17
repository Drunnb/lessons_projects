import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/Library/flutter_secure_storage/secure_storage.dart';
import 'package:the_movie_db/Library/http_client/app_http_client.dart';
import 'package:the_movie_db/domain/api_client/account_api_client.dart';
import 'package:the_movie_db/domain/api_client/auth_api_client.dart';
import 'package:the_movie_db/domain/api_client/movie_api_client.dart';
import 'package:the_movie_db/domain/api_client/network_client.dart';
import 'package:the_movie_db/domain/data_providers/session_data_provider.dart';
import 'package:the_movie_db/domain/services/auth_service.dart';
import 'package:the_movie_db/domain/services/movie_service.dart';
import 'package:the_movie_db/main.dart';
import 'package:the_movie_db/ui/navigation/main_navigation.dart';
import 'package:the_movie_db/ui/navigation/main_navigation_actions.dart';
import 'package:the_movie_db/ui/widgets/app/my_app.dart';
import 'package:the_movie_db/ui/widgets/auth/auth_model.dart';
import 'package:the_movie_db/ui/widgets/auth/auth_widget.dart';
import 'package:the_movie_db/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:the_movie_db/ui/widgets/loader_widget/loader_widget.dart';
import 'package:the_movie_db/ui/widgets/main_screen/main_screen.dart';
import 'package:the_movie_db/ui/widgets/movie_details/movie_details_model.dart';
import 'package:the_movie_db/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:the_movie_db/ui/widgets/movie_list/movie_list_model.dart';
import 'package:the_movie_db/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:the_movie_db/ui/widgets/movie_trailer/movie_trailer_widget.dart';
import 'package:the_movie_db/ui/widgets/news/new_widget.dart';
import 'package:the_movie_db/ui/widgets/tv_show_list/tv_show_list_widget.dart';

AppFactory makeAppFactory() => _AppFactoryDefault();

class _AppFactoryDefault implements AppFactory {
  final _diContainer = _DIContainer();
  _AppFactoryDefault();
  @override
  Widget makeApp() => MyApp(navigation: _diContainer._makeMyAppNavigation());
}

class _DIContainer {
  final _mainNavigationAction = const MainNavigationAction();
  final SecureStorage _secureStorage = const SecureStorageDefault();
  final AppHttpClient _httpClient = AppHttpClientDefault();

  _DIContainer();

  ScreenFactory _makeScreenFactory() => ScreenFactoryDefault(this);

  MyAppNavigation _makeMyAppNavigation() =>
      MainNavigation(_makeScreenFactory());

  SessionDataProvider _makeSessionDataProvider() =>
      SessionDataProviderDefault(_secureStorage);

  NetworkClient _makeNetworkClient() => NetworkClientDefault(_httpClient);

  AuthApiClient _makeAuthApiClient() => AuthApiClientDefault(
        _makeNetworkClient(),
      );
  AccountApiClient _makeAccountApiClient() =>
      AccountApiClientDefault(_makeNetworkClient());

  MovieApiClient _makeMovieApiClient() => MovieApiClientDefault(
        _makeNetworkClient(),
      );

  MovieService _makeMovieService() => MovieService(
        movieApiClient: _makeMovieApiClient(),
        sessionDataProvider: _makeSessionDataProvider(),
        accountApiClient: _makeAccountApiClient(),
      );

  AuthService _makeAuthService() => AuthService(
        authApiClient: _makeAuthApiClient(),
        accountApiClient: _makeAccountApiClient(),
        sessionDataProvider: _makeSessionDataProvider(),
      );

  AuthViewModel _makeAuthViewModel() => AuthViewModel(
        mainNavigationAction: _mainNavigationAction,
        loginProvider: _makeAuthService(),
      );

  LoaderViewModel _makeLoaderViewModel(BuildContext context) => LoaderViewModel(
        context: context,
        authStatusProvider: _makeAuthService(),
      );

  MovieDetailsModel _makeMovieDetailsModel(int movieId) =>
      MovieDetailsModel(movieId,
          logoutProvider: _makeAuthService(),
          movieProvider: _makeMovieService(),
          navigationAction: _mainNavigationAction);

  MovieListViewModel _makeMovieListViewModel() =>
      MovieListViewModel(_makeMovieService());
}

class ScreenFactoryDefault implements ScreenFactory {
  final _DIContainer _dIContainer;
  const ScreenFactoryDefault(this._dIContainer);
  @override
  Widget makeLoader() {
    return Provider(
      create: (context) => _dIContainer._makeLoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  @override
  Widget makeAuth() {
    return ChangeNotifierProvider(
      create: (_) => _dIContainer._makeAuthViewModel(),
      child: const AuthWidget(),
    );
  }

  @override
  Widget makeMainScreen() {
    return MainScreenWidget(screenFactory: this);
  }

  @override
  Widget makeMovieDetails(int movieId) {
    return ChangeNotifierProvider(
        create: (_) => _dIContainer._makeMovieDetailsModel(movieId),
        child: const MovieDetailsWidget());
  }

  @override
  Widget makeMovieTrailer(String youtubeKey) {
    return MovieTrailerWidget(youtubeKey: youtubeKey);
  }

  @override
  Widget makeNewsList() {
    return const NewsWidget();
  }

  @override
  Widget makeMovieList() {
    return ChangeNotifierProvider(
      create: (_) => _dIContainer._makeMovieListViewModel(),
      child: const MovieListWidget(),
    );
  }

  @override
  Widget makeTVShowList() {
    return const TWShowListWidget();
  }
}
