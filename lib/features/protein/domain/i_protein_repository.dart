import 'protein_model.dart';

abstract interface class IProteinRepository {
  Future<List<ProteinModel>> getProteins({String? query});

  Future<ProteinModel> getProteinByAccession(String accession);

  Future<ProteinDetailData> getProteinDetailData(String accession);
}
