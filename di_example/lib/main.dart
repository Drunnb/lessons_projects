import 'package:di_example/factories/di_container.dart';
import 'package:flutter/material.dart';

void main() {
  final app = ServiceLocator.instance.makeApp();
  runApp(app);
}
