import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/landscape_layout.dart';
import '../widgets/vertical_layout.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});
  static DashboardScreen builder(BuildContext context, GoRouterState state) =>
      const DashboardScreen();
  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Dashboard'),
        ),
        body: isPortrait ? PortraitLayout() : LandScapeLayout());
  }
}
