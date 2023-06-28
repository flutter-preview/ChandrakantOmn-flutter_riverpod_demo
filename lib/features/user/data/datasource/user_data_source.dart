import 'package:flutter_riverpod_demo/features/user/data/datasource/user_dto.dart';

import '../model/User.dart';

abstract class UserDatasource {
  Future<List<User>> getUsersList();
  Future<void> createUser(User user);
}

class UserDatasourceImpl implements UserDatasource {
  final UserDao dao;
  UserDatasourceImpl({required this.dao});
  @override
  Future<List<User>> getUsersList() async {
    return dao.findAllUsers();
  }

  @override
  Future<void> createUser(User user) {
    return dao.insertUser(user);
  }
}
