// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:madbrains_lesson_project_movie/entity_movie.dart';

import 'movie_widget.dart';

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
    initFieldMovie(moviesList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/backgraund.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MovieWidget(
                    title: moviesList[0].title,
                    language: moviesList[0].languageType,
                    picture: moviesList[0].picture,
                    description: moviesList[0].description,
                  ),
                  MovieWidget(
                    title: moviesList[1].title,
                    language: moviesList[1].languageType,
                    picture: moviesList[1].picture,
                    description: moviesList[1].description,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> initFieldMovie(List<Movie>? list) async {
  list?.map((e) => e.fromStringEnum(e.language));
}
