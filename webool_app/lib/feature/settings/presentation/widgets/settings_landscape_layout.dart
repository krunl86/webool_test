import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';
import 'package:webool_test/feature/settings/presentation/widgets/currency_selection_list_tile.dart';

class SettingsLandscapeLayout extends ConsumerStatefulWidget {
  const SettingsLandscapeLayout({super.key});

  @override
  ConsumerState<SettingsLandscapeLayout> createState() =>
      _SettingsLandscapeLayoutState();
}

class _SettingsLandscapeLayoutState
    extends ConsumerState<SettingsLandscapeLayout> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var symbols = ref.watch(dashBoardingController).currencySymbols;
    return Padding(
      padding: EdgeInsetsOf(context).all(DimensionToken.small),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 3),
              itemCount: symbols?.length,
              itemBuilder: (context, index) {
                var map = symbols?[index];
                return CurrencySelectionListTile(
                  map: map,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
