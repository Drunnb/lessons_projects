import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
                      arguments: file,
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error snapshot'));
          }
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return const Center(child: Text('Error loading'));
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              final QueryDocumentSnapshot doc = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(doc['imageURL']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      doc['userName'] ?? '',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      doc['description'],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
