import 'protein_model.dart';

abstract interface class IProteinRepository {

  Future<List<ProteinModel>> getProteins();

   Future<ProteinModel> getProteinByAccession(String accession);

   Future<List<ProteinModel>> searchProteins(String query);
}