import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProtecteeSetting extends StatelessWidget {
  const ProtecteeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "설정",
        style: TextStyles.title2,
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "보호자 등록",
            style: TextStyles.body1Strong,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/connect");
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "푸시 알림",
                style: TextStyles.body1Strong,
              ),
              Text(
                "앱에 접속할 수 있도록 알림을 보냅니다.",
                style: TextStyles.caption1,
              ),
            ],
          ),
          CupertinoSwitch(
            value: provider.localUser.push,
            onChanged: (val) => provider.updatePush(val),
          ),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "보호 중지",
                style: TextStyles.body1Strong,
              ),
              Text(
                "보호 중지를 켜면 보호자에게 알림이 가지 않습니다.",
                style: TextStyles.caption1,
              ),
            ],
          ),
          CupertinoSwitch(
            value: provider.status,
            onChanged: (val) => provider.updateStatus(val),
          ),
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "초기화",
            style: TextStyles.body1Strong,
          ),
          IconButton(
            onPressed: () {
              provider.reset().then((value) {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                  context,
                  "/",
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
