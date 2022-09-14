import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _ViewModelState {
  final String authErrorTitle;
  _ViewModelState({
    required this.authErrorTitle,
  });
}

class _ViewModel extends ChangeNotifier {}

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
    return Container();
  }
}
// 40:09