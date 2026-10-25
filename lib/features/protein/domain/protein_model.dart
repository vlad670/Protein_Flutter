// lib/features/protein/domain/protein_model.dart


final class RelatedProtein {
  const RelatedProtein({
    required this.accession,
    required this.name,
  });

  final String accession;
  
  final String name;
}

final class ProteinModel {
  const ProteinModel({
    required this.accession,
    required this.entryName,
    required this.proteinName,
    required this.organism,
    required this.geneName,
    required this.sequence,
    required this.related,
  });

  final String accession;

  final String entryName;

  final String proteinName;

  final String organism;

  final String geneName;

  final String sequence;

  final List<RelatedProtein> related;
}