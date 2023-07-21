import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/router/router.dart';
import 'package:holocare/ui/vm/user_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Holocare extends HookConsumerWidget {
  const Holocare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);
    final userViewModel = ref.watch(userViewModelProvider);
    final appRouter =
        useMemoized(() => RootRouter(userViewModel: userViewModel));

    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: theme.data,
    );
  }
}
