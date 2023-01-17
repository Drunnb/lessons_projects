import 'package:flutter/material.dart';
import 'package:the_movie_db/di/di_container.dart';

abstract class AppFactory {
  Widget makeApp();
}

final appFactory = makeAppFactory();

void main() {
  final app = appFactory.makeApp();
  runApp(app);
}
