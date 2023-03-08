import 'package:madbrains_lesson_project_movie/data/dtos/seacrh_card_dto.dart';
import 'package:madbrains_lesson_project_movie/data/dtos/shows_card_dto.dart';
import 'package:madbrains_lesson_project_movie/domain/models/film_card_model.dart';

extension ShowsCardDTOFromDTOtoDomain on ShowsCardDTO {
  FilmCardModel toDomain() {
    return FilmCardModel(
      id: id,
      title: title,
      picture: image?.original ?? '',
      releaseDate: releaseDate ?? '',
      voteAverage: averegeVoite.average ?? 0,
      description: description ?? '',
    );
  }
}

extension SearchCardFromDTOToDomain on SearchCardDTO {
  FilmCardModel toDomain() {
    return FilmCardModel(
      id: show?.id ?? 0,
      title: show?.title ?? '',
      picture: show?.image?.original ?? '',
      releaseDate: show?.releaseDate ?? '',
      voteAverage: score ?? 0,
      description: show?.description ?? '',
    );
  }
}
