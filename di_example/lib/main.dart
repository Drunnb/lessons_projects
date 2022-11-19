import 'package:di_example/factories/di_container.dart';
import 'package:flutter/material.dart';

abstract class MainDIContainer {
  makeApp();
}

final diContainer = makeDiContainer();

void main() {
  final app = diContainer.makeApp();
  runApp(app);
}
