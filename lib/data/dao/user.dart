import 'dart:async';
import 'package:floor/floor.dart';
import 'package:guettoolbox/data/model/user/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM users WHERE is_active = 1 LIMIT 1')
  Future<User?> getActive();

  @Query('SELECT * FROM users WHERE username = :username LIMIT 1')
  Future<User?> get(String username);

  @Query('SELECT * FROM users ORDER BY update_time DESC LIMIT 5')
  Future<List<User>> getRecent();

  @Query("SELECT * FROM users WHERE username LIKE :keyword")
  Future<List<User>> searchUsers(String keyword);

  @Query("SELECT * FROM users")
  Future<List<User>> getAll();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(User user);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(User user);
}