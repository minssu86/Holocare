import 'package:holocare/domain/use_case/create_local_user_use_case.dart';
import 'package:holocare/domain/use_case/create_user_use_case.dart';
import 'package:holocare/domain/use_case/delete_user_use_case.dart';
import 'package:holocare/domain/use_case/get_local_user_use_case.dart';
import 'package:holocare/domain/use_case/get_user_use_case.dart';
import 'package:holocare/domain/use_case/query_user_use_case.dart';
import 'package:holocare/domain/use_case/update_user_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final useCasesProvider = Provider(
  (ref) => UseCases(
    createUser: CreateUserUseCase(ref.read),
    getUser: GetUserUseCase(ref.read),
    updateUser: UpdateUserUseCase(ref.read),
    deleteUser: DeleteUserUseCase(ref.read),
    queryUser: QueryUserUseCase(ref.read),
    createLocalUser: CreateLocalUserUseCase(ref.read),
    getLocalUser: GetLocalUserUseCase(ref.read),
  ),
);

class UseCases {
  late final CreateLocalUserUseCase createLocalUser;
  late final GetLocalUserUseCase getLocalUser;
  late final CreateUserUseCase createUser;
  late final GetUserUseCase getUser;
  late final UpdateUserUseCase updateUser;
  late final DeleteUserUseCase deleteUser;
  late final QueryUserUseCase queryUser;

  UseCases({
    required this.createUser,
    required this.getUser,
    required this.updateUser,
    required this.deleteUser,
    required this.queryUser,
    required this.createLocalUser,
    required this.getLocalUser,
  });
}
