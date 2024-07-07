// currency data class used to stoe conry name and currency code
import 'package:floor/floor.dart';

@Entity(tableName: 'Currency')
class Currency {
  @PrimaryKey(autoGenerate: true) // <- add PrimaryKey here
  final int? id;
  String? contryName;
  String? currencyCode;

  Currency({
    this.id,
    this.contryName,
    this.currencyCode,
  });
}
