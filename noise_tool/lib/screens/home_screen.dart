import 'package:flutter/material.dart';
import 'package:noise_tool/bottom_bar/bottom_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      Navigator.of(context).pushNamed('/info');
                    },
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
                    onTap: () {
                      Navigator.of(context).pushNamed('/settings');
                    },
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
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
