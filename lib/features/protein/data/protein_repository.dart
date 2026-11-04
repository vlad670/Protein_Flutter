import '../domain/i_protein_repository.dart';
import '../domain/protein_model.dart';
import 'mock_proteins.dart';
import 'package:protein/features/protein/domain/protein_exceptions.dart';

class ProteinRepository implements IProteinRepository {
  const ProteinRepository();

  @override
  Future<List<ProteinModel>> getProteins({String? query}) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (query == null || query.isEmpty) {
      return mockProteins;
    }
    final lowerQuery = query.toLowerCase();

    final filteredProteins = mockProteins.where((protein) {
      return protein.proteinName.toLowerCase().contains(lowerQuery) ||
          protein.entryName.toLowerCase().contains(lowerQuery) ||
          protein.geneName.toLowerCase().contains(lowerQuery) ||
          protein.accession.toLowerCase().contains(lowerQuery);
    }).toList();

    return filteredProteins;
  }

  @override
  Future<ProteinModel> getProteinByAccession(String accession) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final protein = mockProteins
        .where((p) => p.accession == accession)
        .firstOrNull;

    if (protein == null) {
      throw ProteinNotFoundException(accession);
    }

    return protein;
  }

  @override
  Future<ProteinDetailData> getProteinDetailData(String accession) async {
    final mainProtein = await getProteinByAccession(accession);
    final relatedFullModels = <ProteinModel>[];
    for (final relatedLink in mainProtein.related) {
      try {
        final relatedProtein = await getProteinByAccession(
          relatedLink.accession,
        );
        relatedFullModels.add(relatedProtein);
      } catch (e) {
        continue;
      }
    }
    return ProteinDetailData(
      mainProtein: mainProtein,
      relatedProteins: relatedFullModels,
    );
  }
}
