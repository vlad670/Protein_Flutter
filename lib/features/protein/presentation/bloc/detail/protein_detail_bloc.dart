// lib/features/protein/presentation/bloc/detail/protein_detail_bloc.dart

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
      final relatedFullModels = <ProteinModel>[];
      for (final relatedLink in protein.related) {
        try {
           final relatedProtein = await _repository.getProteinByAccession(relatedLink.accession);
           relatedFullModels.add(relatedProtein);
        } catch (e) { continue;
        }
      }

      if (isClosed) return;
      emit(ProteinDetailLoaded(
        protein, 
        relatedProteins: relatedFullModels,
      ));
    } catch (e) {
      if (isClosed) return;
      emit(ProteinDetailNotFound(event.accession));
    }
  }
}