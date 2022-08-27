import 'package:flutter/widgets.dart';

abstract class Screens {
  static const main = '/';
}

class MainNavigation {
  Map<String, WidgetBuilder> get routes => <String, WidgetBuilder>{
        Screens.main: (_) => const Text('sd'),
      };
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return null;
  }
}
