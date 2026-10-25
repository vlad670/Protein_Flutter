import '../domain/i_protein_repository.dart';
import '../domain/protein_model.dart';
import 'mock_proteins.dart';

class ProteinRepository implements IProteinRepository {
  const ProteinRepository();
  @override
  Future<List<ProteinModel>> getProteins() async {
    // Имитация задержки сети, как в оригинале
    await Future.delayed(const Duration(milliseconds: 800));
    return mockProteins;
  }

  @override
  Future<ProteinModel> getProteinByAccession(String accession) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return mockProteins.firstWhere((p) => p.accession == accession);
  }

  @override
  Future<List<ProteinModel>> searchProteins(String query) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final lowerQuery = query.toLowerCase();
    return mockProteins.where((p) => p.proteinName.toLowerCase().contains(lowerQuery)).toList();
  }
}