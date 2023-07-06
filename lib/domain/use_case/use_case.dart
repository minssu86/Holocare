import 'package:holocare/domain/use_case/create_user_use_case.dart';
import 'package:holocare/domain/use_case/get_user_use_case.dart';

class UseCases {
  final CreateUserUseCase createUser;
  final GetUserUseCase getUser;

  UseCases({
    required this.createUser,
    required this.getUser,
  });
}
