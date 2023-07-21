import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holocare/data/repository/stream_repository_impl.dart';
import 'package:holocare/domain/repository/stream_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final memberStreamUserUseCaseProvider =
    StreamProvider.autoDispose((ref) async* {
  yield MemberStreamUserUseCase(ref.read);
});

class MemberStreamUserUseCase {
  final dynamic _reader;

  MemberStreamUserUseCase(this._reader);

  late final StreamRepository repository = _reader(streamRepositoryProvider);

  Stream<QuerySnapshot<Map<String, dynamic>>> call(int code) {
    return repository.memberstream(code);
  }
}
