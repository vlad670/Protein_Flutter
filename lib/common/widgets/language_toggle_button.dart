
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../theme/locale_cubit.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale?>(
      builder: (context, locale) {
        String label = 'SYS';
        if (locale?.languageCode == 'ru') label = 'RU';
        if (locale?.languageCode == 'en') label = 'EN';

        return IconButton(
          onPressed: context.read<LocaleCubit>().toggleLocale,
          tooltip: 'Переключить язык', 
          icon: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}