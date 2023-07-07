import 'package:holocare/data/repository/user_repository_impl.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createUserUseCaseProvider =
    Provider((ref) => CreateUserUseCase(ref.read));

class CreateUserUseCase {
  final dynamic _reader;

  CreateUserUseCase(this._reader);

  late final UserRepository repository = _reader(userRepositoryImpl);

  Future<void> call(User user) async {
    await repository.createUser(user);
  }
}
