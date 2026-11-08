import 'package:json_annotation/json_annotation.dart';

part 'uniprot_entry_dto.g.dart';

@JsonSerializable()
class UniProtEntryDto {
  const UniProtEntryDto({
    required this.primaryAccession,
    required this.uniProtkbId,
    required this.proteinDescription,
    required this.organism,
    this.genes,
    this.sequence,
    this.comments,
  });

  factory UniProtEntryDto.fromJson(Map<String, dynamic> json) => _$UniProtEntryDtoFromJson(json);

  final String primaryAccession;
  final String uniProtkbId;
  final ProteinDescriptionDto proteinDescription;
  final OrganismDto organism;
  final List<GeneDto>? genes;
  final SequenceDto? sequence;
  final List<CommentDto>? comments;
}

@JsonSerializable()
class ProteinDescriptionDto {
  const ProteinDescriptionDto({required this.recommendedName});
  factory ProteinDescriptionDto.fromJson(Map<String, dynamic> json) => _$ProteinDescriptionDtoFromJson(json);
  final RecommendedNameDto recommendedName;
}

@JsonSerializable()
class RecommendedNameDto {
  const RecommendedNameDto({required this.fullName});
  factory RecommendedNameDto.fromJson(Map<String, dynamic> json) => _$RecommendedNameDtoFromJson(json);
  final FullNameDto fullName;
} 

@JsonSerializable()
class FullNameDto {
  const FullNameDto({required this.value});
  factory FullNameDto.fromJson(Map<String, dynamic> json) => _$FullNameDtoFromJson(json);
  final String value;
}

@JsonSerializable()
class OrganismDto {
  const OrganismDto({required this.scientificName});
  factory OrganismDto.fromJson(Map<String, dynamic> json) => _$OrganismDtoFromJson(json);
  final String scientificName;
}

@JsonSerializable() class GeneDto {
  const GeneDto({this.geneName});
  factory GeneDto.fromJson(Map<String, dynamic> json) => _$GeneDtoFromJson(json);
  
  
  final GeneNameDto? geneName; 
}

@JsonSerializable() class GeneNameDto {
  const GeneNameDto({required this.value});
  factory GeneNameDto.fromJson(Map<String, dynamic> json) => _$GeneNameDtoFromJson(json);
  
  final String value;
}

@JsonSerializable()
class SequenceDto {
  const SequenceDto({required this.value, required this.length});
  factory SequenceDto.fromJson(Map<String, dynamic> json) => _$SequenceDtoFromJson(json);
  
  final String value;
  final int length;
}

@JsonSerializable()
class InteractantDto {
  const InteractantDto({this.uniProtKBAccession});
  factory InteractantDto.fromJson(Map<String, dynamic> json) => _$InteractantDtoFromJson(json);
  
  final String? uniProtKBAccession; 
}

@JsonSerializable()
class InteractionDto {
  const InteractionDto({required this.interactantOne, required this.interactantTwo});
  factory InteractionDto.fromJson(Map<String, dynamic> json) => _$InteractionDtoFromJson(json);
  
  final InteractantDto interactantOne;
  final InteractantDto interactantTwo;
}

@JsonSerializable()
class CommentDto {
  const CommentDto({this.commentType, this.interactions});
  factory CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);

  final String? commentType;
  
  final List<InteractionDto>? interactions;
}