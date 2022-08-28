import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/screens/main_tabs/main_tabs_view_model.dart';
import 'package:flutter_fest/application/UI/screens/main_tabs/schedule_widget.dart';
import 'package:flutter_fest/resources/resources.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: const _NavBarWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select((MainTabsViewMidel vm) => vm.currentTabIndex);
    return IndexedStack(
      index: currentIndex,
      children: const [
        ScheduleWidget(),
        Center(
          child: Text(
            '1',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Center(
          child: Text(
            '2',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Center(
          child: Text(
            '3',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}

class _NavBarWidget extends StatelessWidget {
  const _NavBarWidget();

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
    ]
        .asMap()
        .map((index, value) {
          return MapEntry(index, value.build(index, currentIndex, theme));
        })
        .values
        .toList();
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: model.setCurrentTabIndex,
      items: buttons,
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
