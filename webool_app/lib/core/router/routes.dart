import 'package:go_router/go_router.dart';
import 'package:webool_test/feature/dashboard/presentaton/screens/dashboard.dart';
import 'package:webool_test/feature/currency_listing/presentation/screens/listscreen.dart';
import 'package:webool_test/feature/settings/presentation/screens/setting_screen.dart';
import 'package:webool_test/feature/spash/spash_screen.dart';

import '../../feature/dashboard/main_screen.dart';

final routes = [
  GoRoute(
    path: '/',
    builder: SpashScreen.builder,
  ),
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        MainScreen(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(routes: [
        GoRoute(
          path: '/dashboard',
          name: 'dashboard',
          builder: DashboardScreen.builder,
        ),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(
          path: '/list',
          name: 'list',
          builder: CurrencyListScreen.builder,
        ),
      ]),
      StatefulShellBranch(routes: [
        GoRoute(
          path: '/setting',
          name: 'setting',
          builder: SettingScreen.builder,
        ),
      ]),
    ],
  ),
];
