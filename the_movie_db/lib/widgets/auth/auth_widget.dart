import 'package:flutter/material.dart';
import 'package:the_movie_db/Theme/app_button_style.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login to your account'),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
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

class _FormWidget extends StatefulWidget {
  const _FormWidget();

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextConroller = TextEditingController();
  final _passwordTextConroller = TextEditingController();
  String? errorText;

  void _auth() {
    final login = _loginTextConroller.text;
    final password = _passwordTextConroller.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      errorText = 'Ошибка логина или пароля ';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF01B4E4);
    const textStyle = TextStyle(
      fontSize: 16.0,
      color: Color(0xFF212529),
    );
    const textFieldDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 17.0,
            ),
          ),
          const SizedBox(height: 5.0),
        ],
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(height: 5.0),
        TextField(
          controller: _loginTextConroller,
          decoration: textFieldDecoration,
        ),
        const SizedBox(height: 20.0),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(height: 5.0),
        TextField(
          controller: _passwordTextConroller,
          decoration: textFieldDecoration,
          obscureText: true,
        ),
        const SizedBox(height: 25.0),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(
                  Colors.white,
                ),
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
              onPressed: _auth,
              child: const Text('Login'),
            ),
            const SizedBox(width: 30.0),
            TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: _resetPassword,
              child: const Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}
