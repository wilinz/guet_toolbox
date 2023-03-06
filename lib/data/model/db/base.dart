import 'package:floor/floor.dart';
import 'package:kt_dart/kt.dart';

class BaseEntity {
  @ColumnInfo(name: 'create_time')
  DateTime createTime = DateTime.now();

  @ColumnInfo(name: 'update_time')
  DateTime updateTime;

  BaseEntity({
    required this.updateTime,
    DateTime? createTime,
  }) {
    createTime?.let((it) => this.createTime = it);
  }
}
