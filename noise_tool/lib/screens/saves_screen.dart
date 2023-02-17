import 'package:flutter/material.dart';
import 'package:noise_tool/bottom_bar/bottom_bar.dart';
import 'package:noise_tool/services/inform_to_screens.dart';

class SavesScreen extends StatelessWidget {
  final InformToScreens informToScreens;
  const SavesScreen(this.informToScreens, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(informToScreens),
      body: const SafeArea(
        child: Text('сохраненные'),
      ),
    );
  }
}
