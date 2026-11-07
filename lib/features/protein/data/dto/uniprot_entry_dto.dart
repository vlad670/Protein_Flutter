import 'package:json_annotation/json_annotation.dart';

part 'uniprot_entry_dto.g.dart';

@JsonSerializable()
class FullNameDto {
  const FullNameDto({required this.value});
  factory FullNameDto.fromJson(Map<String, dynamic> json) => _$FullNameDtoFromJson(json);
  final String value;
}

@JsonSerializable()
class RecommendedNameDto {
  const RecommendedNameDto({required this.fullName});
  factory RecommendedNameDto.fromJson(Map<String, dynamic> json) => _$RecommendedNameDtoFromJson(json);
  final FullNameDto fullName;
}

@JsonSerializable()
class ProteinDescriptionDto {
  const ProteinDescriptionDto({required this.recommendedName});
  factory ProteinDescriptionDto.fromJson(Map<String, dynamic> json) => _$ProteinDescriptionDtoFromJson(json);
  final RecommendedNameDto recommendedName;
}

@JsonSerializable()
class OrganismDto {
  const OrganismDto({required this.scientificName});
  factory OrganismDto.fromJson(Map<String, dynamic> json) => _$OrganismDtoFromJson(json);
  final String scientificName;
}

@JsonSerializable()
class UniProtEntryDto {
  const UniProtEntryDto({
    required this.primaryAccession,
    required this.uniProtkbId,
    required this.proteinDescription,
    required this.organism,
  });

  factory UniProtEntryDto.fromJson(Map<String, dynamic> json) => _$UniProtEntryDtoFromJson(json);

  final String primaryAccession;
  final String uniProtkbId;
  final ProteinDescriptionDto proteinDescription;
  final OrganismDto organism;
}