
import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:sqlite3/wasm.dart';
part 'database.g.dart';

// This database is kep simple on purpose, this example only demonstrates how to
// use drift with an encrypted database.
// For advanced drift features, see the other examples in this project.

class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get content => text()();
}

@DriftDatabase(tables: [Notes])
class MyEncryptedDatabase extends _$MyEncryptedDatabase {
  MyEncryptedDatabase() : super(_openDatabase());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {},
    );
  }
}

QueryExecutor _openDatabase() {
  return LazyDatabase(() async {
    // Load wasm bundle
    final response = await Dio().getUri(Uri.parse('sqlite3.wasm'),options: Options(
        responseType:ResponseType.bytes
    ));
    // Create a virtual file system backed by IndexedDb with everything in
    // `/drift/my_app/` being persisted.
    final fs = await IndexedDbFileSystem.open(dbName: 'my_app');
    final sqlite3 = await WasmSqlite3.load(
      response.data,
      SqliteEnvironment(fileSystem: fs),
    );

    // Then, open a database inside that persisted folder.
    return WasmDatabase(sqlite3: sqlite3, path: '/drift/my_app/app.db');
  });
}
