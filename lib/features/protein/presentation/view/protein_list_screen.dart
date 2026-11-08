import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/common/widgets/app_scaffold.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_cubit.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_state.dart';
import 'package:protein/features/protein/presentation/view/widgets/protein_card.dart';
import 'package:protein/features/protein/presentation/view/widgets/search_field.dart';

import 'package:protein/l10n/app_localizations.dart';

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
                ProteinListError(:final message) => Center(
                    child: Text(AppLocalizations.of(context)!.systemError(message)),
                  ),
                ProteinListLoaded(:final items) when items.isEmpty => Center(
                    child: Text(AppLocalizations.of(context)!.nothingFound),
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

class _ProteinList extends StatelessWidget {
  const _ProteinList({required this.state});

  final ProteinListLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: state.items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) => ProteinCard(protein: state.items[index]),
    );
  }
}