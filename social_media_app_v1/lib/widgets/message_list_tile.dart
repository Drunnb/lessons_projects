import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_v1/models/chat_model.dart';

class MessageListTile extends StatelessWidget {
  final currentUserID = FirebaseAuth.instance.currentUser!.uid;
  final ChatModel chatModel;
  MessageListTile(this.chatModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(15.0),
            topRight: const Radius.circular(15.0),
            bottomLeft: chatModel.userID == currentUserID
                ? const Radius.circular(15.0)
                : Radius.zero,
            bottomRight: chatModel.userID == currentUserID
                ? Radius.zero
                : const Radius.circular(15.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: chatModel.userID == currentUserID
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            mainAxisAlignment: chatModel.userID == currentUserID
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Text(
                'By ${chatModel.userName}',
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                chatModel.message,
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }
}
