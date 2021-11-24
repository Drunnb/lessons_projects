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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(253, 164, 164, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/dice/dice1.png"),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/dice/dice6.png"),
                ),
              ],
            ),
            const SizedBox(height: 150),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromRGBO(221, 81, 81, 1))),
                onPressed: () {},
                child: const Text('Roll')),
          ],
        ),
      ),
    );
  }
}
