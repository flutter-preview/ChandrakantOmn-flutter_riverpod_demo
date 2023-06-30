

import '../../data/model/user.dart';
import '../user_repository.dart';

class CreateUserUseCase{
  final UserRepository repository;

  const CreateUserUseCase(this.repository);
  Future<User> createUser(User user) async{
    await Future.delayed(const Duration(seconds: 1));
    return repository.createUser(user);
  }

}