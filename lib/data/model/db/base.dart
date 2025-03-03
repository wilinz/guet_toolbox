import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import 'package:kt_dart/standard.dart';

abstract class BaseEntity {
  @ColumnInfo(name: 'create_time')
  DateTime createTime;

  @ColumnInfo(name: 'update_time')
  DateTime updateTime;

  BaseEntity({
    DateTime? updateTime,
    DateTime? createTime,
  })  : this.createTime = createTime ?? DateTime.now(),
        this.updateTime = updateTime ?? DateTime.now();
}

abstract class BaseEntityEquatable extends BaseEntity with EquatableMixin {
  BaseEntityEquatable({
    DateTime? updateTime,
    DateTime? createTime,
  }) {
    createTime?.let((it) {
      super.createTime = it;
    });
    updateTime?.let((it) {
      super.updateTime = it;
    });
  }
}
