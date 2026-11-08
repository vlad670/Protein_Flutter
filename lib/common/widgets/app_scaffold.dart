import 'package:flutter/material.dart';
import 'package:protein/common/widgets/theme_toggle_button.dart';
import 'package:protein/l10n/app_localizations.dart';
import 'language_toggle_button.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.actions = const []});

  final Widget body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
        actions: const [
          LanguageToggleButton(),
          ThemeToggleButton(),
        ],
      ),
      body: body,
    );
  }
}
