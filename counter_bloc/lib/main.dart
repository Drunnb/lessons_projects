import 'package:bloc/bloc.dart';
import 'package:counter_bloc/domain/blocs/blocs_observer.dart';
import 'package:counter_bloc/ui/widgets/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  const app = MyApp();
  Bloc.observer = BlocsObserver();

  runApp(app);
}
