import 'dart:math';

import 'package:black_jack_app/widgets/cards_grid_view.dart';
import 'package:black_jack_app/widgets/my_button.dart';
import 'package:black_jack_app/widgets/text_score_widget.dart';
import 'package:flutter/material.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({Key? key}) : super(key: key);

  @override
  _BlackJackScreenState createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {
  bool isGameStarted = false;
  List<Image> myCards = [];
  List<Image> dealersCards = [];

  String? playesFirstCard;
  String? playesSecondsCard;

  String? dealersFirstCard;
  String? dealersSecondsCard;

  int playerScore = 0;
  int dealerScore = 0;

  final Map<String, int> deckOfCards = {
    "assets/cards/2.1.png": 2,
    "assets/cards/2.2.png": 2,
    "assets/cards/2.3.png": 2,
    "assets/cards/2.4.png": 2,
    "assets/cards/3.1.png": 3,
    "assets/cards/3.2.png": 3,
    "assets/cards/3.3.png": 3,
    "assets/cards/3.4.png": 3,
    "assets/cards/4.1.png": 4,
    "assets/cards/4.2.png": 4,
    "assets/cards/4.3.png": 4,
    "assets/cards/4.4.png": 4,
    "assets/cards/5.1.png": 5,
    "assets/cards/5.2.png": 5,
    "assets/cards/5.3.png": 5,
    "assets/cards/5.4.png": 5,
    "assets/cards/6.1.png": 6,
    "assets/cards/6.2.png": 6,
    "assets/cards/6.3.png": 6,
    "assets/cards/6.4.png": 6,
    "assets/cards/7.1.png": 7,
    "assets/cards/7.2.png": 7,
    "assets/cards/7.3.png": 7,
    "assets/cards/7.4.png": 7,
    "assets/cards/8.1.png": 8,
    "assets/cards/8.2.png": 8,
    "assets/cards/8.3.png": 8,
    "assets/cards/8.4.png": 8,
    "assets/cards/9.1.png": 9,
    "assets/cards/9.2.png": 9,
    "assets/cards/9.3.png": 9,
    "assets/cards/9.4.png": 9,
    "assets/cards/10.1.png": 10,
    "assets/cards/10.2.png": 10,
    "assets/cards/10.3.png": 10,
    "assets/cards/10.4.png": 10,
    "assets/cards/J1.png": 10,
    "assets/cards/J2.png": 10,
    "assets/cards/J3.png": 10,
    "assets/cards/J4.png": 10,
    "assets/cards/Q1.png": 10,
    "assets/cards/Q2.png": 10,
    "assets/cards/Q3.png": 10,
    "assets/cards/Q4.png": 10,
    "assets/cards/K1.png": 10,
    "assets/cards/K2.png": 10,
    "assets/cards/K3.png": 10,
    "assets/cards/K4.png": 10,
    "assets/cards/A1.png": 11,
    "assets/cards/A2.png": 11,
    "assets/cards/A3.png": 11,
    "assets/cards/A4.png": 11,
  };
  Map<String, int> playingCards = {};

  String randomCard() {
    Random random = Random();
    String cardOneKey =
        playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardOneKey);
    return cardOneKey;
  }

  void changeCards() {
    setState(() {
      isGameStarted = true;
    });

    playingCards = {};
    playingCards.addAll(deckOfCards);

    myCards = [];
    dealersCards = [];

    dealersFirstCard = randomCard();
    dealersSecondsCard = randomCard();
    playesFirstCard = randomCard();
    playesSecondsCard = randomCard();

    dealersCards.add(Image.asset(dealersFirstCard!));
    dealersCards.add(Image.asset(dealersSecondsCard!));

    dealerScore =
        deckOfCards[dealersFirstCard]! + deckOfCards[dealersSecondsCard]!;

    myCards.add(Image.asset(playesFirstCard!));
    myCards.add(Image.asset(playesSecondsCard!));
    playerScore =
        deckOfCards[playesFirstCard]! + deckOfCards[playesSecondsCard]!;

    if (dealerScore <= 14) {
      String thirdDealersCardKey = randomCard();
      dealersCards.add(Image.asset(thirdDealersCardKey));
      dealerScore = dealerScore + deckOfCards[thirdDealersCardKey]!;
    }
  }

  void addCard() {
    if (playingCards.isNotEmpty) {
      String cardKey = randomCard();
      setState(() {
        myCards.add(Image.asset(cardKey));
      });
      playerScore = playerScore + deckOfCards[cardKey]!;
    }
  }

  @override
  void initState() {
    playingCards.addAll(deckOfCards);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isGameStarted
        ? SafeArea(
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextScoreWidget(score: dealerScore),
                        const SizedBox(height: 20),
                        CardsGridView(cards: dealersCards),
                      ],
                    ),
                    Column(
                      children: [
                        TextScoreWidget(score: playerScore),
                        const SizedBox(height: 20),
                        CardsGridView(cards: myCards),
                      ],
                    ),
                    IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyButtonStyle(
                              label: 'Another Card', onPressed: addCard),
                          MyButtonStyle(
                              label: 'Next Round', onPressed: changeCards),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: MyButtonStyle(label: 'Start Game', onPressed: changeCards),
            ),
          );
  }
}
