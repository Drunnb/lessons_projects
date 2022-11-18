import 'package:flutter/material.dart';

abstract class ExampleViwModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  final ExampleViwModel model;

  const ExampleWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: model.onPressMe,
              child: const Text('press'),
            ),
            ElevatedButton(
              onPressed: model.onPressMe2,
              child: const Text('press2'),
            ),
          ],
        ),
      )),
    );
  }
}
