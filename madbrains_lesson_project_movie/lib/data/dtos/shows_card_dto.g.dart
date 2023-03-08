// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shows_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowsCardDTO _$ShowsCardDTOFromJson(Map<String, dynamic> json) => ShowsCardDTO(
      id: json['id'] as int? ?? 0,
      url: json['url'] as String,
      title: json['name'] as String? ?? '',
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      releaseDate: json['premiered'] as String?,
      averegeVoite: Rating.fromJson(json['rating'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : ShowsCardDTOImage.fromJson(json['image'] as Map<String, dynamic>),
      description: stripHtmlIfneede(json['summary'] as String?),
    );

Map<String, dynamic> _$ShowsCardDTOToJson(ShowsCardDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.title,
      'genres': instance.genres,
      'premiered': instance.releaseDate,
      'rating': instance.averegeVoite.toJson(),
      'image': instance.image?.toJson(),
      'summary': instance.description,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      average: (json['average'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'average': instance.average,
    };

ShowsCardDTOImage _$ShowsCardDTOImageFromJson(Map<String, dynamic> json) =>
    ShowsCardDTOImage(
      original: json['original'] as String? ?? '',
    );

Map<String, dynamic> _$ShowsCardDTOImageToJson(ShowsCardDTOImage instance) =>
    <String, dynamic>{
      'original': instance.original,
    };
