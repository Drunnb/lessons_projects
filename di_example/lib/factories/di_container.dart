import 'package:di_example/ui/widgets/calculator_service.dart';
import 'package:di_example/ui/widgets/example_view_model.dart';
import 'package:di_example/ui/widgets/example_widget.dart';
import 'package:di_example/ui/widgets/main_navigation.dart';
import 'package:di_example/ui/widgets/my_app.dart';
import 'package:di_example/ui/widgets/summator.dart';
import 'package:flutter/material.dart';

class ServiceLocator {
  static final instance = ServiceLocator._();
  ServiceLocator._();

  final MainNavigation mainNavigation = MainNavigationDefault();

  Summator makeSummator() => const Summator();

  CalculatorService makeCalculatorService() => CalculatorService();

  ExampleViewModel makeExampleViewModel() => ExampleCalcViewModel();

  Widget makeExampleScreen() => const ExampleWidget();

  Widget makeApp() => MyApp();
}
