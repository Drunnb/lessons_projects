import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stb_v1/bloc/bird_post_cubit.dart';
import 'package:stb_v1/bloc/location_cubit.dart';
import 'package:stb_v1/screens/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit()..getLocation(),
        ),
        BlocProvider<BirdPostCubit>(
          create: (context) => BirdPostCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // Color.fromARGB(255, 54, 70, 92),
          primarySwatch: Colors.blueGrey, // app bar color
          colorScheme: const ColorScheme.light().copyWith(
            primary: const Color.fromARGB(255, 71, 113, 134), // textField color
            secondary: const Color(0xff96BAFF), // Floating action button
          ),
        ),
        home: MapScreen(),
      ),
    );
  }
}
