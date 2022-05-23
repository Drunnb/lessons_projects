import 'package:flutter/material.dart';
import 'package:gallery_app_v1/provider/gallery_data.dart';
import 'package:gallery_app_v1/screens/photo_gallery_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GalleryData()..getImages(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: PhotoGallery(),
      ),
    );
  }
}
