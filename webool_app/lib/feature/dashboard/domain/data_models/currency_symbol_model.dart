import 'package:webool_test/feature/dashboard/domain/data_models/contry_currency.dart';

import 'currency_symbol.dart';

class CurrencySymbols {
  final Map<String, String> symbols;
  CurrencySymbols({required this.symbols, this.currenceList});
  List<Currency>? currenceList;

  factory CurrencySymbols.fromJson(Map<String, dynamic> json) {
    Map<String, String> symbols = {};
    List<Currency> currencyList = [];
    json['symbols'].forEach((key, value) {
      symbols[key] = value;
      currencyList.add(Currency(contryName: value, currencyCode: key));
    });
    return CurrencySymbols(symbols: symbols, currenceList: currencyList);
  }
}

class CurrencySymbolsRate {
  CurrencySymbolsRate({required this.symbols, this.currencyRate});
  final Map<String, double> symbols;
  List<CurrencyRate>? currencyRate;

  factory CurrencySymbolsRate.fromJson(
      Map<String, dynamic> json, List<Currency>? currency) {
    Map<String, double> symbols = {};

    List<CurrencyRate> currencyRate = [];

    json['rates'].forEach((key, value) {
      symbols[key] = double.tryParse(value.toString()) ?? 0.0;
      var countryName = currency
          ?.firstWhere((element) => element.currencyCode == key)
          .contryName;
      currencyRate.add(CurrencyRate(
          currencyCode: key,
          contryName: countryName,
          currencyRate: double.tryParse(value.toString()) ?? 0.0));
    });
    return CurrencySymbolsRate(symbols: symbols, currencyRate: currencyRate);
  }
}
