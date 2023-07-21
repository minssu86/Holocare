import 'package:holocare/data/repository/storage_repository_impl.dart';
import 'package:holocare/domain/repository/storage_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deleteStorageUseCaseProvider =
    Provider((ref) => DeleteStorageUseCase(ref.read));

class DeleteStorageUseCase {
  final dynamic _reader;

  DeleteStorageUseCase(this._reader);

  late final StorageRepository repository = _reader(storageRepositoryImpl);

  Future<void> call() async => await repository.deleteStorage();
}
