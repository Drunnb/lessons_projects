import 'package:flutter/material.dart';
import 'package:mvvm_counter/domain/services/user_services.dart';
import 'package:provider/provider.dart';

class _ViewModelState {
  final String ageTitle;

  _ViewModelState({required this.ageTitle});
}

class _ViewModel extends ChangeNotifier {
  final _userService = UserService();
  var _state = _ViewModelState(ageTitle: '');
  _ViewModelState get state => _state;

  void loadValue() async {
    await _userService.initilalize();
    _updateState();
  }

  _ViewModel() {
    loadValue();
  }

  Future<void> onIncrementButtonPress() async {
    _userService.incrementAge();
    _updateState();
  }

  Future<void> onDecrementButtonPress() async {
    _userService.decrementAge();
    _updateState();
  }

  void _updateState() {
    final user = _userService.user;
    _state = _ViewModelState(ageTitle: user.age.toString());
    notifyListeners();
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({super.key});

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => _ViewModel(),
      child: const ExampleWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AgeTitle(),
              _AgeIncrementWidget(),
              _AgeDecrementWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgeTitle extends StatelessWidget {
  const _AgeTitle();

  @override
  Widget build(BuildContext context) {
    final title = context.select((_ViewModel vm) => vm.state.ageTitle);
    return Text(title);
  }
}

class _AgeIncrementWidget extends StatelessWidget {
  const _AgeIncrementWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();

    return ElevatedButton(
      onPressed: viewModel.onIncrementButtonPress,
      child: const Text('+'),
    );
  }
}

class _AgeDecrementWidget extends StatelessWidget {
  const _AgeDecrementWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();

    return ElevatedButton(
      onPressed: viewModel.onDecrementButtonPress,
      child: const Text('-'),
    );
  }
}
