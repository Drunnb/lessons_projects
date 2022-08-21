// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app_v1/bloc/auth_cubit.dart';
import 'package:social_media_app_v1/screens/chat_screen.dart';
import 'package:social_media_app_v1/screens/create_post_screen.dart';
import 'package:social_media_app_v1/screens/posts_screen.dart';
import 'package:social_media_app_v1/screens/sign_in_screen.dart';
import 'package:social_media_app_v1/screens/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  await SentryFlutter.init((options) {
    options.dsn =
        'https://4261fae208304d23b57fa8a3644c94a2@o1369621.ingest.sentry.io/6674008';
    options.tracesSampleRate = 1.0;
  }, appRunner: () async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  Widget _buildHomeScreen() {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return PostsScreen();
          } else {
            return SignInScreen();
          }
        }));
  }

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: _buildHomeScreen(),
        routes: {
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          PostsScreen.id: (context) => PostsScreen(),
          CreatePostScreen.id: (context) => CreatePostScreen(),
          ChatScreen.id: (context) => ChatScreen()
        },
      ),
    );
  }
}
