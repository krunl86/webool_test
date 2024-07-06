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
    WidgetsBinding.instance.addPostFrameCallback((time) {
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

  void _onItemTapped(int index) {
    widget.navigationShell.goBranch(
      index,
    );
    if (index == 0) {
    } else if (index == 1) {
    } else if (index == 2) {
    } else if (index == 3) {}
  }
}
