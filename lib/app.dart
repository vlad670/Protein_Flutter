import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein/common/navigation/app_router.dart';
import 'package:protein/common/theme/theme_cubit.dart';
import 'package:protein/features/protein/data/protein_repository.dart';
import 'package:protein/features/protein/domain/i_protein_repository.dart';
import 'package:protein/features/protein/presentation/bloc/list/protein_list_cubit.dart';
import 'package:protein/common/theme/app_theme.dart';
import 'package:protein/l10n/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:protein/features/protein/data/api/protein_api.dart';
import 'package:protein/features/protein/data/data_sources/network_protein_data_source.dart';

class App extends StatelessWidget {
  const App({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IProteinRepository>(
          create: (_) {
            final dio = Dio(
              BaseOptions(baseUrl: "https://api.poopmap.net/api/v1/"),
            );

            final api = ProteinApi(dio);

            final dataSourse = NetworkProteinDataSource(api);

            return ProteinRepository(dataSourse);
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProteinListCubit(context.read<IProteinRepository>())..load(),
          ),
          BlocProvider(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) => MaterialApp.router(
            routerConfig: AppRoutes.router,
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
