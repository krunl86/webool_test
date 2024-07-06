import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';
import 'package:webool_test/feature/dashboard/presentaton/widgets/total_value_label.dart';

import '../../domain/usecase/dashboard_usecase.dart';
import 'add_currency_list_tile.dart';
import 'add_new_currency_button.dart';

class LandScapeLayout extends ConsumerWidget {
  LandScapeLayout({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dashBoardingController);

    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            const AddNewCurrencyButton(),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ref
                            .watch(dashBoardingController)
                            .addedcurrency
                            .length,
                        itemBuilder: (context, index) {
                          return AddedCurrencyListTile(
                            index: index,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ref.read(dashboardUseCaseProvider).getSymbolsRates();
                }
              },
              child: const Text('Calculate Total'),
            ),
            const Expanded(
                child: SingleChildScrollView(child: ToTalValueLabel())),
          ],
        )),
      ],
    );
  }
}
