import 'package:holocare/data/repository/storage_repository_impl.dart';
import 'package:holocare/domain/repository/storage_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateStorageUseCaseProvider =
    Provider((ref) => UpdateStorageUseCase(ref.read));

class UpdateStorageUseCase {
  final dynamic _reader;

  UpdateStorageUseCase(this._reader);

  late final StorageRepository repository = _reader(storageRepositoryImpl);

  Future<void> call(Map<String, dynamic> data) async {
    await repository.updateStorage(data);
  }
}
