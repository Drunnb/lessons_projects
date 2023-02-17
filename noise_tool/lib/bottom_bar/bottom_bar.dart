// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';
import 'package:noise_tool/services/inform_to_screens.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:noise_tool/screens/home_screen.dart';

import '../services/all_routes.dart';

class BottomBar extends StatefulWidget {
  final InformToScreens informToScreens;
  const BottomBar(this.informToScreens, {Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Color activeButtonColor(String route) {
    if (route == widget.informToScreens.thisRoute) {
      return const Color.fromARGB(255, 230, 230, 230);
    }
    return Colors.transparent;
  }

  bool getIsRecording() {
    setState(() {});
    return context.findAncestorStateOfType<HomeScreenState>()?.isRecording ??
        false;
  }

  void getOnStart() =>
      context.findAncestorStateOfType<HomeScreenState>()?.start();

  void getOnStop() =>
      context.findAncestorStateOfType<HomeScreenState>()?.stop();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
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
              widget.informToScreens.goToRoute(AllRoutes.home);
              if (widget.informToScreens.thisRoute == AllRoutes.home &&
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
                  color: getIsRecording() ? Colors.green : Colors.black,
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
              widget.informToScreens.goToRoute(AllRoutes.saves);
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
