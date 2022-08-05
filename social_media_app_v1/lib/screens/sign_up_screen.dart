import 'package:flutter/material.dart';
import 'package:social_media_app_v1/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'sign_up_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _userName;
  String? _password;

  late final FocusNode _passwordFocusNode;
  late final FocusNode _userNameFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _userNameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _userNameFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Text('Social Media App',
                        style: Theme.of(context).textTheme.headline3),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Enter your email',
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_userNameFocusNode);
                    },
                    onSaved: (value) {
                      _email = value!.trim();
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        print('пмыло в синг ап');
                        return 'Please enter your email';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    focusNode: _userNameFocusNode,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Enter your username',
                    ),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    onSaved: (value) {
                      _userName = value!.trim();
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        print('введите имя');
                        return 'Please enter your username';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    focusNode: _passwordFocusNode,
                    obscureText: true,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Enter your password',
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) {},
                    onSaved: (value) {
                      _password = value!.trim();
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        print('пас в синг ап');
                        return 'Please enter your password';
                      }
                      if (value.length < 5) {
                        print('коротки пас в синг ап');
                        return 'Please enter more symbols';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign Up'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignInScreen.id);
                    },
                    child: const Text('Sing In instead'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
