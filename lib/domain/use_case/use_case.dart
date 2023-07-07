import 'package:holocare/domain/use_case/create_user_use_case.dart';
import 'package:holocare/domain/use_case/get_user_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final useCasesProvider = Provider(
  (ref) => UseCases(
      getUser: GetUserUseCase(ref.read),
      createUser: CreateUserUseCase(ref.read)),
);

class UseCases {
  late final CreateUserUseCase createUser;
  late final GetUserUseCase getUser;

  UseCases({
    required this.getUser,
    required this.createUser,
  });
}
