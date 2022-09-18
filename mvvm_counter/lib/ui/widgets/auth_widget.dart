import 'package:flutter/material.dart';
import 'package:mvvm_counter/domain/data_provider/auth_api_data_provider.dart';
import 'package:mvvm_counter/domain/services/auth_service.dart';
import 'package:mvvm_counter/ui/navigation/main_navigation.dart';
import 'package:provider/provider.dart';

enum _ViewModelAuthButtonState { canSubmit, authProcess, disable }

class _ViewModelState {
  String authErrorTitle = '';
  String login = '';
  String password = '';
  bool isAuthInProcess = false;
  _ViewModelAuthButtonState get authButtonState {
    if (isAuthInProcess) {
      return _ViewModelAuthButtonState.authProcess;
    } else if (login.isNotEmpty && password.isNotEmpty) {
      return _ViewModelAuthButtonState.canSubmit;
    } else {
      return _ViewModelAuthButtonState.disable;
    }
  }

  _ViewModelState();
}

class _ViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final _state = _ViewModelState();
  _ViewModelState get state => _state;

  void changeLogin(String value) {
    if (_state.login == value) return;
    _state.login = value;
    notifyListeners();
  }

  void changePassword(String value) {
    if (_state.password == value) return;
    _state.password = value;
    notifyListeners();
  }

  Future<void> onAuthButtonPressed(BuildContext context) async {
    final login = _state.login;
    final password = _state.password;

    if (login.isEmpty || password.isEmpty) return;

    _state.authErrorTitle = '';
    _state.isAuthInProcess = true;

    notifyListeners();

    try {
      await _authService.login(login, password);
      _state.isAuthInProcess = false;
      notifyListeners();
      MainNavigation.showLoader(context);
    } on AuthApiProviderIncorectLoginDataError {
      _state.authErrorTitle = 'Неправильный логин или пароль';
      _state.isAuthInProcess = false;

      notifyListeners();
    } catch (exeption) {
      _state.authErrorTitle = 'Что то пошло не так, попробуйте повторить позже';

      notifyListeners();
    }
  }
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => _ViewModel(),
      child: const AuthWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _ErrorTitleWidget(),
            SizedBox(height: 10.0),
            _LoginWidget(),
            SizedBox(height: 10.0),
            _PasswordWidget(),
            SizedBox(height: 10.0),
            AuthButtonWidget(),
          ],
        )),
      ),
    );
  }
}

class _LoginWidget extends StatelessWidget {
  const _LoginWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Логин',
        border: OutlineInputBorder(),
      ),
      onChanged: model.changeLogin,
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget();

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Пароль',
        border: OutlineInputBorder(),
      ),
      onChanged: model.changePassword,
    );
  }
}

class _ErrorTitleWidget extends StatelessWidget {
  const _ErrorTitleWidget();

  @override
  Widget build(BuildContext context) {
    final authErrorTitle =
        context.select((_ViewModel value) => value.state.authErrorTitle);

    return Text(authErrorTitle);
  }
}

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<_ViewModel>();
    final authButtonState =
        context.select((_ViewModel value) => value.state.authButtonState);
    final onPressed = authButtonState == _ViewModelAuthButtonState.canSubmit
        ? model.onAuthButtonPressed
        : null;
    final child = authButtonState == _ViewModelAuthButtonState.authProcess
        ? const CircularProgressIndicator()
        : const Text('Авторизоваться');
    return ElevatedButton(
      onPressed: () => onPressed?.call(context),
      child: child,
    );
  }
}
