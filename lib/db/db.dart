import 'dart:ffi';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqlite3/open.dart';

initDB(String dbname) async {
  if (kIsWeb) return;
  String dbPath = dbname;
  DatabaseFactory myDatabaseFactory = databaseFactory;
  if (Platform.isWindows || Platform.isLinux) {
    myDatabaseFactory = createDatabaseFactoryFfi(ffiInit: ffiInit);
    var appSupportDir = await getApplicationSupportDirectory();
    dbPath = join(appSupportDir.path, "databases", dbPath);
    Logger().d(dbPath);
  }

  final db = await myDatabaseFactory.openDatabase(
    dbPath,
    options: OpenDatabaseOptions(
      version: 1,
      onConfigure: (db) async {
        // This is the part where we pass the "password"
        await db.rawQuery("PRAGMA KEY='1234'");
      },
      onCreate: (db, version) async {
        db.execute('''
  CREATE TABLE IF NOT EXISTS  Product(
       id INTEGER PRIMARY KEY,
       title TEXT
   )  ;
   ''');
      },
    ),
  );
}

void ffiInit() {
  open.overrideForAll(sqlcipherOpen);
}

DynamicLibrary sqlcipherOpen() {
  if (Platform.isLinux) {
    return DynamicLibrary.open('libsqlcipher.so');
  } else {
    //isWindows
    DynamicLibrary.open('data/flutter_assets/dll/libcrypto-1_1-x64.dll');
    return DynamicLibrary.open('data/flutter_assets/dll/sqlcipher.dll');
  }
}
