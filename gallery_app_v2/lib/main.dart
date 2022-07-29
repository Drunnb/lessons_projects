import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app_v2/bloc/gallery_cubit.dart';

import 'package:gallery_app_v2/screens/photo_gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GalleryCubit>(
      create: (context) => GalleryCubit()..getPhotos(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: PhotoGallery(),
      ),
    );
  }
}
