import 'package:holocare/domain/use_case/create_local_user_use_case.dart';
import 'package:holocare/domain/use_case/get_local_user_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final useCasesProvider = Provider(
  (ref) => UseCases(
      getLocalUser: GetLocalUserUseCase(ref.read),
      createLocalUser: CreateLocalUserUseCase(ref.read)),
);

class UseCases {
  late final CreateLocalUserUseCase createLocalUser;
  late final GetLocalUserUseCase getLocalUser;

  UseCases({
    required this.getLocalUser,
    required this.createLocalUser,
  });
}
