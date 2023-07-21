import 'package:holocare/data/repository/storage_repository_impl.dart';
import 'package:holocare/domain/repository/storage_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getStorageUseCaseProvider =
    Provider((ref) => GetStorageUseCase(ref.read));

class GetStorageUseCase {
  final dynamic _reader;

  GetStorageUseCase(this._reader);

  late final StorageRepository repository = _reader(storageRepositoryImpl);

  Future<Map<String, dynamic>?> call() async => await repository.getStorage();
}
