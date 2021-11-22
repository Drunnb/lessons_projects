import 'package:flutter/material.dart';

class TextScoreWidget extends StatelessWidget {
  TextScoreWidget({
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Text(
      ' Score $score',
      style:
          TextStyle(color: score <= 21 ? Colors.green[900] : Colors.red[900]),
    );
  }
}
