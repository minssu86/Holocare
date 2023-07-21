import 'package:holocare/data/repository/user_repository_impl.dart';
import 'package:holocare/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deleteUserUseCaseProvider =
    Provider((ref) => DeleteUserUseCase(ref.read));

class DeleteUserUseCase {
  final dynamic _reader;

  DeleteUserUseCase(this._reader);

  late final UserRepository repository = _reader(userRepositoryImpl);

  Future<void> call(String uuid) async {
    await repository.deleteFirestoreUser(uuid);
  }
}
