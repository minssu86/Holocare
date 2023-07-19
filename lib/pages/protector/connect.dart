import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/protector_code.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProtectorConnect extends StatelessWidget {
  const ProtectorConnect({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "보호자 연결",
        style: TextStyles.title2,
      ),
      const SizedBox(
        height: 30,
      ),
      const ProtectorCode(),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "연결 끊기",
            style: TextStyles.body1Strong,
          ),
          IconButton(
            onPressed: () async {
              provider
                  .disconnect(provider.protecteeId, provider.localUser.uid)
                  .then((value) {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  "/code",
                );
              });
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    ]);
  }
}
