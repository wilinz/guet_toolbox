import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guettoolbox/data/model/db/base.dart';

@Entity(tableName: 'users', indices: [
  Index(unique: true, value: ["username"])
])
class User extends BaseEntity {
  @PrimaryKey(autoGenerate: true)
  int id = 0;

  String username;

  String password;

  @ColumnInfo(name: "is_active")
  bool isActive;

  User(
      {required DateTime updateTime,
      DateTime? createTime,
      required this.username,
      required this.password,
      required this.isActive})
      : super(updateTime: updateTime, createTime: createTime);
}
