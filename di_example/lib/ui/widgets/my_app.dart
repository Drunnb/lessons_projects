import 'package:di_example/ui/widgets/example_view_model.dart';
import 'package:di_example/ui/widgets/example_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExampleWidget(model: ExampleCalcViewModel()),
    );
  }
}
