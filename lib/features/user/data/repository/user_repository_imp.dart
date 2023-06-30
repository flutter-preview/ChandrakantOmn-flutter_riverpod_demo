


import '../../domain/user_repository.dart';
import '../model/user.dart';
import '../datasource/user_data_source.dart';

class UserRepositoryImp implements UserRepository{
  final UserDatasource datasource;

  const UserRepositoryImp({required this.datasource});

  @override
  Future<User> createUser(User user) {
    datasource.createUser(user);
    return Future(() => user);
  }

  @override
  Future<User> deleteUser(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<User>> getAllUsers() {
    return datasource.getUsersList();
  }

  @override
  Future<User> getUser(int id) {
    throw UnimplementedError();
  }
}