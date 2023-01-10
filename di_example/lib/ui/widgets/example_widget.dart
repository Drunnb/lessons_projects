import 'package:di_example/ui/widgets/example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class ExampleViewModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final model = GetIt.instance<ExampleViewModel>();
    // final model = context.read<ExampleViewModel>();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: model.onPressMe,
              child: const Text('press'),
            ),
            ElevatedButton(
              onPressed: model.onPressMe2,
              child: const Text('press2'),
            ),
            ElevatedButton(
              onPressed: () {
                GetIt.instance.unregister<ExampleViewModel>();
                GetIt.instance.registerFactory<ExampleViewModel>(
                    () => const ExampelePetViewModel());
              },
              child: const Text('press3'),
            ),
          ],
        ),
      )),
    );
  }
}
