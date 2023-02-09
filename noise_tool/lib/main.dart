import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NeueMachina',
      ),
      home: const Scaffold(
        body: SafeArea(
          child: NoiseMeterScreen(),
        ),
      ),
    );
  }
}

class NoiseMeterScreen extends StatelessWidget {
  const NoiseMeterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/icon_flash.png',
                    scale: 14.0,
                  ),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/icon_settings.png',
                    scale: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                color: Colors.blue,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    '43.1',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 80,
                      color: Color.fromARGB(255, 60, 60, 60),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Min 35.1',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Max 76.3',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18.0)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                height: 75,
                child: Image.asset(
                  'assets/images/icon_save.png',
                  scale: 14.0,
                ),
              ),
            ),
            Material(
              color: const Color.fromARGB(255, 230, 230, 230),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18.0)),
              child: InkWell(
                onTap: () {},
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(18.0)),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 75,
                  child: Image.asset(
                    'assets/images/icon_mic.png',
                    scale: 14.0,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18.0)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                height: 75,
                child: Image.asset(
                  'assets/images/icon_menu.png',
                  scale: 14.0,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18.0)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                height: 75,
                child: Image.asset(
                  'assets/images/icon_timer.png',
                  scale: 14.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
