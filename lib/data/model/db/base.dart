import 'package:floor/floor.dart';

class BaseEntity {

  @ColumnInfo(name: 'create_time')
  DateTime createTime;

  @ColumnInfo(name: 'update_time')
  DateTime updateTime;

  BaseEntity({
    required this.updateTime,
    required this.createTime,
  });

}
