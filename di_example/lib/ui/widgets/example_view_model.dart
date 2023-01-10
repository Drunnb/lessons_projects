// ignore_for_file: avoid_print
import 'package:di_example/ui/widgets/calculator_service.dart';
import 'package:di_example/ui/widgets/example_widget.dart';
import 'package:get_it/get_it.dart';

class ExampleCalcViewModel implements ExampleViewModel {
  final calculationService = GetIt.instance<CalculatorService>();
  // final calculationService = ServiceLocator.instance.makeCalculatorService();
  ExampleCalcViewModel();

  @override
  void onPressMe() {
    final result =
        calculationService.calculate(1, 2, CalculatorServiceOperation.sum);
    print(1 + 2);
    print(result);
  }

  @override
  void onPressMe2() {
    print('5');
  }
}

class ExampelePetViewModel implements ExampleViewModel {
  const ExampelePetViewModel();
  @override
  void onPressMe() {
    print('gaf gaf');
  }

  @override
  void onPressMe2() {
    print('meow meow');
  }
}
