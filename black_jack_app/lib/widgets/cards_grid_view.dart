import 'package:flutter/material.dart';

class CardsGridView extends StatelessWidget {
  CardsGridView({
    required this.cards,
  });

  final List<Image> cards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
          itemCount: cards.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: cards[index],
            );
          }),
    );
  }
}
