import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePostScreen extends StatefulWidget {
  static const String id = 'create_post_screen';

  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  late String _description;
  @override
  Widget build(BuildContext context) {
    final File imageFile = ModalRoute.of(context)?.settings.arguments as File;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 1.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(imageFile),
                fit: BoxFit.cover,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter a description',
            ),
            textInputAction: TextInputAction.done,
            inputFormatters: [
              LengthLimitingTextInputFormatter(150),
            ],
            onChanged: (value) {
              _description = value;
            },
            onEditingComplete: () {
              // _submit(image: imageFile, description: _description);
            },
          ),
        ],
      ),
    );
  }
}
