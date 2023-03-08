// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:madbrains_lesson_project_movie/components/constants.dart';
import 'package:madbrains_lesson_project_movie/components/dialogs/error_dialog.dart';
import 'package:madbrains_lesson_project_movie/data/dtos/seacrh_card_dto.dart';
import 'package:madbrains_lesson_project_movie/data/dtos/shows_card_dto.dart';
import 'package:madbrains_lesson_project_movie/data/mappers/shows_mapper.dart';
import 'package:madbrains_lesson_project_movie/domain/models/film_card_model.dart';
import 'package:madbrains_lesson_project_movie/domain/models/movie_card_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class MoviesRepository {
  static final Dio _dio = Dio();
  // ..interceptors.add(PrettyDioLogger(
  //   requestHeader: true,
  //   requestBody: true,
  // ));

  static Future<HomeModel?> loadData(BuildContext context, [String? q]) async {
    try {
      if (q != null && q.isNotEmpty) {
        const String url = MovieQuery.host + MovieQuery.pathSearch;
        final Response<dynamic> response =
            await _dio.get<List<dynamic>>(url, queryParameters: {'q': q});
        final dtos = <SearchCardDTO>[];
        final responseList = response.data as List<dynamic>;
        for (final data in responseList) {
          dtos.add(SearchCardDTO.fromJson(data as Map<String, dynamic>));
        }
        final movieModels = <FilmCardModel>[];
        for (final dto in dtos) {
          movieModels.add(dto.toDomain());
        }
        final HomeModel model = HomeModel(results: movieModels);
        return model;
      } else {
        const String url = MovieQuery.host + MovieQuery.pathShow;
        final Response<dynamic> response = await _dio.get<List<dynamic>>(url);

        final dtos = <ShowsCardDTO>[];
        final responseList = response.data as List<dynamic>;
        for (final data in responseList) {
          dtos.add(ShowsCardDTO.fromJson(data as Map<String, dynamic>));
        }

        final movieModels = <FilmCardModel>[];
        for (final dto in dtos) {
          movieModels.add(dto.toDomain());
        }

        final HomeModel model = HomeModel(results: movieModels);
        return model;
      }
    } on DioError catch (error) {
      final statusCode = error.response?.statusCode;
      showErrorDialog(context, error: statusCode?.toString() ?? '');
    }
    return null;
  }
}
