// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Каталог белков';
  
  @override
  String get nothingFound => 'Ничего не найдено';

  @override
  String get actionToggleTheme => 'Переключить тему';

  @override
  String proteinNumber(String number) {
    return '#$number';
  }

  @override
  String get statHp => 'Здоровье';

  @override
  String get statAttack => 'Атака';

  @override
  String get statDefense => 'Защита';

  @override
  String get statSpecialAttack => 'Спец. атака';

  @override
  String get statSpecialDefense => 'Спец. защита';

  @override
  String get statSpeed => 'Скорость';

  @override
  String detailHeight(double height) {
    final intl.NumberFormat heightNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String heightString = heightNumberFormat.format(height);

    return 'Рост: $heightString м';
  }

  @override
  String detailWeight(double weight) {
    final intl.NumberFormat weightNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String weightString = weightNumberFormat.format(weight);

    return 'Вес: $weightString кг';
  }

  @override
  String detailBaseXp(int xp) {
    return 'Базовый опыт: $xp';
  }

  @override
  String get sectionStats => 'Характеристики';

  @override
  String get sectionAbilities => 'Способности';

  @override
  String get sectionEvolution => 'Эволюция';

  @override
  String abilityHidden(String name) {
    return '$name · скрытая';
  }

  @override
  String detailNotFound(String id) {
    return 'Записи «$id» в каталоге нет';
  }

  @override
  String get detailOrganism => 'Организм';
  
  @override
  String get detailProteinName => 'Название белка';
  
  @override
  String detailSequenceLength(int length) => 'Длина: $length АК';
  
  @override
  String get sectionSequence => 'Аминокислотная последовательность';
  
  @override
  String get sectionRelated => 'Связанные белки';
  
  @override
  String get emptyRelated => 'Связанных белков не найдено.';

  @override
  String get pageNotFound => 'Такой страницы нет';

  @override
  String get typeBug => 'Насекомое';

  @override
  String get typeFire => 'Огонь';

  @override
  String get typeFlying => 'Полёт';

  @override
  String get typeGrass => 'Трава';

  @override
  String get typeNormal => 'Обычный';

  @override
  String get typePoison => 'Яд';

  @override
  String get typeWater => 'Вода';

  @override
  String get searchHint => 'Поиск по имени';

  @override
  String get actionClearSearch => 'Очистить поиск';
}
