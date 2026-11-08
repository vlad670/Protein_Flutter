
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/features/protein/domain/i_protein_repository.dart';
import 'package:protein/features/protein/domain/protein_model.dart';
import 'package:protein/features/protein/presentation/bloc/detail/protein_detail_event.dart';
import 'package:protein/features/protein/presentation/bloc/detail/protein_detail_state.dart';

class ProteinDetailBloc extends Bloc<ProteinDetailEvent, ProteinDetailState> {
  ProteinDetailBloc(this._repository) : super(const ProteinDetailLoading()) {
    on<ProteinDetailOpened>(_onOpened);
  }

  final IProteinRepository _repository;

  Future<void> _onOpened(
    ProteinDetailOpened event,
    Emitter<ProteinDetailState> emit,
  ) async {
    try {
      final protein = await _repository.getProteinByAccession(event.accession);
      
      final relatedFutures = protein.related.map((link) async {
        try {
          return await _repository.getProteinByAccession(link.accession);
        } catch (_) {
          return null;
        }
      });

      final results = await Future.wait(relatedFutures);
      
      final relatedFullModels = results.whereType<ProteinModel>().toList();

      if (isClosed) return;
      emit(ProteinDetailLoaded(
        protein, 
        relatedProteins: relatedFullModels,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(ProteinDetailError(e.toString())); 
    }
  }
}