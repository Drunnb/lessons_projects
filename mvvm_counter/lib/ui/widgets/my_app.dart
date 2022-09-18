import 'package:flutter/material.dart';
import 'package:mvvm_counter/ui/widgets/auth_widget.dart';
import 'package:mvvm_counter/ui/widgets/example_widget.dart';
import 'package:mvvm_counter/ui/widgets/loader_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'auth') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                AuthWidget.create(),
            transitionDuration: Duration.zero,
          );
        } else if (settings.name == 'example') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                ExampleWidget.create(),
            transitionDuration: Duration.zero,
          );
        } else if (settings.name == 'loader') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                LoaderWidget.create(),
            transitionDuration: Duration.zero,
          );
        }
        return null;
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoaderWidget.create(),
    );
  }
}
