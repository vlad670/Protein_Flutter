// lib/features/protein/presentation/view/widgets/related_row.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../common/navigation/app_router.dart';
import '../../../domain/protein_model.dart';
import '../../utils/protein_format.dart';

import 'package:protein/l10n/app_localizations.dart';

class RelatedRow extends StatelessWidget {
  const RelatedRow({
    super.key,
    required this.relatedProteins,
  });

  /// Список полных моделей связанных белков (загруженных BLoC'ом)
  final List<ProteinModel> relatedProteins;

  @override
  Widget build(BuildContext context) {
    if (relatedProteins.isEmpty) {
      return Text(
        AppLocalizations.of(context).emptyRelated,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      );
    }

    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 12,
      runSpacing: 12,
      children: [
        for (final related in relatedProteins)
          _RelatedStage(protein: related),
      ],
    );
  }
}

class _RelatedStage extends StatelessWidget {
  const _RelatedStage({required this.protein});

  final ProteinModel protein;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.push(AppRoutes.detail(protein.accession)),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          //color: protein.accent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          //border: Border.all(color: protein.accent.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            //Icon(Icons.link, color: protein.accent, size: 28),
            const SizedBox(height: 6),
            Text(
              protein.displayName,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}