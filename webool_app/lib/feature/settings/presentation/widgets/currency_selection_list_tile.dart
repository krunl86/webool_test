import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../dashboard/domain/data_models/currency_symbol.dart';
import '../../../dashboard/presentaton/controller/dashboard_controller.dart';

class CurrencySelectionListTile extends ConsumerWidget {
  const CurrencySelectionListTile({
    super.key,
    required this.map,
  });

  final Currency? map;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = Theme.of(context);

    return Card(
      color: ref.read(dashBoardingController).baseCurrency?.currencyCode ==
              map?.currencyCode
          ? Colors.amber
          : Colors.white,
      elevation: 12,
      child: ListTile(
        onTap: () {
          ref.read(dashBoardingController).updateBaseCurrenty(map!);
        },
        title: Text(
          map?.currencyCode ?? '',
          style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black),
        ),
        subtitle: Text(
          map?.contryName ?? '',
          style: theme.textTheme.bodyMedium!.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}
