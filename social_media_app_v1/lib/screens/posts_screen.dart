import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app_v1/bloc/auth_cubit.dart';
import 'package:social_media_app_v1/screens/create_post_screen.dart';
import 'package:social_media_app_v1/screens/sign_in_screen.dart';

class PostsScreen extends StatefulWidget {
  static const String id = 'posts_screen';
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final picker = ImagePicker();
                picker
                    .pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 40,
                )
                    .then((xFile) {
                  if (xFile != null) {
                    final File file = File(xFile.path);

                    Navigator.of(context).pushNamed(
                      CreatePostScreen.id,
                      arguments: xFile,
                    );
                  }
                });
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                context.read<AuthCubit>().signOut().then((_) =>
                    Navigator.of(context)
                        .pushReplacementNamed(SignInScreen.id));
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Container(),
      // body: ListView.builder(
      //   itemCount: 2,
      //   itemBuilder: (context, index) {
      //     return Container();
      //   },
      // ),
    );
  }
}
