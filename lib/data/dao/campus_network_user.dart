
import 'package:floor/floor.dart';
import 'package:guethub/data/model/user/campus_network_user.dart';

@dao
abstract class CampusNetworkUserDao {
  @Query('SELECT * FROM campus_network_users WHERE is_default = 1 LIMIT 1')
  Future<CampusNetworkUser?> getActive();

  @Query('SELECT * FROM campus_network_users WHERE username = :username LIMIT 1')
  Future<CampusNetworkUser?> get(String username);

  @Query('SELECT * FROM campus_network_users ORDER BY update_time DESC LIMIT 5')
  Future<List<CampusNetworkUser>> getRecent();

  @Query("SELECT * FROM campus_network_users WHERE username LIKE :keyword")
  Future<List<CampusNetworkUser>> searchUsers(String keyword);

  @Query("SELECT * FROM campus_network_users")
  Future<List<CampusNetworkUser>> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(CampusNetworkUser user);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(CampusNetworkUser user);

  @Query("UPDATE campus_network_users SET is_default = 0 WHERE username <> :username")
  Future<void> unsetDefaultOtherUser(String username);
}