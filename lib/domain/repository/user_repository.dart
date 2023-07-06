import 'package:holocare/domain/model/user.dart';

abstract class UserRepository {
  Future<User?> getUser();

  Future<void> createUser(User user);

  Future<void> updateUser(User user);

  Future<void> deleteUser(String key);
}
