import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:webool_test/core/error/error_services/message_service_base.dart';
import 'package:webool_test/core/error/error_widget/toaster_widgets.dart';
import 'package:webool_test/core/error/message_model/message.dart';
import 'package:webool_test/feature/dashboard/presentaton/controller/dashboard_controller.dart';

import '../../data/repository/remote/remote_data.dart';
import '../data_models/currency_symbol_model.dart';

final dashboardUseCaseProvider = StateProvider((ref) => DashboardUseCase(
      dashboardController: ref.watch(dashBoardingController),
      dashBoardApi: ref.watch(dashBoardRepositoryProvider),
      messageService: ref.watch(toastMessageServiceProvider.notifier),
    ));

class DashboardUseCase {
  DashboardUseCase({
    required this.dashboardController,
    this.dashBoardApi,
    required this.messageService,
  });
  final DashboardController dashboardController;
  DashBoardApi? dashBoardApi;
  final ToastMessageService messageService;

  void getSymbols() async {
    if (dashboardController.currencySymbols == null) {
      messageService.addLoader();
      var res = await dashBoardApi?.getSymbols();
      messageService.dismissLoader();
      res?.fold(
        (error) {
          messageService.addError(error.message ?? 'something went wrong');
        },
        (respose) {
          var allcurrencySymbols =
              CurrencySymbols.fromJson(respose.data).currenceList;
          dashboardController.updateCurrencyList(allcurrencySymbols!);
        },
      );
    }
  }

  void getSymbolsRates() async {
    messageService.addLoader();
    var res = await dashBoardApi?.getSymbolsRates(data: {
      'base': dashboardController.baseCurrency?.currencyCode,
      'symbols':
          dashboardController.addedcurrency.map((e) => e.currency).join(', ')
    });
    messageService.dismissLoader();
    res?.fold(
      (error) {
        messageService.addError(error.message ?? 'something went wrong');
      },
      (respose) {
        var allcurrencyRate = CurrencySymbolsRate.fromJson(
          respose.data,
          dashboardController.allcurrencySymbols,
        ).currencyRate;
        dashboardController.currencySymbolsRates = allcurrencyRate;
        calculateTotal();
      },
    );
  }

  void calculateTotal() {
    double total = 0.0;
    for (var selectedCurrency in dashboardController.addedcurrency) {
      var countryRate = dashboardController.currencySymbolsRates!.firstWhere(
          (element) => element.currencyCode == selectedCurrency.currency);
      selectedCurrency.rate = countryRate.currencyRate.toString();
      selectedCurrency.country = countryRate.contryName;
      var valueAfterCal =
          (countryRate.currencyRate ?? 0.0) * (selectedCurrency.number ?? 0);
      total += valueAfterCal;
      dashboardController.updatedTotal(total);
      messageService.addSuccess('Successfully Calculated');
    }
  }
}
