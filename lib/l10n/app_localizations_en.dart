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
  String proteinNumber(String number) {
    return '#$number';
  }

  @override
  String get statHp => 'HP';

  @override
  String get statAttack => 'Attack';

  @override
  String get statDefense => 'Defense';

  @override
  String get statSpecialAttack => 'Sp. Attack';

  @override
  String get statSpecialDefense => 'Sp. Defense';

  @override
  String get statSpeed => 'Speed';

  @override
  String detailHeight(double height) {
    final intl.NumberFormat heightNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String heightString = heightNumberFormat.format(height);

    return 'Height: $heightString m';
  }

  @override
  String detailWeight(double weight) {
    final intl.NumberFormat weightNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String weightString = weightNumberFormat.format(weight);

    return 'Weight: $weightString kg';
  }

  @override
  String detailBaseXp(int xp) {
    return 'Base experience: $xp';
  }

  @override
  String get sectionStats => 'Base stats';

  @override
  String get sectionAbilities => 'Abilities';

  @override
  String get sectionEvolution => 'Evolution';

  @override
  String abilityHidden(String name) {
    return '$name · hidden';
  }

  @override
  String detailNotFound(String id) {
    return 'No record “$id” in the catalog';
  }

  @override
  String get detailOrganism => 'Organism';
  
  @override
  String get detailProteinName => 'Protein Name';
  
  @override
  String detailSequenceLength(int length) => 'Sequence Length: $length AA';
  
  @override
  String get sectionSequence => 'Amino Acid Sequence';
  
  @override
  String get sectionRelated => 'Related Proteins';
  
  @override
  String get emptyRelated => 'No related proteins found.';

  @override
  String get nothingFound => 'Nothing found';

  @override
  String get pageNotFound => 'No such page';

  @override
  String get typeBug => 'Bug';

  @override
  String get typeFire => 'Fire';

  @override
  String get typeFlying => 'Flying';

  @override
  String get typeGrass => 'Grass';

  @override
  String get typeNormal => 'Normal';

  @override
  String get typePoison => 'Poison';

  @override
  String get typeWater => 'Water';

  @override
  String get searchHint => 'Search by name';

  @override
  String get actionClearSearch => 'Clear search';
}
