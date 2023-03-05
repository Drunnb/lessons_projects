import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// https://cat-fact.herokuapp.com/facts/random

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? text;
  String? imageUrl;
  bool isCached = false;
  Dio dio = Dio();

  @override
  void initState() {
    dio.interceptors.add(LogInterceptor());
    dio.options.baseUrl = 'https://cat-fact.herokuapp.com/facts';
    super.initState();
  }

  void _sendRequest() async {
    try {
      Response response = await dio.get('/random');
      setState(() {
        text = response.data['text'];
        imageUrl = 'https://http.cat/${response.statusCode}';
      });
    } catch (e) {
      setState(() {
        text = e.toString();
      });
    }
  }

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
              child: const Text('update fact'),
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
