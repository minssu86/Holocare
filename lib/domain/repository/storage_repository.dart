import 'package:holocare/domain/model/user.dart';

abstract class StorageRepository {
  Future<Map<String, dynamic>?> getStorage();

  Future<void> updateLocalUser(User user);

  Future<void> deleteStorage();

  Future<void> updateStorage(Map<String, dynamic> data);
}
