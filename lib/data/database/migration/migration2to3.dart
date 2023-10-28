import 'package:floor/floor.dart';

// 定义一个Migration类来处理数据库升级
class Migration2to3 extends Migration {
  Migration2to3() :super(2, 3, (database) async {
    await database.execute('''
      DELETE FROM semester_schedule WHERE 1=1;
    ''');
  });

}
