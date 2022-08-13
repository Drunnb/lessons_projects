import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app_v1/models/chat_model.dart';
import 'package:social_media_app_v1/models/post_model.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  late String _message;

  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)!.settings.arguments as Post;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('posts')
                  .doc(post.id)
                  .collection('comments')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: const Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.connectionState == ConnectionState.none) {
                  return Center(child: const Text('Loading...'));
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length ?? 0,
                  itemBuilder: (context, index) {
                    final QueryDocumentSnapshot doc =
                        snapshot.data!.docs[index];
                    final ChatModel chatModel = ChatModel(
                      timestamp: doc['timestamp'],
                      message: doc['message'],
                      userName: doc['userName'],
                      userID: doc['userID'],
                    );
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('By ${chatModel.userName}'),
                            const SizedBox(height: 4),
                            Text(chatModel.message),
                            const SizedBox(height: 4),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: TextField(
                    controller: _textEditingController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      hintText: 'Enter message',
                    ),
                    onChanged: (value) => _message = value,
                  ),
                )),
                IconButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('posts')
                          .doc(post.id)
                          .collection('comments')
                          .add({
                            'userID': FirebaseAuth.instance.currentUser!.uid,
                            'userName':
                                FirebaseAuth.instance.currentUser!.displayName,
                            'message': _message,
                            'timestamp': Timestamp.now(),
                          })
                          .then((value) => print('chat doc added'))
                          .catchError((onError) =>
                              print('Error has occured while adding chat doc'));
                      _textEditingController.clear();
                      setState(() {
                        _message = '';
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_ios_rounded))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
