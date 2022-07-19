import 'package:flutter/material.dart';
import 'package:gallery_app_v2/services/network_helper.dart';
import 'package:gallery_app_v2/keys.dart';

class GalleryData extends ChangeNotifier {
  List<String> photos = [];
  Future<void> getImages() async {
    String url =
        "https://api.unsplash.com/photos/random/?client_id=$unsplashApiKey&count=20";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();
    List<dynamic> photoList = data as List<dynamic>;
    for (int i = 0; i < photoList.length; i++) {
      photos.add(photoList[i].urls.smallS3);
    }

    notifyListeners();
  }
}
