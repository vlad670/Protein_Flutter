# Каталог белков (Protein Catalog) — Flutter

Кроссплатформенное приложение для просмотра и поиска информации о белках на базе предметной области [UniProtKB](https://www.uniprot.org/).

## Предметная область
В каталоге представлены записи о белках со следующими характеристиками:
- **Идентификаторы:** `accession`, `entryName`, `geneName`.
- **Биологическое описание:** полное название белка, организм.
- **Последовательность:** первичная аминокислотная последовательность с форматированием блоками по 10 символов.
- **Связанные белки:** перечень взаимодействующих белков с возможностью перехода на экран деталей каждого из них.

## Архитектура
Проект организован по фичам:
- `lib/features/protein/domain/` — модель `ProteinModel`, `ProteinDetailData`, исключение `ProteinNotFoundException` и интерфейс репозитория `IProteinRepository`.
- `lib/features/protein/data/` — моковые данные `mock_proteins.dart` и реализация `ProteinRepository` с параллельной загрузкой связанных белков через `Future.wait`.
- `lib/features/protein/presentation/` — `ProteinListCubit`, `ProteinDetailBloc`, экраны списка и деталей, виджеты.
- `lib/common/` — навигация на `go_router` (`AppRoutes`), управление темой (`ThemeCubit`), общий `AppScaffold`.
- `lib/l10n/` — файлы локализации (`app_ru.arb`, `app_en.arb`) и сгенерированный `AppLocalizations`.

## Команды запуска

### Генерация локализации
```bash
flutter gen-l10n
```

### Запуск на Windows (Desktop)
```bash
flutter run -d windows
```

### Запуск в браузере (Web)
```bash
flutter run -d chrome
```

### Запуск с принудительной локалью
```bash
flutter run -d chrome --dart-define=LOCALE=en
```

### Проверка анализатором
```bash
flutter analyze
```
