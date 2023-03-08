// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'shows_card_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ShowsCardDTO {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  final String url;
  @JsonKey(name: 'name', defaultValue: '')
  final String title;
  final List<String> genres;
  @JsonKey(name: 'premiered')
  final String? releaseDate;
  @JsonKey(name: 'rating')
  final Rating averegeVoite;
  @JsonKey(name: 'image')
  final ShowsCardDTOImage? image;
  @JsonKey(name: 'summary')
  final String? description;

  ShowsCardDTO({
    required this.id,
    required this.url,
    required this.title,
    required this.genres,
    this.releaseDate,
    required this.averegeVoite,
    this.image,
    this.description,
  });
  factory ShowsCardDTO.fromJson(Map<String, dynamic> json) =>
      _$ShowsCardDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ShowsCardDTOToJson(this);
}

@JsonSerializable()
class Rating {
  @JsonKey(name: 'average', defaultValue: 0)
  final double? average;

  Rating({required this.average});
  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable()
class ShowsCardDTOImage {
  @JsonKey(name: 'original', defaultValue: '')
  final String? original;

  ShowsCardDTOImage({required this.original});
  factory ShowsCardDTOImage.fromJson(Map<String, dynamic> json) =>
      _$ShowsCardDTOImageFromJson(json);
  Map<String, dynamic> toJson() => _$ShowsCardDTOImageToJson(this);
}
