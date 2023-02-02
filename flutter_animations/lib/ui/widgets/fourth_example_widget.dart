import 'package:flutter/material.dart';

const duration = Duration(milliseconds: 500);

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {},
          );
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            color: Colors.black,
            child: Container(
              width: 100,
              height: 200,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedWidgetExample extends AnimatedWidget {
  const AnimatedWidgetExample(
      {super.key, required AnimationController controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.scale(
      scale: animation.value,
      child: Container(
        width: 100,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
