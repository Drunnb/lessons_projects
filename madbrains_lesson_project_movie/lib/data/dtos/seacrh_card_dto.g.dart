// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'seacrh_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchCardDTO _$SearchCardDTOFromJson(Map<String, dynamic> json) =>
    SearchCardDTO(
      score: (json['score'] as num?)?.toDouble(),
      show: json['show'] == null
          ? null
          : SearchCardDataDTO.fromJson(json['show'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchCardDTOToJson(SearchCardDTO instance) =>
    <String, dynamic>{
      'score': instance.score,
      'show': instance.show,
    };

SearchCardDataDTO _$SearchCardDataDTOFromJson(Map<String, dynamic> json) =>
    SearchCardDataDTO(
      id: json['id'] as int? ?? 0,
      title: json['name'] as String? ?? '',
      image: json['image'] == null
          ? null
          : SearchCardDataImageDTO.fromJson(
              json['image'] as Map<String, dynamic>),
      releaseDate: json['premiered'] as String?,
      description: stripHtmlIfneede(json['summary'] as String?),
    );

Map<String, dynamic> _$SearchCardDataDTOToJson(SearchCardDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'image': instance.image,
      'premiered': instance.releaseDate,
      'summary': instance.description,
    };

SearchCardDataImageDTO _$SearchCardDataImageDTOFromJson(
        Map<String, dynamic> json) =>
    SearchCardDataImageDTO(
      original: json['original'] as String? ?? '',
    );

Map<String, dynamic> _$SearchCardDataImageDTOToJson(
        SearchCardDataImageDTO instance) =>
    <String, dynamic>{
      'original': instance.original,
    };
