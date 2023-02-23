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
  late List<Movie> myList;

  loadMovie() {
    myList = moviesList;
    // await Future.delayed(const Duration(seconds: 10));
    // myList.addAll(moviesList);
  }

  @override
  void initState() {
    loadMovie();
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
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: 400,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: myList.length,
                      itemBuilder: (context, index) {
                        return MovieWidget(
                            title: myList[index].title,
                            picture: myList[index].picture,
                            description: myList[index].description,
                            language: myList[index].languageType);
                      },
                    )),
              ),
              // child: Column(
              //   // mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     MovieWidget(
              //       title: myList[0].title,
              //       language: myList[0].languageType,
              //       picture: myList[0].picture,
              //       description: myList[0].description,
              //     ),
              //     MovieWidget(
              //       title: myList[1].title,
              //       language: myList[1].languageType,
              //       picture: myList[1].picture,
              //       description: myList[1].description,
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
