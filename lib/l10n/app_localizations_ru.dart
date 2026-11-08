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
  String get actionToggleTheme => 'Переключить тему';

  @override
  String proteinAccession(String accession) {
    return 'Accession: $accession';
  }

  @override
  String get detailOrganism => 'Организм';

  @override
  String get detailProteinName => 'Название белка';

  @override
  String detailSequenceLength(int length) {
    return 'Длина: $length АК';
  }

  @override
  String get sectionSequence => 'Аминокислотная последовательность';

  @override
  String get sectionRelated => 'Связанные белки';

  @override
  String detailNotFound(String accession) {
    return 'Записи «$accession» в каталоге нет';
  }

  @override
  String get pageNotFound => 'Такой страницы нет';

  @override
  String get searchHint => 'Поиск по имени';

  @override
  String get actionClearSearch => 'Очистить поиск';

  @override
  String get emptyRelated => 'Связанных белков не найдено.';

  @override
  String get nothingFound => 'Ничего не найдено';

  @override
  String systemError(String error) {
    return 'Произошла системная ошибка: $error';
  }
}
