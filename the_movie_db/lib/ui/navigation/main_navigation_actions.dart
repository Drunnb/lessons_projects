import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/navigation/main_navigation_route_name.dart';

class MainNavigationAction {
  const MainNavigationAction();
  void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.loaderWidget,
      (route) => false,
    );
  }
}
