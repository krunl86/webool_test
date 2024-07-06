import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webool_test/feature/settings/presentation/widgets/settings_landscape_layout.dart';
import 'package:webool_test/feature/settings/presentation/widgets/settings_vertical_layout.dart';

import '../../../dashboard/presentaton/controller/dashboard_controller.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});
  static SettingScreen builder(BuildContext context, GoRouterState state) =>
      const SettingScreen();
  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(dashBoardingController);
    var theme = Theme.of(context);
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          actions: isPortrait
              ? null
              : [
                  const Space.w(Dimensions.small),
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Row(
                      children: [
                        const Icon(Icons.arrow_back),
                        const Space.w(Dimensions.small),
                        Text(
                          'Settings',
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const Space.w(Dimensions.large),
                  Expanded(
                    child: Text(
                      'Choose Base Currenty From List',
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      onChanged: (val) {
                        ref.read(dashBoardingController).searchList(val);
                      },
                      decoration: const InputDecoration()
                          .applyDefaults(theme.inputDecorationTheme)
                          .copyWith(hintText: 'Search for currency'),
                    ),
                  ),
                ],
        ),
        body: isPortrait
            ? const SettingVerticalLayout()
            : const SettingsLandscapeLayout());
  }
}
