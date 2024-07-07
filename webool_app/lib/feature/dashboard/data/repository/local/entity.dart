import 'package:floor/floor.dart';
// CurrencyRate data class is used to store response
// from currency rate and country name used to store response from latest endpoint

@entity
class CurrencyRate {
  @PrimaryKey(autoGenerate: false) // <- add PrimaryKey here
  final int? id;
  String? contryName;
  String? currencyCode;
  double? currencyRate;

  CurrencyRate(
      {this.id, this.contryName, this.currencyCode, this.currencyRate});
}
