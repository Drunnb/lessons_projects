// ignore_for_file: avoid_print

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stb_v1/models/bird_post_model.dart';
import 'package:stb_v1/services/sqflite.dart';

part 'bird_post_state.dart';

class BirdPostCubit extends Cubit<BirdPostState> {
  BirdPostCubit()
      : super(
            const BirdPostState(birdPosts: [], status: BirdPostStatus.initial));

  final dbHelprer = DatabaseHelper.instance;

  Future<void> loadPosts() async {
    emit(state.copyWith(status: BirdPostStatus.loading));

    List<BirdModel> birdPosts = [];
    final List<Map<String, dynamic>> rows = await dbHelprer.qureyAllRows();
    if (rows.isEmpty) {
      print('Rows are empty');
    } else {
      print('Rows have data');
      for (var row in rows) {
        birdPosts.add(BirdModel(
            id: row['id'],
            birdName: row['birdName'],
            latitude: row['latitude'],
            longitude: row['longitude'],
            birdDescriprion: row['birdDescription'],
            image: File(row['url'])));
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

    Map<String, dynamic> row = {
      DatabaseHelper.columnTitle: birdModel.birdName,
      DatabaseHelper.columnDescription: birdModel.birdDescriprion,
      DatabaseHelper.latitude: birdModel.latitude,
      DatabaseHelper.longitude: birdModel.longitude,
      DatabaseHelper.columnUrl: birdModel.image.path
    };
    final int? id = await dbHelprer.incert(row);
    birdModel.id = id;

    emit(state.copyWith(
        birdPosts: birdPosts,
        status: BirdPostStatus.loaded)); // меняем состояние на "загружено"
  }

  Future<void> removeBirdPost(BirdModel birdModel) async {
    emit(state.copyWith(status: BirdPostStatus.loading));
    List<BirdModel> birdPosts = state.birdPosts;
    await dbHelprer.delete(birdModel.id!);

    birdPosts.removeWhere((element) => element == birdModel);
    emit(state.copyWith(birdPosts: birdPosts, status: BirdPostStatus.loaded));
  }
}
