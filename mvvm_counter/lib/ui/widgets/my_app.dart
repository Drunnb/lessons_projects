import 'package:flutter/material.dart';
import 'package:mvvm_counter/ui/widgets/auth_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWidget.create(),
    );
  }
}
