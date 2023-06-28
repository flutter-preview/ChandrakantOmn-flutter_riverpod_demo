

import 'package:floor/floor.dart';

import '../model/User.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> findAllUsers();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUser(User person);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateUser(User person);

  @delete
  Future<void> deleteUser(User person);
}