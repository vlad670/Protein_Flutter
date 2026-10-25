import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/common/navigation/app_router.dart';
import 'package:protein/common/theme/theme_cubit.dart';
import 'package:protein/features/protein/data/protein_repository.dart';
import 'package:protein/features/protein/domain/i_protein_repository.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_cubit.dart';
import 'package:protein/common/theme/app_theme.dart';
import 'package:protein/l10n/app_localizations.dart';

/// Корень приложения. Его запускают все таргеты: web, desktop, Android.
///
/// Здесь собираются зависимости. Только app.dart знает, какая реализация
/// стоит за [IProteinRepository]. Остальные получают её через
/// `context.read<IProteinRepository>()`.
///
/// [locale] задаёт язык интерфейса. Без него язык берётся из системы, в
/// браузере из настроек браузера.
class App extends StatelessWidget {
  const App({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        // Тип указан явно: репозиторий ищут по интерфейсу, а не по классу.
        RepositoryProvider<IProteinRepository>(
          create: (_) => const ProteinRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          // Cubit списка создаётся один раз и живёт, пока работает
          // приложение. Поэтому список не теряется, пока открыта деталь.
          BlocProvider(
            create: (context) =>
                ProteinListCubit(context.read<IProteinRepository>())..load(),
          ),
          // Тема относится ко всему приложению, поэтому её Cubit тоже здесь.
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        // BlocBuilder пересобирает MaterialApp, когда меняется тема.
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => MaterialApp.router(
            routerConfig: AppRoutes.router,
            // Заголовок вкладки браузера тоже подпись, поэтому он из ARB.
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            locale: locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
        ),
      ),
    );
  }
}
