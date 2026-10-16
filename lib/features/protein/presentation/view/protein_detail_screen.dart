import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Убедитесь, что пути соответствуют вашему новому проекту
import '../../../../common/widgets/app_scaffold.dart';
import '../../domain/i_protein_repository.dart';
import '../../domain/protein_model.dart';
import '../bloc/detail/protein_detail_bloc.dart';
import '../bloc/detail/protein_detail_event.dart';
import '../bloc/detail/protein_detail_state.dart';
import '../utils/protein_format.dart';
import 'package:protein/l10n/app_localizations.dart';
import 'widgets/section.dart';
import 'widgets/related_row.dart';

/// Экран детальной информации о белке.
class ProteinDetailScreen extends StatelessWidget {
  const ProteinDetailScreen({super.key, required this.accession});

  final String accession;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProteinDetailBloc(context.read<IProteinRepository>())
            ..add(ProteinDetailOpened(accession)),
      child: AppScaffold(
        body: BlocBuilder<ProteinDetailBloc, ProteinDetailState>(
          builder: (context, state) => switch (state) {
            ProteinDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProteinDetailNotFound(:final accession) => Center(
              child: Text(AppLocalizations.of(context).detailNotFound(accession)), 
            ),
            ProteinDetailLoaded(:final protein, :final relatedProteins) =>
              _DetailContent(protein: protein, relatedProteins: relatedProteins),
          },
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({required this.protein, required this.relatedProteins});

  final ProteinModel protein;
  final List<ProteinModel> relatedProteins;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        // Ограничиваем ширину для красоты на больших экранах
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Заголовок (Кружок с акцентным цветом и название)
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        protein.displayName.substring(0, 1).toUpperCase(),
                        style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Accession: ${protein.accession}',
                          style: theme.textTheme.labelLarge?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                        Text(
                          protein.displayName, 
                          style: theme.textTheme.headlineMedium
                        ),
                        Text(
                          protein.geneName,
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 2. Основная информация (Организм и Полное название)
              Card(
                elevation: 0,
                color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoRow(title: l10n.detailOrganism, value: protein.organism),
                      const SizedBox(height: 8),
                      _InfoRow(title: l10n.detailProteinName, value: protein.proteinName),
                      const SizedBox(height: 8),
                      _InfoRow(title: l10n.detailSequenceLength(protein.sequence.length), value: ''),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 3. Секция Аминокислотной последовательности
              Section(title: l10n.sectionSequence),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                  border: Border.all(color: theme.colorScheme.outlineVariant),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  // Разбиваем последовательность пробелами каждые 10 символов для читаемости
                  _formatSequence(protein.sequence),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace', // Моноширинный шрифт важен для последовательностей
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 4. Связанные белки (Related)
              Section(title: l10n.sectionRelated),
              const SizedBox(height: 12),
              RelatedRow(relatedProteins: relatedProteins),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// Вспомогательный метод для красивого вывода последовательности
  /// (Разбивает строку на блоки по 10 символов)
  String _formatSequence(String sequence) {
    if (sequence.isEmpty) return 'No sequence available';
    final buffer = StringBuffer();
    for (int i = 0; i < sequence.length; i++) {
      if (i > 0 && i % 10 == 0) buffer.write(' ');
      buffer.write(sequence[i]);
    }
    return buffer.toString();
  }
}

/// Вспомогательный виджет для строки информации
class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}