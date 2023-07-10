import 'package:holocare/data/repository/local_user_repository_impl.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/local_user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createLocalUserUseCaseProvider =
    Provider((ref) => CreateLocalUserUseCase(ref.read));

class CreateLocalUserUseCase {
  final dynamic _reader;

  CreateLocalUserUseCase(this._reader);

  late final LocalUserRepository repository = _reader(localUserRepositoryImpl);

  Future<void> call(User user) async {
    await repository.createLocalUser(user);
  }
}
