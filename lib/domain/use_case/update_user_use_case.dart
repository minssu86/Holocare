import 'package:holocare/data/repository/user_repository_impl.dart';
import 'package:holocare/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateUserUseCaseProvider =
    Provider((ref) => UpdateUserUseCase(ref.read));

class UpdateUserUseCase {
  final dynamic _reader;

  UpdateUserUseCase(this._reader);

  late final UserRepository repository = _reader(userRepositoryImpl);

  Future<void> call(String uuid, Map<Object, Object?> data) async {
    await repository.updateFirestoreUser(uuid, data);
  }
}
