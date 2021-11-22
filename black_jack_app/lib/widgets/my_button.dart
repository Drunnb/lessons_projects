import 'package:flutter/material.dart';

class MyButtonStyle extends StatelessWidget {
  final String label;
  final Function() onPressed;
  MyButtonStyle({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(label),
      color: Colors.brown[200],
      onPressed: onPressed,
    );
  }
}
