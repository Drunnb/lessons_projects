import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/screens/main_tabs/main_tabs_view_model.dart';
import 'package:flutter_fest/resources/resources.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _NavBarWidget(),
    );
  }
}

class _NavBarWidget extends StatelessWidget {
  const _NavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select((MainTabsViewMidel vm) => vm.currentTabIndex);
    final model = context.read<MainTabsViewMidel>();
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final buttons = [
      _BottonNavigationBarItemFactory(AppImages.tabbarCalendar, 'Расписание'),
      _BottonNavigationBarItemFactory(AppImages.tabbarBookmark, 'Избранное'),
      _BottonNavigationBarItemFactory(AppImages.tabbarPoint, 'Как добраться'),
    ];
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: model.setCurrentTabIndex,
      items: [
        BottomNavigationBarItem(
          label: '',
          tooltip: 'Расписание',
          icon: Image.asset(AppImages.tabbarCalendar),
        ),
        BottomNavigationBarItem(
          label: '',
          tooltip: 'Избранное',
          icon: Image.asset(AppImages.tabbarBookmark),
        ),
        BottomNavigationBarItem(
          label: '',
          tooltip: 'Как добраться',
          icon: Image.asset(AppImages.tabbarPoint),
        ),
      ],
    );
  }
}

class _BottonNavigationBarItemFactory {
  final String iconName;
  final String tooltip;

  _BottonNavigationBarItemFactory(this.iconName, this.tooltip);

  BottomNavigationBarItem build(
    int index,
    int currentIndex,
    BottomNavigationBarThemeData theme,
  ) {
    final color = index == currentIndex
        ? theme.selectedItemColor
        : theme.unselectedItemColor;
    return BottomNavigationBarItem(
      label: '',
      tooltip: tooltip,
      icon: Image.asset(
        iconName,
        color: color,
      ),
    );
  }
}
