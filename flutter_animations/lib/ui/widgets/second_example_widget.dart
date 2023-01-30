// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const duration = Duration(milliseconds: 350);

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({super.key});

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  var toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            toggle = !toggle;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            color: Colors.black,
            child: TweenAnimationBuilderExample(toggle: toggle),
          ),
        ),
      ),
    );
  }
}

// баг - анимация срабатывает только при двойном клике по кнопке
class TweenAnimationBuilderExample extends StatelessWidget {
  final bool toggle;
  static final forwardAnim = Tween(
    begin: 0.0,
    end: 1.0,
  );
  final reversAnim = ReverseTween(forwardAnim);
  TweenAnimationBuilderExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: toggle ? forwardAnim : reversAnim,
      duration: duration,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: SizedBox(
            width: 200 * value,
            height: 200 * value,
            child: Container(
              color: Colors.red,
            ),
          ),
        );
      },
    );
  }
}
