import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webool_common/webool_common.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';

import 'domain/usecase/dashboard_usecase.dart';
import 'presentaton/widgets/bottombar_widget.dart';

class MainScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      // getting Currency List from server
      ref.read(dashboardUseCaseProvider).getSymbols();
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      color: theme.weboolColors.primaryRed,
      child: SafeArea(
        child: Scaffold(
            body: widget.navigationShell,
            bottomNavigationBar: BottomBarSection(
              onTap: (index) => _onItemTapped(index),
            )),
      ),
    );
  }

  /// onItemTapped used to navigate screen between using go_router
  void _onItemTapped(int index) {
    // updating shellRoute based on index
    widget.navigationShell.goBranch(
      index,
    );
  }
}
