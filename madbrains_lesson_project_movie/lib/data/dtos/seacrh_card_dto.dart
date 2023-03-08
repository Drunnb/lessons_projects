import 'package:json_annotation/json_annotation.dart';
import 'package:madbrains_lesson_project_movie/data/tools/dto_strip_html.dart';

part 'seacrh_card_dto.g.dart';

@JsonSerializable()
class SearchCardDTO {
  @JsonKey(name: 'score')
  final double? score;

  @JsonKey(name: 'show')
  final SearchCardDataDTO? show;

  SearchCardDTO({
    this.score,
    this.show,
  });

  factory SearchCardDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchCardDTOFromJson(json);
}

/// элемент show:
@JsonSerializable()
class SearchCardDataDTO {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'name', defaultValue: '')
  final String title;

  @JsonKey(name: 'image')
  final SearchCardDataImageDTO? image;

  @JsonKey(name: 'premiered')
  final String? releaseDate;

  @JsonKey(name: 'summary', fromJson: stripHtmlIfneede)
  final String? description;

  SearchCardDataDTO({
    required this.id,
    required this.title,
    required this.image,
    this.releaseDate,
    this.description,
  });

  factory SearchCardDataDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchCardDataDTOFromJson(json);
}

/// элемент image:
@JsonSerializable()
class SearchCardDataImageDTO {
  @JsonKey(name: 'original', defaultValue: '')
  final String? original;

  SearchCardDataImageDTO({
    this.original,
  });

  factory SearchCardDataImageDTO.fromJson(Map<String, dynamic> json) =>
      _$SearchCardDataImageDTOFromJson(json);
}
