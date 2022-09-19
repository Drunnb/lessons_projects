import 'package:themoviedb_mvvm/Library/Widgets/Inherited/provider.dart'
    as old_provider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb_mvvm/ui/widgets/auth/auth_model.dart';
import 'package:themoviedb_mvvm/ui/widgets/loader_widget/loader_view_model.dart';
import 'package:themoviedb_mvvm/ui/widgets/loader_widget/loader_widget.dart';
import 'package:themoviedb_mvvm/ui/widgets/main_screen/main_screen_model.dart';
import 'package:themoviedb_mvvm/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:themoviedb_mvvm/ui/widgets/movie_details/movie_details_model.dart';
import 'package:themoviedb_mvvm/ui/widgets/movie_details/movie_details_widget.dart';
import 'package:themoviedb_mvvm/ui/widgets/movie_trailer/movie_trailer_widget.dart';

import '../../ui/widgets/auth/auth_widget.dart';

class ScreenFactory {
  Widget makeLoader() {
    return Provider(
      create: (context) => LoaderViewModel(context),
      lazy: false,
      child: const LoaderWidget(),
    );
  }

  Widget makeAuth() {
    return old_provider.NotifierProvider(
      create: () => AuthModel(),
      child: const AuthWidget(),
    );
  }

  Widget makeMainScreen() {
    return old_provider.NotifierProvider(
      create: () => MainScreenModel(),
      child: const MainScreenWidget(),
    );
  }

  Widget makeMovieDetails(int movieId) {
    return old_provider.NotifierProvider(
      create: () => MovieDetailsModel(movieId),
      child: const MovieDetailsWidget(),
    );
  }

  Widget makeMovieTrailer(String youtubeKey) {
    return MovieTrailerWidget(youtubeKey: youtubeKey);
  }
}
