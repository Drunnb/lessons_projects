import 'package:flutter/material.dart';
import 'package:social_media_app_v1/screens/sign_in_screen.dart';
import 'package:social_media_app_v1/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const SignUpScreen(),
      routes: {
        SignInScreen.id: (context) => const SignInScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
      },
    );
  }
}
