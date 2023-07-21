import 'dart:convert';

import 'package:holocare/data/data_source/secure_storage_helper.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/storage_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storageRepositoryImpl =
    Provider((ref) => StorageRepositoryImpl(ref.read));

class StorageRepositoryImpl implements StorageRepository {
  final dynamic _reader;

  StorageRepositoryImpl(this._reader);

  late final SecureStorageHelper _secureStorageHelper =
      _reader(secureStorageHelperProvider);

  @override
  Future<Map<String, dynamic>?> getStorage() async {
    return _secureStorageHelper.read("user").then((value) {
      if (value != null && value.isNotEmpty) {
        return jsonDecode(value);
      }
      return null;
    });
  }

  @override
  Future<void> updateLocalUser(User user) async {
    await _secureStorageHelper.write("user", jsonEncode(user));
  }

  @override
  Future<void> updateStorage(Map<String, dynamic> data) async {
    await _secureStorageHelper.write("user", jsonEncode(data));
  }

  @override
  Future<void> deleteStorage() async {
    await _secureStorageHelper.delete("user");
  }
}
