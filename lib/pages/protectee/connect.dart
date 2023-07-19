import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/protector_code.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProtecteeConnect extends StatelessWidget {
  const ProtecteeConnect({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "보호자 등록",
          style: TextStyles.title2,
        ),
        const SizedBox(
          height: 30,
        ),
        const ProtectorCode(),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "보호자 최대 2명까지 등록 가능합니다",
          style: TextStyles.caption1,
        ),
        const SizedBox(
          height: 30,
        ),
        provider.protectorIds != null
            ? Column(
                children: [
                  for (int i = 0; i < provider.protectorIds!.length; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "보호자${i + 1}",
                              style: TextStyles.body2Strong,
                            ),
                            const Text(
                              "aaa",
                              style: TextStyles.caption1,
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () => {
                            provider.disconnect(provider.localUser.uid,
                                provider.protectorIds![i])
                          },
                          child: const Text(
                            "연결끊기",
                            style: TextStyles.body2,
                          ),
                        )
                      ],
                    )
                ],
              )
            : const Text(
                "아직 등록된 보호자가 없습니다.",
                style: TextStyles.caption1,
              ),
      ],
    );
  }

  void disconnect() {}
}
