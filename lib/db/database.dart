import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

//引入自动生成的代码，刚开始会报错，运行 flutter pub run build_runner build 即可
part 'database.g.dart';

//数据库密码
const _encryptionPassword = 'password';

//定义一个表
class Notes extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get content => text()();
}

//这个注解告诉 Drift 创建一个包含 我们上面定义的 Notes 表的数据库类（数据库操作类）
@DriftDatabase(tables: [Notes])
class MyEncryptedDatabase extends _$MyEncryptedDatabase {
  MyEncryptedDatabase() : super(_openDatabase());

  //设置数据库版本。
  @override
  int get schemaVersion => 1;

  //数据库迁移方法
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (details) async {},
    );
  }
}

//自定义打开数据库的方法
QueryExecutor _openDatabase() {
  return LazyDatabase(() async {
    //通过路径提供器获取目录以存放数据库文件
    final path = (Platform.isMacOS || Platform.isIOS)
        ? await getApplicationDocumentsDirectory()
        : await getApplicationSupportDirectory();

    //这是数据库文件。
    final dbFile = p.join(path.path, 'databases', 'app1.db');

    Logger().d(dbFile);
    return NativeDatabase(
      File(dbFile),
      setup: (db) {
        //这个语法检查数据库是否已经加密
        final result = db.select('pragma cipher_version');
        if (result.isEmpty) {
          throw UnsupportedError(
            'this database needs to run with sqlcipher, but that library is '
            'not available!',
          );
        }else{
          Logger().d("数据库已加密");
        }

        //数据库的密码。
        final escapedKey = _encryptionPassword;
        //通过密码打开数据库。
        db.execute("pragma key = '$escapedKey'");
      },
    );
  });
}
