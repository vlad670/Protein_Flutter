import 'package:flutter/rendering.dart';
import 'package:protein/features/protein/domain/protein_model.dart';

final class ProteinListState {
  const ProteinListState({this.query = '', this.items = const []});

  final String query;
  final List<ProteinModel> items;

  ProteinListState copyWith({String? query, List<ProteinModel>? items}) =>
      ProteinListState(query: query ?? this.query, items: items ?? this.items);
}

final class ProteinListLoading extends ProteinListState {
  const ProteinListLoading({required super.query});
}

final class ProteinListLoaded extends ProteinListState {
  const ProteinListLoaded({
    required super.query,
    required this.items,
    required this.hasMore,
    this.isLoadingMore = false,
    this.loadMoreError,
  });
}
