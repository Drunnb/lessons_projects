// ignore_for_file: avoid_print

import 'package:di_example/ui/widgets/calculator_service.dart';
import 'package:di_example/ui/widgets/example_widget.dart';

class ExampleCalcViewModel implements ExampleViwModel {
  final CalculatorService calculationService;
  const ExampleCalcViewModel(this.calculationService);

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

class ExampelePetViewModel implements ExampleViwModel {
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
