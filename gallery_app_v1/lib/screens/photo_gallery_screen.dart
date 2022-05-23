// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gallery_app_v1/provider/gallery_data.dart';
import 'package:provider/provider.dart';

class PhotoGallery extends StatefulWidget {
  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  /* 
                   Без использования провайдера 
                   
 Future<List<String>>? images;

  Future<List<String>> getImages() async {
    List<String> images = [];
    String url = 'https://pixabay.com/api/?key=$pixabyApiKey&image_type=photo';
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
    // getImages().then((value) => print(value));
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: GridView.builder(
              itemCount: context.watch<GalleryData>().photos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemBuilder: (context, index) {
                return Image.network(
                  context.watch<GalleryData>().photos[index],
                  fit: BoxFit.cover,
                );
              }),
        ),
      ),
      //                      Вариант без Provider
      // body: FutureBuilder(
      //     future: images,
      //     builder:
      //         (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
      //       // if (snapshot.connectionState == ConnectionState.none) {
      //       //   return Center(
      //       //     child: Text("Error"),
      //       //   );
      //       // }
      //       // if (snapshot.connectionState == ConnectionState.active ||
      //       //     snapshot.connectionState == ConnectionState.waiting) {
      //       //   return CircularProgressIndicator();
      //       // }

      //       switch (snapshot.connectionState) {
      //         case ConnectionState.none:

      //         case ConnectionState.waiting:

      //         case ConnectionState.active:
      //           return Center(
      //             child: CircularProgressIndicator(),
      //           );

      //         case ConnectionState.done:
      //           return SafeArea(
      //             child: Padding(
      //               padding: const EdgeInsets.all(6.0),
      //               child: GridView.builder(
      //                   itemCount: snapshot.data?.length ?? 0,
      //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                     crossAxisCount: 3,
      //                     crossAxisSpacing: 6,
      //                     mainAxisSpacing: 6,
      //                   ),
      //                   itemBuilder: (context, index) {
      //                     return Image.network(
      //                       snapshot.data![index],
      //                       fit: BoxFit.cover,
      //                     );
      //                   }),
      //             ),
      //           );
      //       }
      //     }),
    );
  }
}
