import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/navigation/main_navigation_route_name.dart';
import 'package:the_movie_db/ui/widgets/app/my_app.dart';

abstract class ScreenFactory {
  Widget makeLoader();
  Widget makeAuth();
  Widget makeMainScreen();
  Widget makeMovieDetails(int movieId);
  Widget makeMovieTrailer(String youtubeKey);
  Widget makeNewsList();
  Widget makeMovieList();
  Widget makeTVShowList();
}

class MainNavigation implements MyAppNavigation {
  final ScreenFactory screenFactory;

  const MainNavigation(this.screenFactory);

  @override
  Map<String, Widget Function(BuildContext)> get routes =>
      <String, Widget Function(BuildContext)>{
        MainNavigationRouteNames.loaderWidget: (_) =>
            screenFactory.makeLoader(),
        MainNavigationRouteNames.auth: (_) => screenFactory.makeAuth(),
        MainNavigationRouteNames.mainScreen: (_) =>
            screenFactory.makeMainScreen(),
      };
  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.movieDetails:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
          builder: (_) => screenFactory.makeMovieDetails(movieId),
        );
      case MainNavigationRouteNames.movieTrailerWidget:
        final arguments = settings.arguments;
        final youtubeKey = arguments is String ? arguments : '';
        return MaterialPageRoute(
          builder: (_) => screenFactory.makeMovieTrailer(youtubeKey),
        );
      default:
        const winget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => winget);
    }
  }
}
