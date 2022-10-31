import 'package:flutter/material.dart';
import 'package:the_movie_db/Library/Widgets/inherited/provider.dart';
import 'package:the_movie_db/ui/widgets/app/my_app.dart';
import 'package:the_movie_db/ui/widgets/app/my_app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  const app = MyApp();
  final widget = Provider(model: model, child: app);
  runApp(widget);
}
