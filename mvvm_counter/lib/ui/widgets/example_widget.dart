import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_counter/domain/entity/user.dart';
import 'package:mvvm_counter/domain/services/auth_service.dart';
import 'package:mvvm_counter/domain/services/user_services.dart';
import 'package:mvvm_counter/ui/navigation/main_navigation.dart';
import 'package:provider/provider.dart';

class _ViewModelState {
  final String ageTitle;

  _ViewModelState({required this.ageTitle});
}

class _ViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final _userService = UserService();
  var _state = _ViewModelState(ageTitle: '');
  _ViewModelState get state => _state;
  StreamSubscription<User>? userSubscription;

  _ViewModel() {
    _state = _ViewModelState(ageTitle: _userService.user.age.toString());

    userSubscription = _userService.userStream.listen((user) {
      _state = _ViewModelState(ageTitle: _userService.user.age.toString());
      notifyListeners();
    });
    _userService.openConnect();
  }

  @override
  void dispose() {
    userSubscription?.cancel();
    _userService.closeConnect();
    super.dispose();
  }

  Future<void> onLogoutPressed(BuildContext context) async {
    await _authService.logout();
    MainNavigation.showLoader(context);
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
    final viewModel = context.read<_ViewModel>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () => viewModel.onLogoutPressed(context),
              child: const Text('Выход')),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: _AgeTitle(),
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
