import 'package:flutter/material.dart';
import 'package:flutter_animations/ui/widgets/sixth_example_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => const ExampleWidget(),
      },
      onGenerateRoute: (_) {
        return PageRouteBuilder<Object>(
          transitionDuration: const Duration(seconds: 4),
          pageBuilder: (_, __, ___) => const ExampleWidget2(),
        );
      },
    );
  }
}
