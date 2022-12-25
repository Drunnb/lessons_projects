import 'package:di_example/factories/di_container.dart';

enum CalculatorServiceOperation { sum }

class CalculatorService {
  final summator = ServiceLocator.instance.makeSummator();
  CalculatorService();
  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.sum) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}
