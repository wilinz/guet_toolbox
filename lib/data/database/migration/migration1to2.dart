import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:guethub/data/model/db/base.dart';

// 定义一个Migration类来处理数据库升级
class Migration1to2 extends Migration {
  Migration1to2() :super(1, 2, (database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS campus_network_users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    isp TEXT NOT NULL,
    is_default INTEGER NOT NULL,
    update_time INTEGER NOT NULL,
    create_time INTEGER
)
    ''');
  });

}
