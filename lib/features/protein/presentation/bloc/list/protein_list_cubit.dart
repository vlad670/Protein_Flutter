import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/features/protein/domain/i_protein_repository.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_state.dart';

/// Состояние экрана списка меняется только здесь.
///
/// Экран вызывает публичные методы Cubit и получает новое состояние через
/// BlocBuilder. Метод emit защищённый: вызвать его снаружи анализатор не даст.
///
/// Записи Cubit берёт у [IProteinRepository]. Какая реализация стоит за
/// интерфейсом, решает app.dart.
class ProteinListCubit extends Cubit<ProteinListState> {
  ProteinListCubit(this._repository) : super(const ProteinListState());

  final IProteinRepository _repository;

  Future<void> load() async {
    final items = await _repository.getProteins();
    // Пока ждали ответ, Cubit могли закрыть. emit после close — ошибка.
    if (isClosed) return;
    emit(state.copyWith(items: items));
  }

  /// Запрос попадает в состояние сразу, список обновляется, когда ответит
  /// репозиторий.
  Future<void> search(String query) async {
    emit(state.copyWith(query: query));
    final items = await _repository.searchProteins(query);
    if (isClosed) return;
    emit(state.copyWith(items: items));
  }
}
