import 'package:floor/floor.dart';

import '../../models/user.dart';

@dao
abstract class UserDao {
  @Query("DELETE FROM User")
  Future<void> delete();

  @Query('SELECT * FROM User')
  Future<List<User>> getUser();

  @Query('SELECT * FROM User ORDER BY id DESC LIMIT 1')
  Future<User?> getLatestUser();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(User user);
}