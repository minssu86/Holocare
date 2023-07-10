import 'package:holocare/domain/model/user.dart';

abstract class LocalUserRepository {
  Future<User?> getLocalUser();

  Future<void> createLocalUser(User user);

  Future<void> updateLocalUser(User user);

  Future<void> deleteLocalUser(String key);
}
