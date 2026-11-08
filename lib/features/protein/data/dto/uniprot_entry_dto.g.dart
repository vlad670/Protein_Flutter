// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uniprot_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UniProtEntryDto _$UniProtEntryDtoFromJson(Map<String, dynamic> json) =>
    UniProtEntryDto(
      primaryAccession: json['primaryAccession'] as String,
      uniProtkbId: json['uniProtkbId'] as String,
      proteinDescription: ProteinDescriptionDto.fromJson(
        json['proteinDescription'] as Map<String, dynamic>,
      ),
      organism: OrganismDto.fromJson(json['organism'] as Map<String, dynamic>),
      genes: (json['genes'] as List<dynamic>?)
          ?.map((e) => GeneDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      sequence: json['sequence'] == null
          ? null
          : SequenceDto.fromJson(json['sequence'] as Map<String, dynamic>),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UniProtEntryDtoToJson(UniProtEntryDto instance) =>
    <String, dynamic>{
      'primaryAccession': instance.primaryAccession,
      'uniProtkbId': instance.uniProtkbId,
      'proteinDescription': instance.proteinDescription,
      'organism': instance.organism,
      'genes': instance.genes,
      'sequence': instance.sequence,
      'comments': instance.comments,
    };

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

RecommendedNameDto _$RecommendedNameDtoFromJson(Map<String, dynamic> json) =>
    RecommendedNameDto(
      fullName: FullNameDto.fromJson(json['fullName'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendedNameDtoToJson(RecommendedNameDto instance) =>
    <String, dynamic>{'fullName': instance.fullName};

FullNameDto _$FullNameDtoFromJson(Map<String, dynamic> json) =>
    FullNameDto(value: json['value'] as String);

Map<String, dynamic> _$FullNameDtoToJson(FullNameDto instance) =>
    <String, dynamic>{'value': instance.value};

OrganismDto _$OrganismDtoFromJson(Map<String, dynamic> json) =>
    OrganismDto(scientificName: json['scientificName'] as String);

Map<String, dynamic> _$OrganismDtoToJson(OrganismDto instance) =>
    <String, dynamic>{'scientificName': instance.scientificName};

GeneDto _$GeneDtoFromJson(Map<String, dynamic> json) => GeneDto(
  geneName: json['geneName'] == null
      ? null
      : GeneNameDto.fromJson(json['geneName'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GeneDtoToJson(GeneDto instance) => <String, dynamic>{
  'geneName': instance.geneName,
};

GeneNameDto _$GeneNameDtoFromJson(Map<String, dynamic> json) =>
    GeneNameDto(value: json['value'] as String);

Map<String, dynamic> _$GeneNameDtoToJson(GeneNameDto instance) =>
    <String, dynamic>{'value': instance.value};

SequenceDto _$SequenceDtoFromJson(Map<String, dynamic> json) => SequenceDto(
  value: json['value'] as String,
  length: (json['length'] as num).toInt(),
);

Map<String, dynamic> _$SequenceDtoToJson(SequenceDto instance) =>
    <String, dynamic>{'value': instance.value, 'length': instance.length};

InteractantDto _$InteractantDtoFromJson(Map<String, dynamic> json) =>
    InteractantDto(uniProtKBAccession: json['uniProtKBAccession'] as String?);

Map<String, dynamic> _$InteractantDtoToJson(InteractantDto instance) =>
    <String, dynamic>{'uniProtKBAccession': instance.uniProtKBAccession};

InteractionDto _$InteractionDtoFromJson(Map<String, dynamic> json) =>
    InteractionDto(
      interactantOne: InteractantDto.fromJson(
        json['interactantOne'] as Map<String, dynamic>,
      ),
      interactantTwo: InteractantDto.fromJson(
        json['interactantTwo'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$InteractionDtoToJson(InteractionDto instance) =>
    <String, dynamic>{
      'interactantOne': instance.interactantOne,
      'interactantTwo': instance.interactantTwo,
    };

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
  commentType: json['commentType'] as String?,
  interactions: (json['interactions'] as List<dynamic>?)
      ?.map((e) => InteractionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) =>
    <String, dynamic>{
      'commentType': instance.commentType,
      'interactions': instance.interactions,
    };
