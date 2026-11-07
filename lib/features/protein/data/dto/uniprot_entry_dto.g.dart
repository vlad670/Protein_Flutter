// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uniprot_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullNameDto _$FullNameDtoFromJson(Map<String, dynamic> json) =>
    FullNameDto(value: json['value'] as String);

Map<String, dynamic> _$FullNameDtoToJson(FullNameDto instance) =>
    <String, dynamic>{'value': instance.value};

RecommendedNameDto _$RecommendedNameDtoFromJson(Map<String, dynamic> json) =>
    RecommendedNameDto(
      fullName: FullNameDto.fromJson(json['fullName'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendedNameDtoToJson(RecommendedNameDto instance) =>
    <String, dynamic>{'fullName': instance.fullName};

ProteinDescriptionDto _$ProteinDescriptionDtoFromJson(
  Map<String, dynamic> json,
) => ProteinDescriptionDto(
  recommendedName: RecommendedNameDto.fromJson(
    json['recommendedName'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ProteinDescriptionDtoToJson(
  ProteinDescriptionDto instance,
) => <String, dynamic>{'recommendedName': instance.recommendedName};

OrganismDto _$OrganismDtoFromJson(Map<String, dynamic> json) =>
    OrganismDto(scientificName: json['scientificName'] as String);

Map<String, dynamic> _$OrganismDtoToJson(OrganismDto instance) =>
    <String, dynamic>{'scientificName': instance.scientificName};

UniProtEntryDto _$UniProtEntryDtoFromJson(Map<String, dynamic> json) =>
    UniProtEntryDto(
      primaryAccession: json['primaryAccession'] as String,
      uniProtkbId: json['uniProtkbId'] as String,
      proteinDescription: ProteinDescriptionDto.fromJson(
        json['proteinDescription'] as Map<String, dynamic>,
      ),
      organism: OrganismDto.fromJson(json['organism'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UniProtEntryDtoToJson(UniProtEntryDto instance) =>
    <String, dynamic>{
      'primaryAccession': instance.primaryAccession,
      'uniProtkbId': instance.uniProtkbId,
      'proteinDescription': instance.proteinDescription,
      'organism': instance.organism,
    };
