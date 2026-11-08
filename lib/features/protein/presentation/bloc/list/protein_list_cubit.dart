import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/i_protein_repository.dart';
import 'protein_list_state.dart';

class ProteinListCubit extends Cubit<ProteinListState> {
  ProteinListCubit(this._repository) : super(const ProteinListLoading(query: ''));

  final IProteinRepository _repository;

  Future<void> load() async {
    if (isClosed) return;
    emit(ProteinListLoading(query: state.query));
    
    try {
      final items = await _repository.getProteins();
      if (isClosed) return;
      emit(ProteinListLoaded(query: state.query, items: items));
    } catch (e) {
      if (isClosed) return;
      emit(ProteinListError(query: state.query, message: e.toString()));
    }
  }

  Future<void> search(String query) async {
    if (isClosed) return;
    emit(ProteinListLoading(query: query));
    
    try {
      if (query.trim().isEmpty) {
        final items = await _repository.getProteins();
        if (isClosed) return;
        emit(ProteinListLoaded(query: query, items: items));
        return;
      }

      final items = await _repository.searchProteins(query);
      if (isClosed) return;
      emit(ProteinListLoaded(query: query, items: items));
    } catch (e) {
      if (isClosed) return;
      emit(ProteinListError(query: query, message: e.toString()));
    }
  }
}