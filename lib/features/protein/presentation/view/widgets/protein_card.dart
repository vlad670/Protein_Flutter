import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:protein/common/navigation/app_router.dart';
import 'package:protein/features/protein/domain/protein_model.dart';
import 'package:protein/features/protein/presentation/utils/protein_format.dart';
import 'package:protein/features/protein/presentation/view/widgets/card_surface.dart';

/// Карточка списка: картинка слева, номер, имя и типы справа. Нажатие
/// открывает деталь записи.
class ProteinCard extends StatelessWidget {
  const ProteinCard({super.key, required this.protein});

  final ProteinModel protein;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CardSurface(
      // Переход вызывает сам виджет. push кладёт деталь поверх списка, и
      // «назад» вернёт к нему.
      onTap: () => context.push(AppRoutes.detail(protein.accession)),
      child: Row(
        children: [
          // Заглушка вместо картинки: кружок с инициалом
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
            //  color: protein.accent.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                protein.displayName.substring(0, 1).toUpperCase(),
                style: theme.textTheme.headlineSmall?.copyWith(
                //  color: protein.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  'Accession: ${protein.accession}',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  protein.proteinName, 
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${protein.geneName} • ${protein.organism}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
