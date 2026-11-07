// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uniprot_search_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniProtSearchPageDto _$UniProtSearchPageDtoFromJson(
  Map<String, dynamic> json,
) => UniProtSearchPageDto(
  results: (json['results'] as List<dynamic>)
      .map((e) => UniProtEntryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UniProtSearchPageDtoToJson(
  UniProtSearchPageDto instance,
) => <String, dynamic>{'results': instance.results};
