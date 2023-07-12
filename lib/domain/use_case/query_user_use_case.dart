import 'package:holocare/data/repository/user_repository_impl.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/repository/user_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final queryUserUseCaseProvider = Provider((ref) => QueryUserUseCase(ref.read));

class QueryUserUseCase {
  final dynamic _reader;

  QueryUserUseCase(this._reader);

  late final UserRepository repository = _reader(userRepositoryImpl);

  Future<List<User>> call({
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
  }) async =>
      await repository.query(
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
      );
}
