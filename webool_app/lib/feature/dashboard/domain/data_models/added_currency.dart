// AddedCurrency Data Class is used to store newly added currency from list to maintain its code, country and value

class AddedCurrency {
  String? currency;
  double? number;
  String? country;
  String? rate;
  AddedCurrency({this.currency, this.number});
}
