import 'package:holocare/domain/use_case/create_user_use_case.dart';
import 'package:holocare/domain/use_case/delete_storage_use_case.dart';
import 'package:holocare/domain/use_case/delete_user_use_case.dart';
import 'package:holocare/domain/use_case/get_storage_user_use_case.dart';
import 'package:holocare/domain/use_case/get_user_use_case.dart';
import 'package:holocare/domain/use_case/member_stream_use_case.dart';
import 'package:holocare/domain/use_case/query_user_use_case.dart';
import 'package:holocare/domain/use_case/update_storage_use_case.dart';
import 'package:holocare/domain/use_case/update_user_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final useCasesProvider = Provider(
  (ref) => UseCases(
    createUser: CreateUserUseCase(ref.read),
    getUser: GetUserUseCase(ref.read),
    updateUser: UpdateUserUseCase(ref.read),
    deleteUser: DeleteUserUseCase(ref.read),
    queryUser: QueryUserUseCase(ref.read),
    getStorage: GetStorageUseCase(ref.read),
    updateStorage: UpdateStorageUseCase(ref.read),
    deleteStorage: DeleteStorageUseCase(ref.read),
    memberstream: MemberStreamUserUseCase(ref.read),
  ),
);

class UseCases {
  late final GetStorageUseCase getStorage;
  late final CreateUserUseCase createUser;
  late final GetUserUseCase getUser;
  late final UpdateUserUseCase updateUser;
  late final UpdateStorageUseCase updateStorage;
  late final DeleteStorageUseCase deleteStorage;
  late final DeleteUserUseCase deleteUser;
  late final QueryUserUseCase queryUser;
  late final MemberStreamUserUseCase memberstream;

  UseCases({
    required this.createUser,
    required this.getUser,
    required this.updateUser,
    required this.deleteUser,
    required this.queryUser,
    required this.getStorage,
    required this.updateStorage,
    required this.deleteStorage,
    required this.memberstream,
  });
}
