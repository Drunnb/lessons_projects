import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/features/home/widgets/dz_my_movie_widget.dart';
import 'package:madbrains_lesson_project_movie/domain/entity/entity_movie.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        appBar: AppBar(
          title: const Text('Movies'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
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
