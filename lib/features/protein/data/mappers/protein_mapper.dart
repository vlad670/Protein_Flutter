import '../../domain/protein_model.dart';
import '../dto/uniprot_entry_dto.dart';

extension ProteinMapper on UniProtEntryDto {
  ProteinModel toDomain() {
    return ProteinModel(
      accession: primaryAccession,
      entryName: uniProtkbId,
      proteinName: proteinDescription.recommendedName.fullName.value,
      organism: organism.scientificName,
      
      geneName: 'Unknown Gene', 
      sequence: 'Sequence is hidden', 
      related: [],
    );
  }
}