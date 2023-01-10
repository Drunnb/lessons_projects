import 'package:di_example/main.dart';
import 'package:di_example/ui/widgets/calculator_service.dart';
import 'package:di_example/ui/widgets/example_view_model.dart';
import 'package:di_example/ui/widgets/example_widget.dart';
import 'package:di_example/ui/widgets/main_navigation.dart';
import 'package:di_example/ui/widgets/my_app.dart';
import 'package:di_example/ui/widgets/summator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupGetIt() {
  GetIt.instance
      .registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance);

  GetIt.instance.registerSingletonWithDependencies<ScreenFactory>(
    () => ScreenFactoryDefault(),
    dependsOn: [SharedPreferences],
  );
  GetIt.instance.registerSingletonWithDependencies<MainNavigation>(
    () => MainNavigationDefault(),
    dependsOn: [ScreenFactory],
  );

  GetIt.instance.registerFactory<Summator>(() => const Summator());
  GetIt.instance.registerFactory<AppFactory>(() => const AppFactoryDefault());
  GetIt.instance.registerFactory<CalculatorService>(() => CalculatorService());
  GetIt.instance
      .registerFactory<ExampleViewModel>(() => ExampleCalcViewModel());
}

// class ServiceLocator {
//   static final instance = ServiceLocator._();
//   ServiceLocator._();

//   final MainNavigation mainNavigation = MainNavigationDefault();

//   Summator makeSummator() => const Summator();

//   CalculatorService makeCalculatorService() => CalculatorService();

//   ExampleViewModel makeExampleViewModel() => ExampleCalcViewModel();

//   Widget makeExampleScreen() => const ExampleWidget();

//   Widget makeApp() => MyApp();
// }

class ScreenFactoryDefault implements ScreenFactory {
  ScreenFactoryDefault() {
    setup();
  }

  Future<void> setup() async {
    final storage = await GetIt.instance.getAsync<SharedPreferences>();
    storage.setBool('key', true);
  }

  @override
  Widget makeExampleScreen() => const ExampleWidget();
}

class AppFactoryDefault implements AppFactory {
  const AppFactoryDefault();
  @override
  Widget makeApp() => MyApp();
}
