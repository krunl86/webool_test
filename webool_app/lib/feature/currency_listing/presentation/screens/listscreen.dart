import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';
import '../widget/currency_list_tile.dart';

class CurrencyListScreen extends ConsumerStatefulWidget {
  const CurrencyListScreen({super.key});
  static CurrencyListScreen builder(
          BuildContext context, GoRouterState state) =>
      const CurrencyListScreen();
  @override
  ConsumerState<CurrencyListScreen> createState() => _CurrencyListScreenState();
}

class _CurrencyListScreenState extends ConsumerState<CurrencyListScreen> {
  @override
  Widget build(BuildContext context) {
    var symbols = ref.watch(dashBoardingController).currencySymbols;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Available Currency'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: symbols?.length,
            itemBuilder: (context, index) {
              var map = symbols?[index];
              return CurrencyListingTile(
                map: map,
              );
            },
          ))
        ],
      ),
    );
  }
}
