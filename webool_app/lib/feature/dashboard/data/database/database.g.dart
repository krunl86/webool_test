// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CurrencySymbolDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Currency` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `contryName` TEXT, `currencyCode` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CurrencySymbolDao get userDao {
    return _userDaoInstance ??= _$CurrencySymbolDao(database, changeListener);
  }
}

class _$CurrencySymbolDao extends CurrencySymbolDao {
  _$CurrencySymbolDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _currencyInsertionAdapter = InsertionAdapter(
            database,
            'Currency',
            (Currency item) => <String, Object?>{
                  'id': item.id,
                  'contryName': item.contryName,
                  'currencyCode': item.currencyCode
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Currency> _currencyInsertionAdapter;

  @override
  Future<List<Currency>> getAllSymbol() async {
    return _queryAdapter.queryList('SELECT * FROM Currency',
        mapper: (Map<String, Object?> row) => Currency(
            id: row['id'] as int?,
            contryName: row['contryName'] as String?,
            currencyCode: row['currencyCode'] as String?));
  }

  @override
  Future<Currency?> findSymbol(int id) async {
    return _queryAdapter.query('SELECT * FROM Currency WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Currency(
            id: row['id'] as int?,
            contryName: row['contryName'] as String?,
            currencyCode: row['currencyCode'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteSymbol(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Currency WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<void> insertSymbol(List<Currency> tasks) async {
    await _currencyInsertionAdapter.insertList(
        tasks, OnConflictStrategy.replace);
  }
}
