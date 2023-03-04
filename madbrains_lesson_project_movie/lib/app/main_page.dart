import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/app/theme/app_colors.dart';
import 'package:madbrains_lesson_project_movie/features/home/pages/catalog_page.dart';
import 'package:madbrains_lesson_project_movie/features/home/pages/home_page.dart';
import 'package:madbrains_lesson_project_movie/features/settings/pages/settings_page.dart';

class _Tab {
  final Icon icon;
  final String label;
  final Widget page;
  _Tab({
    required this.icon,
    required this.label,
    required this.page,
  });
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const path = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<_Tab> _tabs = <_Tab>[
    _Tab(
      icon: const Icon(Icons.local_movies_outlined),
      label: 'Films List',
      page: const HomePageFromLessonWithList(),
    ),
    _Tab(
      icon: const Icon(Icons.local_movies_rounded),
      label: 'Films Grid',
      page: const HomePageFromLessonWithGrid(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_selectedIndex].label),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) {
                    return SettingsPage(
                      arguments: SettingsArguments('Bobik'),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
      body: _tabs.elementAt(_selectedIndex).page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.mainPurpleColor,
        unselectedItemColor: Colors.white30,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: List.generate(
          _tabs.length,
          (index) {
            return BottomNavigationBarItem(
              icon: _tabs[index].icon,
              label: _tabs[index].label,
            );
          },
        ),
      ),
    );
  }
}
