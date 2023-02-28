import 'package:floor/floor.dart';

class BaseEntity {

  @ColumnInfo(name: 'create_time')
  final String createTime;

  @ColumnInfo(name: 'update_time')
  final String updateTime;

  BaseEntity({
    required this.updateTime,
    String? createTime,
  }) : this.createTime = createTime ?? DateTime.now().toString();
}
