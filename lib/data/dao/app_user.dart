import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guethub/data/model/app/user/app_user.dart';

import '../model/user/user.dart';

@dao
abstract class AppUserDao {
  @Query('SELECT * FROM app_users WHERE is_active = 1 LIMIT 1')
  Future<AppUser?> getActive();

  @Query('SELECT * FROM app_users WHERE is_active = 1 LIMIT 1')
  Stream<AppUser?> getActiveStream();

  @Query('SELECT * FROM app_users WHERE username = :username LIMIT 1')
  Future<AppUser?> get(String username);

  @Query('SELECT * FROM app_users ORDER BY update_time DESC LIMIT 5')
  Future<List<AppUser>> getRecent();

  @Query('SELECT * FROM app_users ORDER BY update_time DESC LIMIT 5')
  Stream<List<AppUser>> getRecentStream();

  @Query("SELECT * FROM app_users WHERE username LIKE :keyword")
  Future<List<AppUser>> searchAppUsers(String keyword);

  @Query("SELECT * FROM app_users")
  Future<List<AppUser>> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(AppUser user);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(AppUser user);

  @Query("UPDATE app_users SET is_active = 0 WHERE is_active = 1")
  Future<void> offlineCurrent();

  @Query("UPDATE app_users SET is_active = 0 WHERE username <> :username")
  Future<void> offlineOtherUser(String username);
}