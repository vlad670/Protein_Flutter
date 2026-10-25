// lib/features/protein/presentation/bloc/detail/protein_detail_state.dart

import '../../../domain/protein_model.dart';

sealed class ProteinDetailState {
  const ProteinDetailState();
}

final class ProteinDetailLoading extends ProteinDetailState {
  const ProteinDetailLoading();
}

final class ProteinDetailLoaded extends ProteinDetailState {
  const ProteinDetailLoaded(this.protein, {required this.relatedProteins});

  final ProteinModel protein;

  final List<ProteinModel> relatedProteins;
}

final class ProteinDetailNotFound extends ProteinDetailState {
  const ProteinDetailNotFound(this.accession);

  final String accession;
}