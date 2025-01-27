// CurrencyRate data class is used to store response
//from currency rate and country name used to store response from latest endpoint

import 'package:floor/floor.dart';

@entity
class CurrencyRate {
  @PrimaryKey(autoGenerate: true) // <- add PrimaryKey here
  final int? id;
  String? contryName;
  String? currencyCode;
  double? currencyRate;

  CurrencyRate(
      {this.id, this.contryName, this.currencyCode, this.currencyRate});
}
