import '../../domain/protein_model.dart';
import '../dto/uniprot_entry_dto.dart';

extension ProteinMapper on UniProtEntryDto {
  ProteinModel toDomain() {

    final firstGene = (genes != null && genes!.isNotEmpty) 
        ? genes!.first.geneName?.value 
        : null;
    final gene = firstGene ?? 'N/A';

    final seq = sequence?.value ?? '';

    final relatedList = <RelatedProtein>[];
    
    if (comments != null) {
      final interactionComments = comments!.where((c) => c.commentType == 'INTERACTION');
      
      for (final comment in interactionComments) {
        if (comment.interactions != null) {
          for (final interaction in comment.interactions!) {
            final id1 = interaction.interactantOne.uniProtKBAccession;
            final id2 = interaction.interactantTwo.uniProtKBAccession;
            
            if (id2 != null && id2 != primaryAccession && id2.isNotEmpty) {
              relatedList.add(RelatedProtein(
                accession: id2,
                name: id2,
              ));
            } else if (id1 != null && id1 != primaryAccession && id1.isNotEmpty) {
               relatedList.add(RelatedProtein(
                accession: id1,
                name: id1,
              ));
            }
          }
        }
      }
    } 

    final uniqueRelatedIds = <String>{};
    final uniqueRelatedList = <RelatedProtein>[];
    for (final rel in relatedList) {
      if (uniqueRelatedIds.add(rel.accession)) {
        uniqueRelatedList.add(rel);
      }
    }

    return ProteinModel(
      accession: primaryAccession,
      entryName: uniProtkbId,
      proteinName: proteinDescription.recommendedName.fullName.value,
      organism: organism.scientificName,
      
      geneName: gene, 
      sequence: seq, 
      related: uniqueRelatedList,
    );
  }
}