import 'package:flutter/material.dart';
import 'package:noise_tool/bottom_bar/bottom_bar.dart';

class SavesScreen extends StatelessWidget {
  const SavesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Text('сохраненные'),
      ),
    );
  }
}
