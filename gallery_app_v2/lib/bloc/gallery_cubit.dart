import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gallery_app_v2/keys.dart';
import 'package:gallery_app_v2/services/network_helper.dart';

part 'gallery_state.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit() : super(const GalleryInitial());

  Future<void> getPhotos() async {
    emit(const GalleryLoading());

    List<String> images = [];
    String url =
        "https://api.unsplash.com/photos/random/?client_id=$unsplashApiKey&count=21";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();
    List<dynamic> photoList = data as List<dynamic>;
    for (int i = 0; i < photoList.length; i++) {
      images.add(photoList[i].urls.smallS3);
    }
    emit(ImagesLoaded(images: images));
  }
}
