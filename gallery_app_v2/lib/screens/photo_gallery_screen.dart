// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gallery_app_v2/keys.dart';
import 'package:gallery_app_v2/services/network_helper.dart';

class PhotoGallery extends StatefulWidget {
  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  Future<List<String>>? images;
  Future<List<String>> getImages() async {
    List<String> images = [];
    // String url = 'https://pixabay.com/api/?key=$pixabyApiKey&image_type=prhoto';
    String url =
        "https://api.unsplash.com/photos/random/?client_id=$unsplashApiKey&count=20";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();
    List<dynamic> photoList = data as List<dynamic>;

    // List<dynamic> hitsList = data['hits'] as List;
    for (int i = 0; i < photoList.length; i++) {
      // photosList[0].urls.raw
      images.add(photoList[i].urls.smallS3);
    }

    return images;
  }

  @override
  void initState() {
    super.initState();
    images = getImages();
    // getImages().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: images,
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.waiting:

            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.done:
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: GridView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 6,
                      mainAxisSpacing: 6,
                    ),
                    itemBuilder: (context, index) {
                      return Image.network(
                        snapshot.data![index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
