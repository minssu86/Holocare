import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<User?> call(User user) async => await repository.getUser();
}
