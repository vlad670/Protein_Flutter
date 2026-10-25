// lib/features/protein/presentation/bloc/detail/protein_detail_event.dart

sealed class ProteinDetailEvent {
  const ProteinDetailEvent();
}

final class ProteinDetailOpened extends ProteinDetailEvent {
  const ProteinDetailOpened(this.accession);

  final String accession; 
}