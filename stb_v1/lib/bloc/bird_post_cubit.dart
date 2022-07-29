import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stb_v1/models/bird_post_model.dart';

part 'bird_post_state.dart';

class BirdPostCubit extends Cubit<BirdPostState> {
  BirdPostCubit()
      : super(BirdPostState(birdPosts: [], status: BirdPostStatus.initial));

  Future<void> loadPosts() async {
    emit(state.copyWith(status: BirdPostStatus.loading));

    List<BirdModel> birdPosts = [];

    emit(state.copyWith(birdPosts: birdPosts, status: BirdPostStatus.loaded));
  }

  Future<void> addBirdPost(BirdModel birdModel) async {
    emit(state.copyWith(
        status: BirdPostStatus
            .loading)); // меняем текущение состояние на "загрузка"
    List<BirdModel> birdPosts = state.birdPosts; // копируем список  моделей
    birdPosts.add(
        birdModel); // добавляем к списку моделей, новую модель из функции (аргумент функции)

    emit(state.copyWith(
        birdPosts: birdPosts,
        status: BirdPostStatus.loaded)); // меняем состояние на "загружено"
  }

  void removeBirdPost(BirdModel birdModel) {
    emit(state.copyWith(status: BirdPostStatus.loading));
    List<BirdModel> birdPosts = state.birdPosts;

    birdPosts.removeWhere((element) => element == birdModel);
    emit(state.copyWith(birdPosts: birdPosts, status: BirdPostStatus.loaded));
  }
}
