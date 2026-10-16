/*
import 'package:flutter/material.dart';
import 'package:protein/features/protein/domain/protein_model.dart';
import 'package:protein/features/protein/presentation/utils/protein_format.dart';
import 'package:protein/l10n/app_localizations.dart';

/// Способности столбиком. Скрытая помечена подписью из ARB.
class AbilityList extends StatelessWidget {
  const AbilityList({super.key, required this.abilities});

  final List<AbilityModel> abilities;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        for (final ability in abilities)
          Text(
            ability.hidden
                ? l10n.abilityHidden(ability.displayName)
                : ability.displayName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
      ],
    );
  }
}
*/
