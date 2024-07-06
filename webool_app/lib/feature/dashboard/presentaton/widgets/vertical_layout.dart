import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/feature/dashboard/presentaton/widgets/add_currency_list_tile.dart';
import 'package:webool_test/feature/dashboard/presentaton/widgets/add_new_currency_button.dart';
import 'package:webool_test/feature/dashboard/presentaton/widgets/total_value_label.dart';

import '../../domain/usecase/dashboard_usecase.dart';
import '../controller/dashboard_controller.dart';

class PortraitLayout extends ConsumerWidget {
  PortraitLayout({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dashBoardingController);
    return Column(
      children: [
        const AddNewCurrencyButton(),
        Expanded(
            child: Form(
          key: _formKey,
          child: ListView.builder(
            itemCount: ref.watch(dashBoardingController).addedcurrency.length,
            itemBuilder: (context, index) {
              return AddedCurrencyListTile(
                index: index,
              );
            },
          ),
        )),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ref.read(dashboardUseCaseProvider).getSymbolsRates();
            }
          },
          child: const Text('Calculate Total'),
        ),
        const Space.h(Dimensions.medium),
        const ToTalValueLabel(),
        const Space.h(Dimensions.large),
      ],
    );
  }
}
