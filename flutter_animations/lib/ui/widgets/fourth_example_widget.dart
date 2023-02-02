import 'package:flutter/material.dart';

const duration = Duration(milliseconds: 500);

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              if (_controller.isCompleted) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
            },
          );
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40.0),
            color: Colors.black,
            // child: ScaleTransitionExample(
            //   controller: _controller,
            // )),
            child: AnimatedWidgetExample(controller: _controller),
          ),
        ),
      ),
    );
  }
}

class ScaleTransitionExample extends AnimatedWidget {
  final AnimationController controller;
  const ScaleTransitionExample({super.key, required this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        // return child ?? const SizedBox.shrink();
        return Transform.scale(
          scale: controller.value,
          child: child,
        );
      },
      child: Container(
        width: 100,
        height: 200,
        color: Colors.red,
      ),
    );

    // ScaleTransition(
    //   scale: controller,
    //   child: Container(
    //     width: 100,
    //     height: 200,
    //     color: Colors.red,
    //   ),
    // );
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
