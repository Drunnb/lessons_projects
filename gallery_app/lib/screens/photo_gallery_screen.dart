import 'package:flutter/material.dart';
import 'package:gallery_app/keys.dart';
import 'package:gallery_app/services/network_helper.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({Key? key}) : super(key: key);

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
    // getImages().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: images,
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            //   if (snapshot.connectionState == ConnectionState.none) {
            //     return Center( child: Text('Error'));
            //   }
            //  if (snapshot.connectionState == ConnectionState.active ||snapshot.connectionState == ConnectionState.waiting ) {
            //     return Center( child: CircularProgressIndicator());
            //   }

            switch (snapshot.connectionState) {
              case ConnectionState.none:

              case ConnectionState.waiting:

              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SafeArea(
                    child: GridView.builder(
                        itemCount: snapshot.data?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 6,
                        ),
                        itemBuilder: (context, index) {
                          return Image.network(snapshot.data![index],
                              fit: BoxFit.cover);
                        }),
                  ),
                );
            }
          }),
    );
  }
}
