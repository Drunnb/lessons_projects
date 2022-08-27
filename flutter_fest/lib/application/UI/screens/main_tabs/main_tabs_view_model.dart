import 'package:flutter/material.dart';

class MainTabsViewMidel extends ChangeNotifier {
  var _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;
  void setCurrentTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }
}
