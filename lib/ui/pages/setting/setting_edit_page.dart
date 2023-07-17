import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/ui/components/appbar/holocare_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingEditPage extends HookConsumerWidget {
  const SettingEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();

    return Scaffold(
      appBar: HolocareAppBar(
        onPressed: () => router.pop(),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
