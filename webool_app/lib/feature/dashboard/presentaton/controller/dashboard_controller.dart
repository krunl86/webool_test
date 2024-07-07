import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/added_currency.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/contry_currency.dart';
import 'package:webool_test/feature/dashboard/domain/data_models/currency_symbol.dart';

final dashBoardingController =
    ChangeNotifierProvider((ref) => DashboardController());

class DashboardController extends ChangeNotifier {
  DashboardController();
  List<Currency>? currencySymbols; // list of currency code from server
  List<Currency>? allcurrencySymbols; // list of currency rate from server
  List<AddedCurrency> addedcurrency =
      []; // list of added currency and its value from dashboard.

  List<CurrencyRate>? currencySymbolsRates;
  Currency? baseCurrency; // selected base currency
  double total = 0.0; // total value initialized

  // used by usecase to updated currency list  to notify UI
  void updateCurrencyList(List<Currency>? allCurrency) {
    allcurrencySymbols = allCurrency;
    currencySymbols = allCurrency;
    notifyListeners();
  }

  // updatedTotal used to notifiy UI that value is updated
  void updatedTotal(double calculation) {
    total = calculation;
    notifyListeners();
  }

  // adddNewCurrency is used to add new currency in list
  void addNewCurrency() {
    addedcurrency.add(AddedCurrency());
    notifyListeners();
  }

  // removed corrency is  used to remove currency from existing list
  void removeCUrrency(int index) {
    addedcurrency.removeAt(index);
    notifyListeners();
  }

  // updating Base currency
  void updateBaseCurrenty(Currency currency) {
    baseCurrency = currency;
    notifyListeners();
  }

  // used to filter list for select base currency in setting page
  void searchList(String val) {
    if (val.isEmpty) {
      // checking if value is null or not
      currencySymbols =
          allcurrencySymbols; // if val is empty return all Currency list got from server
      notifyListeners();
      return;
    }
    // checking coutry code and name to filter list
    currencySymbols = allcurrencySymbols!
        .where((element) =>
            element.currencyCode!.toLowerCase().contains(val.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
