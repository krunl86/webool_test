import 'package:floor/floor.dart';

import '../../../domain/data_models/currency_symbol.dart';

@dao
abstract class CurrencySymbolDao {
  @Query('SELECT * FROM Currency')
  Future<List<Currency>> getAllSymbol();

  @Query('SELECT * FROM Currency WHERE id = :id')
  Future<Currency?> findSymbol(int id);

  @Query('DELETE FROM Currency WHERE id = :id')
  Future<void> deleteSymbol(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertSymbol(List<Currency> tasks);
}
