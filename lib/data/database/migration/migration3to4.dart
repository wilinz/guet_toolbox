import 'package:floor/floor.dart';

// 定义一个Migration类来处理数据库升级
class Migration3to4 extends Migration {
  Migration3to4() :super(3, 4, (database) async {
    await database.execute('''
      ALTER TABLE semester_schedule ADD COLUMN term_name TEXT DEFAULT '';
    ''');
  });

}
