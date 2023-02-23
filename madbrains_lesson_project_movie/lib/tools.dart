import 'package:madbrains_lesson_project_movie/entity_movie.dart';

class MyTools {
  loadingFunction(List<Movie> Function() func) {
    Future.delayed(const Duration(seconds: 10));
    return func;
  }
}
