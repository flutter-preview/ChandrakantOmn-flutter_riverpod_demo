
import 'dart:async';
import 'package:floor/floor.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import '../features/user/data/model/user.dart';
part 'database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userdao;
}


Future<AppDatabase> getShoppAppDb() async{
  return  $FloorAppDatabase.databaseBuilder('dairy.db').build();
}

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
