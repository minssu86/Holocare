import 'package:holocare/data/repository/user_repository_impl.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getUserUseCaseProvider = Provider((ref) => GetUserUseCase(ref.read));

class GetUserUseCase {
  final dynamic _reader;

  GetUserUseCase(this._reader);

  late final UserRepository repository = _reader(userRepositoryImpl);

  Future<User?> call(String uuid) async =>
      await repository.getFirebstoreUser(uuid);
}
