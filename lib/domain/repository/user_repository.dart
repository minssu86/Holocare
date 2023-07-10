import 'package:holocare/domain/model/user.dart';

abstract class UserRepository {
  Future<dynamic> getFirebstoreUser(String uuid);

  Future<void> createFirestoreUser(User user);

  Future<void> updateFirestoreUser(String uuid, Map<Object, Object?> data);

  Future<void> deleteFirestoreUser(String uuid);

  Future<dynamic> query({
    required Object field,
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Iterable<Object?>? arrayContainsAny,
    Iterable<Object?>? whereIn,
    Iterable<Object?>? whereNotIn,
    bool? isNull,
  });
}
