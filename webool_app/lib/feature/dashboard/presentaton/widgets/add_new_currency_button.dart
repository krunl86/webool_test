import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/dashboard_controller.dart';

class AddNewCurrencyButton extends ConsumerWidget {
  const AddNewCurrencyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          ref.watch(dashBoardingController).addNewCurrency();
        },
        child: const Text('Add Currency'));
  }
}
