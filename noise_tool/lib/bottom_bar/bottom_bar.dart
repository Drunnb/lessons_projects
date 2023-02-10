import 'package:flutter/material.dart';
import 'package:noise_tool/main.dart';
import 'package:noise_tool/screens/home_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    String? thisRoute() => ModalRoute.of(context)?.settings.name;
    print(thisRoute());
    Color activeButtonColor(String route) {
      if (route == thisRoute()) {
        return const Color.fromARGB(255, 230, 230, 230);
      }
      return Colors.transparent;
    }

    getIsRecording() {
      return context.findAncestorStateOfType<HomeScreenState>()?.isRecording;
    }

    void getOnStart() {
      context.findAncestorStateOfType<HomeScreenState>()?.start();
    }

    void getOnStop() {
      context.findAncestorStateOfType<HomeScreenState>()?.stop();
    }

    return Row(
      children: [
        Material(
          // color: activeButtonColor('/saves'),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
          child: InkWell(
            onTap: () {
              // if (thisRoute() != '/saves') {
              //   Navigator.of(context).pushNamed('/saves');
              // }
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
          color: activeButtonColor(AllRoutes.home),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
          child: InkWell(
            onTap: () async {
              if (thisRoute() != AllRoutes.home) {
                Navigator.of(context).pushNamed(AllRoutes.home);
              }
              if (thisRoute() == AllRoutes.home &&
                  await Permission.microphone.status.isDenied) {
                await Permission.microphone.request();
              } else {
                print(Permission.microphone.status);
              }
              if (getIsRecording() == false) {
                getOnStart();
              } else if (getIsRecording() == true) {
                getOnStop();
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
          color: activeButtonColor(AllRoutes.saves),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(18.0)),
          child: InkWell(
            onTap: () {
              if (thisRoute() != AllRoutes.saves) {
                Navigator.of(context).pushNamed(AllRoutes.saves);
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
                  'assets/images/icon_menu.png',
                  scale: 14.0,
                ),
              ),
            ),
          ),
        ),
        Material(
          // color: activeButtonColor(),
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
