import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/features/protein/domain/i_protein_repository.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_state.dart';

class ProteinListCubit extends Cubit<ProteinListState> {
  ProteinListCubit(this._repository) : super(const ProteinListState());

  final IProteinRepository _repository;

  void init() {
    search('');
  }

  Future<void> search(String query) async {
    emit(state.copyWith(query: query));

    final items = await _repository.getProteins(query: query);

    if (isClosed) return;
    emit(state.copyWith(items: items));
  }
}
