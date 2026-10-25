import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:protein/common/widgets/app_scaffold.dart';
import 'package:protein/features/protein/presentation/view/protein_detail_screen.dart';
import 'package:protein/features/protein/presentation/view/protein_list_screen.dart';
import 'package:protein/l10n/app_localizations.dart';

/// Адреса экранов. Строки путей собраны здесь, чтобы не расходиться по
/// проекту. Переход из виджета: `context.push(AppRoutes.detail(id))`.
abstract final class AppRoutes {
  static const String list = '/';
  static String detail(String accession) => '/protein/$accession';


/// Какой адрес какой экран показывает.
///
/// Роутер только показывает экраны. Bloc и Cubit он не создаёт: Cubit списка
/// создан в корне приложения, Bloc детали создаёт сам экран детали.
  static final router = GoRouter(
    initialLocation: list,
    routes: [
      GoRoute(
        path: list,
        builder: (context, state) => const ProteinListScreen(),
      ),
      GoRoute(
        path: '/protein/:accession',
        builder: (context, state) {
          // Получаем accession из параметров URL
          final accession = state.pathParameters['accession']!;
          return ProteinDetailScreen(accession: accession);
        },
      ),
    ],
  );
}