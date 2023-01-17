import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/widgets/app/my_app.dart';

abstract class AppFactory {}

void main() {
  const app = MyApp();
  runApp(app);
}
