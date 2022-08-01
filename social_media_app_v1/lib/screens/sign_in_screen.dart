import 'package:flutter/material.dart';
import 'package:social_media_app_v1/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  static const String id = 'sign_in_screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  late String _email;
  late String _password;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
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
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
                    },
                    onSaved: (value) {
                      _email = value!.trim();
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
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
                        return 'Please enter your password';
                      }
                      if (value.length < 5) {
                        return 'Please enter more symbols';
                      }
                      return null;
                    }),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Sign In'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(SignUpScreen.id);
                    },
                    child: const Text('Sing Up instead'),
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
