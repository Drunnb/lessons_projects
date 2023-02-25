import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/entity_movie.dart';
import 'package:madbrains_lesson_project_movie/movie_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> myList = [];

  Future<List<Movie>> getMovies() async {
    await Future.delayed(const Duration(seconds: 2));
    var response = moviesList; // имитация обращения к ресурсам сеть\хранилище
    return response;
  }

  @override
  void initState() {
    getMovies().then((value) {
      setState(() {
        myList.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            child: myList.isNotEmpty
                ? Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      // height: 450,
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
                      ),
                    ),
                  )
                : CircularProgressIndicator(
                    color: Colors.black.withOpacity(0.5)),
          ),
        ),
      ),
    );
  }
}
