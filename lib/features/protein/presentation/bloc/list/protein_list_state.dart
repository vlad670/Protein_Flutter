import 'package:protein/features/protein/domain/protein_model.dart';

/// Состояние экрана списка: всё, что нужно нарисовать, одним объектом.
///
/// Класс неизменяемый. Новое состояние создаётся через [copyWith], поля
/// старого не меняются. Cubit не отправит экрану тот же самый объект второй
/// раз, поэтому правка полей на месте до экрана не дойдёт.
final class ProteinListState {
  const ProteinListState({this.query = '', this.items = const []});

  /// Текст в поле поиска. Пустая строка значит, что поиск не задан.
  final String query;
  final List<ProteinModel> items;

  ProteinListState copyWith({String? query, List<ProteinModel>? items}) =>
      ProteinListState(query: query ?? this.query, items: items ?? this.items);
}
