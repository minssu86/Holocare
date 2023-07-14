import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firestoreProvider = Provider((ref) => FirebaseFirestore.instance);

final firestoreHelperProvider = Provider((ref) => FirestoreHelper(ref.read));

class FirestoreHelper {
  final dynamic _reader;

  FirestoreHelper(this._reader);

  late final FirebaseFirestore _firestore = _reader(firestoreProvider);

  Future<DocumentSnapshot<Map<String, dynamic>>> get({
    required String collection,
    required String doc,
  }) async {
    return await _firestore.collection(collection).doc(doc).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAll({
    required String collection,
    required Object field,
  }) async {
    return await _firestore.collection(collection).where(field).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> query({
    required String collection,
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
    return _firestore
        .collection(collection)
        .where(
          field,
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
        .get();
  }

  Future<void> set({
    required String collection,
    required String doc,
    required Map<String, dynamic> data,
  }) async {
    await _firestore.collection(collection).doc(doc).set(data);
  }

  Future<void> update({
    required String collection,
    required String doc,
    required Map<Object, Object?> data,
  }) async {
    await _firestore.collection(collection).doc(doc).update(data);
  }

  Future<void> delete({
    required String collection,
    required String doc,
  }) async {
    await _firestore.collection(collection).doc(doc).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> stream({
    required String collection,
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
  }) {
    return _firestore
        .collection(collection)
        .where(
          field,
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
        .snapshots();
  }
}
