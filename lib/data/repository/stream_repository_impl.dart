import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holocare/data/data_source/firestore_helper.dart';
import 'package:holocare/domain/repository/stream_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final streamRepositoryProvider =
    Provider((ref) => StreamRepositoryImpl(ref.read));

class StreamRepositoryImpl extends StreamRepository {
  final dynamic _reader;

  StreamRepositoryImpl(this._reader);

  late final FirestoreHelper _firestoreHelper =
      _reader(firestoreHelperProvider);

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> memberstream(int code) {
    return _firestoreHelper.stream(
        collection: "users", field: "code", isEqualTo: code);
  }
}
