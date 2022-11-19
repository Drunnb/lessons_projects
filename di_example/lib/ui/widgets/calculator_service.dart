import 'package:di_example/ui/widgets/summator.dart';

enum CalculatorServiceOperation { sum }

class CalculatorService {
  final Summator summator;
  const CalculatorService(this.summator);
  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.sum) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}
