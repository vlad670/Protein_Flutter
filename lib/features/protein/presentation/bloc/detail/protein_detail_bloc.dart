// lib/features/protein/presentation/bloc/detail/protein_detail_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/features/protein/domain/i_protein_repository.dart';
import 'package:protein/features/protein/domain/protein_model.dart';
import 'package:protein/features/protein/presentation/bloc/detail/protein_detail_event.dart';
import 'package:protein/features/protein/presentation/bloc/detail/protein_detail_state.dart';
import 'package:protein/features/protein/domain/protein_exceptions.dart';

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
      final detailData = await _repository.getProteinDetailData(
        event.accession,
      );

      if (isClosed) return;
      emit(
        ProteinDetailLoaded(
          detailData.mainProtein,
          relatedProteins: detailData.relatedProteins,
        ),
      );
    } on ProteinNotFoundException catch (e) {
      if (isClosed) return;
      emit(ProteinDetailNotFound(event.accession));
    } catch (e) {
      if (isClosed) return;
      emit(ProteinDetailError('Произошла системная ошибка: $e'));
    }
  }
}
