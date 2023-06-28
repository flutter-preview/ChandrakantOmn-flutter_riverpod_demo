

import '../data/model/User.dart';

abstract class UserRepository{
  Future<User> createUser(User user);
  Future<User> getUser(int id);
  Future<List<User>> getAllUsers();
  Future<User> deleteUser(int id);
 }