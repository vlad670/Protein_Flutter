//import 'package:flutter/material.dart';
import 'package:protein/features/protein/domain/protein_model.dart';

/// Как запись выглядит на экране.
///
/// Модель хранит данные как в API. Перевод в вид для показа собран здесь:
/// экраны и виджеты берут готовое значение и сами ничего не пересчитывают.
extension ProteinFormat on ProteinModel {
  /// bulbasaur → Bulbasaur.
  String get displayName {
    if (entryName.contains('_')) {
      return entryName.split('_').first;
    }
    return entryName;
  }

  /// Номер по национальному покедексу: 1 → 001.
  String get displayNumber => accession.padLeft(3, '0');

  /// В API рост в дециметрах.
  //double get heightM => heightDm / 10;

  /// В API вес в гектограммах.
  //double get weightKg => weightHg / 10;

  /// Цвет первого типа: им красятся подложка картинки и полосы характеристик.
  //Color get accent => types.first.color;
}

