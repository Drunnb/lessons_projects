// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gallery_app_v2/provider/gallery_data.dart';
import 'package:provider/provider.dart';

class PhotoGallery extends StatefulWidget {
  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  // @override
  // void initState() {
  //   super.initState();
  //   images = getImages();
  //   // getImages().then((value) => print(value));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: GridView.builder(
            itemCount: context.watch<GalleryData>().photos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return Image.network(
                // context.watch<GalleryData>().photos[index], равнозначное использование пройвайдера
                // Provider.of<GalleryData>(context, listen: true).photos[index],
                context.watch<GalleryData>().photos[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}
