import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase(this.repository);

  Future<void> call(User user) async {
    await repository.createUser(user);
  }
}
