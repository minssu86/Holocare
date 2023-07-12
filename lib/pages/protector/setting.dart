import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProtectorSettingScreen extends StatelessWidget {
  const ProtectorSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          top: true,
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    "보호자 연결",
                    style: TextStyles.body1Strong,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/protector/connect');
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
                    value: provider.push!,
                    onChanged: (val) => provider.updatePush(val),
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
                    onPressed: () => provider.reset(),
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}
