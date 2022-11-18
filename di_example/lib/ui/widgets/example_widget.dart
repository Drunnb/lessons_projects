import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('press'),
        ),
      )),
    );
  }
}
