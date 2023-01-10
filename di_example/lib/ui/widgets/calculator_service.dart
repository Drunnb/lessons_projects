import 'package:di_example/ui/widgets/summator.dart';
import 'package:get_it/get_it.dart';

enum CalculatorServiceOperation { sum }

class CalculatorService {
  final summator = GetIt.instance<Summator>();
  // final summator = ServiceLocator.instance.makeSummator();
  CalculatorService();
  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.sum) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}
