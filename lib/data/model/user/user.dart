import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guettoolbox/data/model/db/base.dart';

@Entity(tableName: 'users', indices: [
  Index(unique: true, value: ["username"])
])
class User extends BaseEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String username;

  String password;

  @ColumnInfo(name: "is_active")
  bool isActive;


  @override
  String toString() => 'User{id: $id, username: $username, password: $password, isActive: $isActive}';

  User(
      {required DateTime updateTime,
      DateTime? createTime,
      required this.username,
      required this.password,
      required this.isActive})
      : super(updateTime: updateTime, createTime: createTime);
}
