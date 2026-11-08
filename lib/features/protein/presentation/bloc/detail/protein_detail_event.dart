sealed class ProteinDetailEvent {
  const ProteinDetailEvent();
}

final class ProteinDetailOpened extends ProteinDetailEvent {
  const ProteinDetailOpened(this.accession);

  final String accession; 
}