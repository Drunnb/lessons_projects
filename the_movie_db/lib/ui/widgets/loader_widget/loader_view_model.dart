// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/navigation/main_navigation_route_name.dart';

abstract class LoaderViewModelAuthStatusProvider {
  Future<bool> isAuth();
}

class LoaderViewModel {
  final BuildContext context;
  final LoaderViewModelAuthStatusProvider authStatusProvider;

  LoaderViewModel({required this.context, required this.authStatusProvider}) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await authStatusProvider.isAuth();
    final nextScreen = isAuth
        ? MainNavigationRouteNames.mainScreen
        : MainNavigationRouteNames.auth;
    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}
