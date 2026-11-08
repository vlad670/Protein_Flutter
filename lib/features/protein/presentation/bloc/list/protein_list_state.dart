import '../../../domain/protein_model.dart';

sealed class ProteinListState {
  const ProteinListState({required this.query});
  final String query;
}

final class ProteinListLoading extends ProteinListState {
  const ProteinListLoading({required super.query});
}

final class ProteinListLoaded extends ProteinListState {
  const ProteinListLoaded({
    required super.query,
    required this.items,
  });

  final List<ProteinModel> items;
}

final class ProteinListError extends ProteinListState {
  const ProteinListError({
    required super.query,
    required this.message,
  });

  final String message;
}