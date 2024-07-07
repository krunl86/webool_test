import 'dart:async';
import 'package:floor/floor.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:webool_test/feature/dashboard/data/repository/local/entity.dart';

import '../../domain/data_models/currency_symbol.dart';
import '../repository/local/entity_dao.dart';

part 'database.g.dart'; // the generated code will be there

final databaseProvider = FutureProvider<AppDatabase>((ref) async {
  // Initialize your database instance using databaseBuilder
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  return database;
});

@Database(version: 3, entities: [Currency])
abstract class AppDatabase extends FloorDatabase {
  CurrencySymbolDao get userDao;
}
