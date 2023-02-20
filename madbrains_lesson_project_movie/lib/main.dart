// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/entity_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    moviesList[0].fromStringEnum(moviesList[0].language);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            MovieWidget(
              title: moviesList[0].title,
              language: moviesList[0].languageType,
              picture: moviesList[0].picture,
            ),
          ],
        ),
      ),
    );
  }
}

class MovieWidget extends StatelessWidget {
  final String title;
  final String picture;
  final Language language;
  const MovieWidget({
    Key? key,
    required this.title,
    required this.picture,
    required this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
