import 'package:auto_route/auto_route.dart';
import 'package:holocare/ui/router/router.gr.dart';
import 'package:holocare/ui/vm/user_view_model.dart';

class AuthGuard extends AutoRouteGuard {
  final UserViewModel userViewModel;

  AuthGuard({required this.userViewModel});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    await userViewModel.syncUser();

    if (userViewModel.user != null && userViewModel.user!.verified) {
      resolver.redirect(const DashboardRoute());
      return;
    }

    resolver.next(true);
  }
}
