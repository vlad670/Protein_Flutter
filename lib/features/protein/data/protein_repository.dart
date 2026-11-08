import '../domain/i_protein_repository.dart';
import '../domain/protein_model.dart';
import 'data_sources/i_protein_data_source.dart';
import 'mappers/protein_mapper.dart';  

class ProteinRepository implements IProteinRepository {
  const ProteinRepository(this._networkSource);

  final IProteinDataSource _networkSource;

  @override
  Future<List<ProteinModel>> getProteins() async {
    final response = await _networkSource.searchProteins('organism_id:9606');
    return response.results.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<ProteinModel> getProteinByAccession(String accession) async {
    final dto = await _networkSource.getProteinByAccession(accession);
    return dto.toDomain();
  }

  @override
  Future<List<ProteinModel>> searchProteins(String query) async {
    if (query.trim().isEmpty) {
      return getProteins(); 
    }
    
    final response = await _networkSource.searchProteins(query);
    return response.results.map((dto) => dto.toDomain()).toList();
  }
}