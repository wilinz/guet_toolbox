import 'package:autoequal/autoequal.dart';
import 'package:floor/floor.dart';
import 'package:guethub/data/model/db/base.dart';

part 'app_user.g.dart';

@Entity(tableName: 'app_users', indices: [
  Index(unique: true, value: ["username"])
])
@autoequal
class AppUser extends BaseEntityEquatable {
  @PrimaryKey(autoGenerate: false)
  int id;

  String username;

  String password;

  @ColumnInfo(name: "is_active")
  bool isActive;

  AppUser(
      {DateTime? updateTime,
      DateTime? createTime,
      required this.id,
      required this.username,
      required this.password,
      required this.isActive})
      : super(updateTime: updateTime, createTime: createTime);

  @override
  List<Object?> get props => _$props;
}
