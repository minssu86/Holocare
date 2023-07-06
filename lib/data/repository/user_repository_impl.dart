import 'dart:convert';

import 'package:holocare/data/data_source/secure_storage_helper.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryImpl = Provider((ref) => UserRepositoryImpl(ref.read));

class UserRepositoryImpl implements UserRepository {
  final dynamic _reader;

  UserRepositoryImpl(this._reader);

  late final SecureStorageHelper _secureStorageHelper =
      _reader(secureStorageHelperProvider);

  @override
  Future<User?> getUser() async {
    return _secureStorageHelper.read("user").then((value) {
      if (value != null && value.isNotEmpty) return jsonDecode(value);
      return null;
    });
  }

  @override
  Future<void> createUser(User user) async {
    await _secureStorageHelper.write("user", jsonEncode(user));
  }

  @override
  Future<void> updateUser(User user) async {
    await _secureStorageHelper.write("user", jsonEncode(user));
  }

  @override
  Future<void> deleteUser(String key) async {
    await _secureStorageHelper.delete("user");
  }
}
