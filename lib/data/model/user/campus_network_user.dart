import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guethub/data/model/db/base.dart';

@Entity(tableName: 'campus_network_users', indices: [
  Index(unique: true, value: ["username"])
])
class CampusNetworkUser extends BaseEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String username;

  String password;

  String isp;

  @ColumnInfo(name: "is_default")
  bool isDefault;

  CampusNetworkUser(
      {required DateTime updateTime,
        DateTime? createTime,
        required this.username,
        required this.password,
        required this.isDefault,
        required this.isp
      })
      : super(updateTime: updateTime, createTime: createTime);
}