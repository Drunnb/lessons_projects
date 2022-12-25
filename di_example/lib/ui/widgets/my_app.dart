import 'package:di_example/factories/di_container.dart';
import 'package:flutter/material.dart';

abstract class MainNavigation {
  Map<String, Widget Function(BuildContext)> makeRoutes();
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {
  final mainNavigation = ServiceLocator.instance.mainNavigation;
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainNavigation.makeRoutes(),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
