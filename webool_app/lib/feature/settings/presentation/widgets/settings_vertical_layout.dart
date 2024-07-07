import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';
import 'package:webool_test/feature/settings/presentation/widgets/currency_selection_list_tile.dart';

class SettingVerticalLayout extends ConsumerStatefulWidget {
  const SettingVerticalLayout({super.key});

  @override
  ConsumerState<SettingVerticalLayout> createState() =>
      _SettingVerticalLayoutState();
}

class _SettingVerticalLayoutState extends ConsumerState<SettingVerticalLayout> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var symbols = ref.watch(dashBoardingController).currencySymbols;
    return Padding(
      padding: EdgeInsetsOf(context).all(DimensionToken.small),
      child: Column(
        children: [
          Text(
            'Choose Base Currenty From List',
            style: theme.textTheme.headlineMedium,
          ),
          const Space.h(Dimensions.smaller),
          TextField(
            onChanged: (val) {
              ref.read(dashBoardingController).searchList(val);
            },
            decoration: const InputDecoration()
                .applyDefaults(theme.inputDecorationTheme)
                .copyWith(hintText: 'Search for currency'),
          ),
          const Space.h(Dimensions.medium),
          Expanded(
              child: ListView.builder(
            itemCount: symbols?.length ?? 0,
            itemBuilder: (context, index) {
              var map = symbols?[index];
              return CurrencySelectionListTile(
                map: map,
              );
            },
          ))
        ],
      ),
    );
  }
}
