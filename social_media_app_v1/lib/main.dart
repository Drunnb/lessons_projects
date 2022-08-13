// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_v1/bloc/auth_cubit.dart';
import 'package:social_media_app_v1/screens/create_post_screen.dart';
import 'package:social_media_app_v1/screens/posts_screen.dart';
import 'package:social_media_app_v1/screens/sign_in_screen.dart';
import 'package:social_media_app_v1/screens/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: ((context) => AuthCubit()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const SignUpScreen(),
        routes: {
          SignInScreen.id: (context) => const SignInScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          PostsScreen.id: (context) => PostsScreen(),
          CreatePostScreen.id: (context) => CreatePostScreen(),
        },
      ),
    );
  }
}
