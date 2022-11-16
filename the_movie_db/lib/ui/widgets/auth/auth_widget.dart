import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/ui/Theme/app_button_style.dart';
import 'package:the_movie_db/ui/navigation/maint_navigation.dart';
import 'package:the_movie_db/ui/widgets/auth/auth_view_cubit.dart';

class _AuthDataStorage {
  String login = '';
  String password = '';
}

class AuthWidget extends StatelessWidget {
  const AuthWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewCubit, AuthViewCubitState>(
      listener: _onAuthViewCubitStateChange,
      child: Provider(
        create: (_) => _AuthDataStorage(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Login to your account'),
          ),
          body: ListView(
            children: const [
              _HeaderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

void _onAuthViewCubitStateChange(
  BuildContext context,
  AuthViewCubitState state,
) {
  if (state is AuthViewCubitSuccessAuthState) {
    MainNavigation.resetNavigation(context);
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25.0),
          const _FormWidget(),
          const SizedBox(height: 25.0),
          const Text(
            'In order to use the editing and rating capabilities of TMDb, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple,',
            style: textStyle,
          ),
          const SizedBox(height: 5.0),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Register'),
          ),
          const SizedBox(height: 25.0),
          const Text(
              'If you signed up but didn`t get your verification email.'),
          const SizedBox(height: 5.0),
          TextButton(
            style: AppButtonStyle.linkButton,
            onPressed: () {},
            child: const Text('Verify email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget();

  @override
  Widget build(BuildContext context) {
    final authDataStorage = context.read<_AuthDataStorage>();
    const textStyle = TextStyle(
      fontSize: 16.0,
      color: Color(0xFF212529),
    );
    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      isCollapsed: true,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessgeWidget(),
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(height: 5.0),
        TextField(
          decoration: textFieldDecoration,
          onChanged: (text) => authDataStorage.login = text,
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(height: 5.0),
        TextField(
          decoration: textFieldDecoration,
          onChanged: (text) => authDataStorage.password = text,
          obscureText: true,
        ),
        const SizedBox(height: 25.0),
        Row(
          children: [
            const _AuthButtonWidget(),
            const SizedBox(width: 30.0),
            TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: const Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget();

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF01B4E4);
    final cubit = context.watch<AuthViewCubit>();
    final authDataStorage = context.read<_AuthDataStorage>();
    final canStartAuth = cubit.state is AuthViewCubitFormFillInProgressSState ||
        cubit.state is AuthViewCubitErrorState;
    final onPressed = canStartAuth
        ? () => cubit.auth(
              login: authDataStorage.login,
              password: authDataStorage.password,
            )
        : null;
    final child = cubit.state is AuthViewCubitAuthProgressState
        ? const SizedBox(
            height: 15.0,
            width: 15.0,
            child: CircularProgressIndicator(strokeWidth: 2))
        : const Text('Login');
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class _ErrorMessgeWidget extends StatelessWidget {
  const _ErrorMessgeWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((AuthViewCubit c) {
      final state = c.state;
      return state is AuthViewCubitErrorState ? state.errorMessage : null;
    });
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 17.0,
        ),
      ),
    );
  }
}
