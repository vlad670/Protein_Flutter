import 'package:json_annotation/json_annotation.dart';
import 'uniprot_entry_dto.dart';

part 'uniprot_search_page_dto.g.dart';

@JsonSerializable()
class UniProtSearchPageDto {
  
  const UniProtSearchPageDto({required this.results});
  
  factory UniProtSearchPageDto.fromJson(Map<String, dynamic> json) => _$UniProtSearchPageDtoFromJson(json);
  
  final List<UniProtEntryDto> results;
}