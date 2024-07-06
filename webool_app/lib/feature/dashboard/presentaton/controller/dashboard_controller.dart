import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/feature/dashboard/data/repository/remote/remote_data.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/added_currency.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/contry_currency.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/currency_symbol.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/currency_symbol_model.dart';

final dashBoardingController =
    ChangeNotifierProvider((ref) => DashboardController(ref: ref));

class DashboardController extends ChangeNotifier {
  DashboardController({required this.ref});
  Ref ref;
  List<Currency>? currencySymbols;
  List<Currency>? allcurrencySymbols;
  List<AddedCurrency> addedcurrency = [];

  List<CurrencyRate>? currencySymbolsRates;
  Currency? baseCurrency;
  double total = 0.0;

  void updateCurrencyList(List<Currency>? allCurrency) {
    allcurrencySymbols = allCurrency;
    currencySymbols = allCurrency;
    notifyListeners();
  }

  void updatedTotal(double calculation) {
    total = calculation;
    notifyListeners();
  }

  void addNewCurrency() {
    addedcurrency.add(AddedCurrency());
    notifyListeners();
  }

  void removeCUrrency(int index) {
    addedcurrency.removeAt(index);
    notifyListeners();
  }

  void updateBaseCurrenty(Currency currency) {
    baseCurrency = currency;
    notifyListeners();
  }

  void searchList(String val) {
    if (val.isEmpty) {
      currencySymbols = allcurrencySymbols;
      notifyListeners();
      return;
    }
    currencySymbols = allcurrencySymbols!
        .where((element) =>
            element.currencyCode!.toLowerCase().contains(val.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
