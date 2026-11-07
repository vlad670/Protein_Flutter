import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/features/protein/domain/i_protein_repository.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_state.dart';

class ProteinListCubit extends Cubit<ProteinListState> {
  ProteinListCubit(this._repository) : super(const ProteinListState());

  final IProteinRepository _repository;

  Future<void> load() async {
    final items = await _repository.getProteins();
    if (isClosed) return;
    emit(state.copyWith(items: items));
  }

  Future<void> search(String query) async {
    emit(state.copyWith(query: query));
    final items = await _repository.searchProteins(query);
    if (isClosed) return;
    emit(state.copyWith(items: items));
  }
}
