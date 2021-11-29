import 'package:flutter/material.dart';
import 'package:gallery_app/keys.dart';
import 'package:gallery_app/services/network_helper.dart';

class PhotoGallery extends StatefulWidget {
  PhotoGallery({Key? key}) : super(key: key);

  @override
  _PhotoGalleryState createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  Future<List<String>>? images;
  Future<List<String>> getImages() async {
    List<String> images = [];
    String url = 'https://pixabay.com/api/?key=$pixabyApiKey&image_type=prhoto';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();
    List<dynamic> hitsList = data['hits'] as List;
    for (int i = 0; i < hitsList.length; i++) {
      images.add(hitsList[i]['largeImageURL']);
    }
    return images;
  }

  @override
  void initState() {
    super.initState();
    images = getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            itemBuilder: (context, index) {
              return Container();
            }),
      ),
    );
  }
}
