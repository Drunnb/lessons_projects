import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    var itRoute = ModalRoute.of(context)?.settings.name;
    ifActivSavesButton() {
      if (itRoute == '/saves') {
        return const Color.fromARGB(255, 230, 230, 230);
      }
      return Colors.transparent;
    }

    ifActivMicButton() {
      if (itRoute == '/') {
        return const Color.fromARGB(255, 230, 230, 230);
      }
      return Colors.transparent;
    }

    return Row(
      children: [
        Material(
          color: ifActivSavesButton(),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
          child: InkWell(
            onTap: () {
              if (itRoute != '/saves') {
                Navigator.of(context).pushNamed('/saves');
              }
            },
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/icon_save.png',
                  scale: 14.0,
                ),
              ),
            ),
          ),
        ),
        Material(
          color: ifActivMicButton(),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
          child: InkWell(
            onTap: () {
              if (itRoute != '/') {
                Navigator.of(context).pushNamed('/');
              }
            },
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/icon_mic.png',
                  scale: 14.0,
                ),
              ),
            ),
          ),
        ),
        Material(
          color: ifActivSavesButton(),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/saves');
            },
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/icon_menu.png',
                  scale: 14.0,
                ),
              ),
            ),
          ),
        ),
        Material(
          color: ifActivSavesButton(),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
          child: InkWell(
            onTap: () {},
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18.0)),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  'assets/images/icon_timer.png',
                  scale: 14.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
