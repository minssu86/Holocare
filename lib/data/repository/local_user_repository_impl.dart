import 'dart:convert';

import 'package:holocare/data/data_source/secure_storage_helper.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/local_user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final localUserRepositoryImpl =
    Provider((ref) => LocalUserRepositoryImpl(ref.read));

class LocalUserRepositoryImpl implements LocalUserRepository {
  final dynamic _reader;

  LocalUserRepositoryImpl(this._reader);

  late final SecureStorageHelper _secureStorageHelper =
      _reader(secureStorageHelperProvider);

  @override
  Future<User?> getLocalUser() async {
    return _secureStorageHelper.read("user").then((value) {
      if (value != null && value.isNotEmpty) {
        return User.fromJson(jsonDecode(value));
      }
      return null;
    });
  }

  @override
  Future<void> createLocalUser(User user) async {
    await _secureStorageHelper.write("user", jsonEncode(user));
  }

  @override
  Future<void> updateLocalUser(User user) async {
    await _secureStorageHelper.write("user", jsonEncode(user));
  }

  @override
  Future<void> deleteLocalUser(String key) async {
    await _secureStorageHelper.delete("user");
  }
}
