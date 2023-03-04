import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? text;
  String? imageUrl;
  bool isCached = false;

  void _sendRequest() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Dio Demo Page'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (imageUrl != null) Image.network(imageUrl!),
            Text(
              text ?? 'no data yet',
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: _sendRequest,
              child: const Text('send request'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('enable cache'),
                Switch(
                  value: isCached,
                  onChanged: (value) {
                    setState(() {
                      isCached = value;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
