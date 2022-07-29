import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stb_v1/models/bird_post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'bird_post_state.dart';

class BirdPostCubit extends Cubit<BirdPostState> {
  BirdPostCubit()
      : super(BirdPostState(birdPosts: [], status: BirdPostStatus.initial));

  Future<void> loadPosts() async {
    emit(state.copyWith(status: BirdPostStatus.loading));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<BirdModel> birdPosts = [];
    final List<String>? birdPostJsonStringList =
        prefs.getStringList('birdPosts');

    if (birdPostJsonStringList != null) {
      for (var postJsonData in birdPostJsonStringList) {
        final Map<String, dynamic> data =
            await json.decode(postJsonData) as Map<String, dynamic>;
        final File imageFile = File(data['filePath'] as String);
        final String birdName = data['birdName'] as String;
        final String birdDescriprion = data['birdDescriprion'] as String;
        final double latitude = data['latitude'] as double;
        final double longitude = data['longitude'] as double;
        birdPosts.add(BirdModel(
            birdName: birdName,
            latitude: latitude,
            longitude: longitude,
            birdDescriprion: birdDescriprion,
            image: imageFile));
      }
    }
    emit(state.copyWith(birdPosts: birdPosts, status: BirdPostStatus.loaded));
  }

  Future<void> addBirdPost(BirdModel birdModel) async {
    emit(state.copyWith(
        status: BirdPostStatus
            .loading)); // меняем текущение состояние на "загрузка"
    List<BirdModel> birdPosts = state.birdPosts; // копируем список  моделей
    birdPosts.add(
        birdModel); // добавляем к списку моделей, новую модель из функции (аргумент функции)

    _saveToSharedPrefs(birdPosts);

    emit(state.copyWith(
        birdPosts: birdPosts,
        status: BirdPostStatus.loaded)); // меняем состояние на "загружено"
  }

  void removeBirdPost(BirdModel birdModel) {
    emit(state.copyWith(status: BirdPostStatus.loading));
    List<BirdModel> birdPosts = state.birdPosts;

    birdPosts.removeWhere((element) => element == birdModel);
    _saveToSharedPrefs(birdPosts);
    emit(state.copyWith(birdPosts: birdPosts, status: BirdPostStatus.loaded));
  }

  Future<void> _saveToSharedPrefs(List<BirdModel> posts) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> jsonDataList = posts
        .map((post) => json.encode({
              'birdName': post.birdName,
              'birdDescriprion': post.birdDescriprion,
              'latitude': post.latitude,
              'longitude': post.longitude,
              'filePath': post.image.path,
            }))
        .toList();
    prefs.setStringList('birdPosts', jsonDataList);
  }
}
