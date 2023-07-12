import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProtecteeSettingScreen extends StatelessWidget {
  const ProtecteeSettingScreen({super.key});

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
                    "보호자 등록",
                    style: TextStyles.body1Strong,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/protectee/connect');
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
                    value: provider.state!,
                    onChanged: (val) => provider.updateState(val),
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
                    onPressed: () => {provider.reset(), Navigator.pop(context)},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ]),
          )),
    );
  }
}
