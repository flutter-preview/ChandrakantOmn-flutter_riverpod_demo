

import '../../data/model/user.dart';
import '../user_repository.dart';

class GetUserUseCase{
  final UserRepository repository;

  const GetUserUseCase(this.repository);
  Future<User> getUser(int id) async{
    await Future.delayed(const Duration(seconds: 1));
    return repository.getUser(id);
  }

  Future<List<User>> getAllUsers(int id) async{
    await Future.delayed(const Duration(seconds: 1));
    return repository.getAllUsers();
  }

}