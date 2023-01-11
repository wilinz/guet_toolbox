
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
    // 加载 sqlite3.wasm
    final response = await Dio().getUri(Uri.parse('sqlite3.wasm'),options: Options(
        responseType:ResponseType.bytes
    ));
    // 创建一个由 IndexedDb 支持的虚拟文件系统
    final fs = await IndexedDbFileSystem.open(dbName: 'my_app');
    final sqlite3 = await WasmSqlite3.load(
      response.data,
      SqliteEnvironment(fileSystem: fs),
    );

    // 然后，在该文件夹中打开一个数据库。
    return WasmDatabase(sqlite3: sqlite3, path: 'app.db');
  });
}
