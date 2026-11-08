import '../dto/uniprot_entry_dto.dart';
import '../dto/uniprot_search_page_dto.dart';

abstract interface class IProteinDataSource {
  Future<UniProtSearchPageDto> searchProteins(String query);
  Future<UniProtEntryDto> getProteinByAccession(String accession);
}