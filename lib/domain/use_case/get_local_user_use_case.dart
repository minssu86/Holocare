import 'package:holocare/data/repository/local_user_repository_impl.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/local_user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getLocalUserUseCaseProvider =
    Provider((ref) => GetLocalUserUseCase(ref.read));

class GetLocalUserUseCase {
  final dynamic _reader;

  GetLocalUserUseCase(this._reader);

  late final LocalUserRepository repository = _reader(localUserRepositoryImpl);

  Future<User?> call() async => await repository.getLocalUser();
}
