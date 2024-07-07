import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

import '../../../dashboard/domain/data_models/currency_symbol.dart';

class CurrencyListingTile extends StatelessWidget {
  const CurrencyListingTile({
    super.key,
    required this.map,
  });

  // currency Symbol
  final Currency? map;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsetsOf(context).symmetric(
            horizontal: Dimensions.small, vertical: Dimensions.medium),
        child: Row(
          children: [
            Expanded(child: Text(map?.currencyCode ?? '')),
            Text(
              map?.contryName ?? '',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
