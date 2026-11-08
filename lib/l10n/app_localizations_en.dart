// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Protein Catalog';

  @override
  String get actionToggleTheme => 'Toggle theme';

  @override
  String proteinAccession(String accession) {
    return 'Accession: $accession';
  }

  @override
  String get detailOrganism => 'Organism';

  @override
  String get detailProteinName => 'Protein Name';

  @override
  String detailSequenceLength(int length) {
    return 'Sequence Length: $length AA';
  }

  @override
  String get sectionSequence => 'Amino Acid Sequence';

  @override
  String get sectionRelated => 'Related Proteins';

  @override
  String detailNotFound(String accession) {
    return 'No record “$accession” in the catalog';
  }

  @override
  String get pageNotFound => 'No such page';

  @override
  String get searchHint => 'Search by entry name';

  @override
  String get actionClearSearch => 'Clear search';

  @override
  String get emptyRelated => 'No related proteins found.';

  @override
  String get nothingFound => 'Nothing found';

  @override
  String systemError(String error) {
    return 'System error occurred: $error';
  }
}
