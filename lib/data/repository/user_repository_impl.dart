import 'package:holocare/data/data_source/firestore_helper.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryImpl = Provider((ref) => UserRepositoryImpl(ref.read));

class UserRepositoryImpl implements UserRepository {
  final dynamic _reader;

  UserRepositoryImpl(this._reader);

  late final FirestoreHelper _firestoreHelper =
      _reader(firestoreHelperProvider);

  @override
  Future<void> createFirestoreUser(User user) async {
    await _firestoreHelper.set(
      collection: "users",
      doc: user.uuid,
      data: {
        "uuid": user.uuid,
        "role": user.role,
        "verified": user.verified,
        "code": user.code,
        "pause": user.pause,
      },
    );
  }

  @override
  Future<dynamic> getFirebstoreUser(String uuid) async {
    return await _firestoreHelper
        .get(collection: "users", doc: uuid)
        .then((value) => value.data());
  }

  @override
  Future<void> updateFirestoreUser(
      String uuid, Map<Object, Object?> data) async {
    await _firestoreHelper.update(collection: "users", doc: uuid, data: data);
  }

  @override
  Future<void> deleteFirestoreUser(String uuid) async {
    await _firestoreHelper.delete(collection: "users", doc: uuid);
  }

  @override
  Future query({
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
  }) async {
    return await _firestoreHelper
        .query(
          collection: "users",
          field: field,
          isEqualTo: isEqualTo,
          isNotEqualTo: isNotEqualTo,
          isLessThan: isLessThan,
          isLessThanOrEqualTo: isLessThanOrEqualTo,
          isGreaterThan: isGreaterThan,
          isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
          arrayContains: arrayContains,
          arrayContainsAny: arrayContainsAny,
          whereIn: whereIn,
          whereNotIn: whereNotIn,
          isNull: isNull,
        )
        .then(
            (value) => value.docs.map((e) => User.fromJson(e.data())).toList());
  }
}
