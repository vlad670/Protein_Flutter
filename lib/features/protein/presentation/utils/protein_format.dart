import 'package:protein/features/protein/domain/protein_model.dart';


extension ProteinFormat on ProteinModel {

  String get displayName {
    if (entryName.contains('_')) {
      return entryName.split('_').first;
    }
    return entryName;
  }

  String get displayNumber => accession.padLeft(3, '0');


}

