// import 'package:flutter/material.dart';

// import 'package:madbrains_lesson_project_movie/entity_movie.dart';

// import 'movie_widget.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<Movie> myList = [];

//   Future<List<Movie>> loadMovie() async {
//     // myList = moviesList;
//     await Future.delayed(const Duration(seconds: 2));
//     myList.addAll(moviesList);
//     return myList;
//   }

//   @override
//   void initState() {
//     loadMovie();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SafeArea(
//         child: Scaffold(
//           body: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(
//                     'assets/images/backgraund.jpg',
//                   ),
//                   fit: BoxFit.cover),
//             ),
//             child: Center(
//               child: Align(
//                 alignment: Alignment.topCenter,
//                 child: SizedBox(
//                     height: 450,
//                     child: FutureBuilder(
//                       initialData: myList,
//                       future: loadMovie(),
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.black.withOpacity(0.5),
//                             ),
//                           );
//                         }
//                         return ListView.builder(
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (context, index) {
//                             return MovieWidget(
//                                 title: snapshot.data![index].title,
//                                 picture: snapshot.data![index].picture,
//                                 description: snapshot.data![index].description,
//                                 language: snapshot.data![index].languageType);
//                           },
//                         );
//                       },
//                     )),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
