import 'package:di_example/factories/di_container.dart';
import 'package:di_example/ui/widgets/example_view_model.dart';
import 'package:di_example/ui/widgets/example_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class MainNavigation {
  Map<String, Widget Function(BuildContext)> makeRoutes();
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {
  final mainNavigation = ServiceLocator.instance.mainNavigation;
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<ExampleViewModel>(
      create: (_) => ExampleCalcViewModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: mainNavigation.makeRoutes(),
        onGenerateRoute: mainNavigation.onGenerateRoute,
      ),
    );
  }
}
