import '../api/protein_api.dart';
import '../dto/uniprot_entry_dto.dart';
import '../dto/uniprot_search_page_dto.dart';
import 'i_protein_data_source.dart';

class NetworkProteinDataSource implements IProteinDataSource {
  const NetworkProteinDataSource(this._api);

  final ProteinApi _api;

  @override
  Future<UniProtSearchPageDto> searchProteins(String query) async {
    // Вызываем API, обрабатывать ошибки будем в репозитории (как в Pokédex)
    return await _api.searchProteins(query: query);
  }

  @override
  Future<UniProtEntryDto> getProteinByAccession(String accession) async {
    return await _api.getProtein(accession);
  }
}