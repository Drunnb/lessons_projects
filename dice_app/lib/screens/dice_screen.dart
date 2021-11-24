import 'dart:math';

import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  final Map<String, int> dices = {
    "assets/dice/dice1.png": 1,
    "assets/dice/dice2.png": 2,
    "assets/dice/dice3.png": 3,
    "assets/dice/dice4.png": 4,
    "assets/dice/dice5.png": 5,
    "assets/dice/dice6.png": 6,
  };
  List<Image> diceInGame = [];

  String randomDice() {
    Random random = Random();
    String dice = dices.keys.elementAt(random.nextInt(dices.length));
    return dice;
  }

  void rollDices() {
    diceInGame.clear();
    var diceOne = randomDice();
    var diceTwo = randomDice();
    diceInGame.add(Image.asset(diceOne));
    diceInGame.add(Image.asset(diceTwo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(253, 164, 164, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            diceInGame.isEmpty
                ? Center(
                    child: Container(
                      height: 150,
                      alignment: Alignment.center,
                      child: const Text(
                        'Бросай Кости',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DiceWidget(dices: diceInGame, index: 0),
                      DiceWidget(dices: diceInGame, index: 1),
                    ],
                  ),
            const SizedBox(height: 150),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(221, 81, 81, 1),
                    fixedSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  setState(() {
                    rollDices();
                  });
                },
                child: const Text('Roll')),
          ],
        ),
      ),
    );
  }
}

class DiceWidget extends StatelessWidget {
  List<Image> dices;
  int? index;
  DiceWidget({
    Key? key,
    required this.dices,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: dices[index!],
    );
  }
}
