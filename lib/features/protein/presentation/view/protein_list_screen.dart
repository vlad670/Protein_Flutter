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
          // Expanded обязателен: в Column без него ListView получает
          // бесконечную высоту и падает с ошибкой unbounded height.
          Expanded(
            child: BlocBuilder<ProteinListCubit, ProteinListState>(
              builder: (context, state) {
                if (state.items.isEmpty && state.query.isNotEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context).nothingFound, 
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) =>
                      ProteinCard(protein: state.items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
