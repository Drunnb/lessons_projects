import 'package:di_example/main.dart';
import 'package:di_example/ui/widgets/calculator_service.dart';
import 'package:di_example/ui/widgets/example_view_model.dart';
import 'package:di_example/ui/widgets/example_widget.dart';
import 'package:di_example/ui/widgets/main_navigation.dart';
import 'package:di_example/ui/widgets/my_app.dart';
import 'package:di_example/ui/widgets/summator.dart';
import 'package:flutter/material.dart';

MainDIContainer makeDiContainer() => _DIContainer();

class _DIContainer implements MainDIContainer, ScreenFactory {
  late final MainNavigation _mainNavigation;

  Summator _makeSummator() => const Summator();
  CalculatorService _makeCalculatorService() => CalculatorService(
        _makeSummator(),
      );
  ExampleViwModel _makeExampleViewModel() => ExampleCalcViewModel(
        _makeCalculatorService(),
      );

  @override
  Widget makeExampleScreen() => ExampleWidget(
        model: _makeExampleViewModel(),
      );

  @override
  Widget makeApp() => MyApp(mainNavigation: _mainNavigation);

  _DIContainer() {
    _mainNavigation = MainNavigationDefault(this);
  }
}
