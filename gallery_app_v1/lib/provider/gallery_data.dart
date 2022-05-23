import 'package:flutter/widgets.dart';
import 'package:gallery_app_v1/keys.dart';

import '../services/network_helper.dart';

class GalleryData extends ChangeNotifier {
  List<String> photos = [];
  Future<void> getImages() async {
    List<String> images = [];
    String url = 'https://pixabay.com/api/?key=$pixabyApiKey&image_type=photo';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();

    List<dynamic> hitsList = data['hits'] as List;
    for (int i = 0; i < hitsList.length; i++) {
      images.add(hitsList[i]['largeImageURL']);
    }
    photos = images;
    notifyListeners();
  }
}
