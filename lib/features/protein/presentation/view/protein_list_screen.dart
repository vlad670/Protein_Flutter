import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/common/widgets/app_scaffold.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_cubit.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_state.dart';
import 'package:protein/features/protein/presentation/view/widgets/protein_card.dart';
import 'package:protein/features/protein/presentation/view/widgets/search_field.dart';

import 'package:protein/l10n/app_localizations.dart';

/// Экран списка. Cubit создан в корне приложения, экран только читает его
/// состояние и вызывает его методы.
class ProteinListScreen extends StatelessWidget {
  const ProteinListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: SearchField(
              onChanged: context.read<ProteinListCubit>().search,
            ),
          ),
          Expanded(
            child: BlocBuilder<ProteinListCubit, ProteinListState>(
              builder: (context, state) => switch (state) {
                ProteinListLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
                ProteinListLoaded(:final items) when items.isEmpty => Center(
                  child: Text(AppLocalizations.of(context).nothingFound),
                ),
                ProteinListLoaded() => _ProteinList(state: state),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProteinList extends StatefulWidget {
  const _ProteinList({required this.state});

  final ProteinListLoaded state;

  @override
  State<_ProteinList> createState() => _PokemonListState();
}

class _PokemonListState extends State<_ProteinList> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.position.extentAfter < 240) {
      context.read<ProteinListCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final showFooter = state.isLoadingMore || state.loadMoreError != null;
    // ListView.separated строит карточки по мере прокрутки, а не все сразу.
    return ListView.separated(
      controller: _controller,
      padding: const EdgeInsets.all(16),
      itemCount: state.items.length + (showFooter ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) => index < state.items.length
          ? ProteinCard(pokemon: state.items[index])
          : _Footer(state: state),
    );
  }
}

/// Под списком: индикатор догрузки или ошибка с «Повторить».
class _Footer extends StatelessWidget {
  const _Footer({required this.state});

  final PokemonListLoaded state;

  @override
  Widget build(BuildContext context) {
    final error = state.loadMoreError;
    return Center(
      child: error == null
          ? const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            )
          : LoadErrorView(
              error: error,
              onRetry: context.read<PokemonListCubit>().loadMore,
            ),
    );
  }
}
