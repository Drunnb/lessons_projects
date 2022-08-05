import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_v1/bloc/auth_cubit.dart';
import 'package:social_media_app_v1/screens/posts_screen.dart';
import 'package:social_media_app_v1/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'sign_up_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
<<<<<<< Updated upstream
  String? _email;
  String? _userName;
  String? _password;
=======
  String _email = '';
  String _userName = '';
  String _password = '';
>>>>>>> Stashed changes

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

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    context
        .read<AuthCubit>()
        .signUp(email: _email, userName: _userName, password: _password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
          listener: (pervState, currentState) {
        if (currentState is AuthSignedUp) {
          Navigator.of(context).pushReplacementNamed(PostsScreen.id);
        }
        if (currentState is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: const Duration(seconds: 2),
              content: Text(currentState.message)));
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
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
                          return 'Please enter your email';
                        }
                        return null;
                      }),
                    ),
<<<<<<< Updated upstream
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
=======
                    const SizedBox(height: 15),
                    TextFormField(
                      focusNode: _userNameFocusNode,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Enter your username',
>>>>>>> Stashed changes
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
                          return 'Please enter your username';
                        }
                        return null;
                      }),
                    ),
<<<<<<< Updated upstream
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
=======
                    const SizedBox(height: 15),
                    TextFormField(
                      focusNode: _passwordFocusNode,
                      obscureText: true,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Enter your password',
>>>>>>> Stashed changes
                      ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) {
                        _submit(context);
                      },
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
                      onPressed: () {
                        _submit(context);
                      },
                      child: const Text('Sign Up'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignInScreen.id);
                      },
                      child: const Text('Sing In instead'),
                    ),
<<<<<<< Updated upstream
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
=======
                  ],
                ),
>>>>>>> Stashed changes
              ),
            ),
          ),
        );
      }),
    );
  }
}
