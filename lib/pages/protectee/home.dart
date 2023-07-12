import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProtecteeHomeScreen extends StatelessWidget {
  const ProtecteeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    provider.updateConnectTime();
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        top: true,
        child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: _bodyWidget(provider)),
      ),
    );
  }

  Widget _bodyWidget(UserProvider provider) {
    if (!provider.state!) {
      return _mainWidget(
          "보호가\n중지되었어요", ColorStyles.gray_04, ColorStyles.gray_02, "stop");
    }
    return _mainWidget("안전하게\n보호하고있어요", const Color(0xFFC5EAD8),
        const Color(0xFF1AB46A), "safe2");
  }

  Widget _mainWidget(String text1, Color color1, Color color2, String state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text1,
                        style: TextStyles.body1Strong.copyWith(fontSize: 28),
                      ),
                      const Text(
                        "12시간 이상 활동이 없으면 보호자에게 알림이가요",
                        style: TextStyles.caption1,
                      ),
                    ],
                  ),
                  state == "stop"
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: color1),
                          child: Text(
                            "보호 중지",
                            style:
                                TextStyles.body2Strong.copyWith(color: color2),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset('assets/state/$state.png'),
              )
            ],
          ),
        ),
      ],
    );
  }

  AppBar _appBar(context) {
    return AppBar(
      title: Image.asset(
        'assets/logo/logo.png',
        height: 30,
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/protectee/setting'),
          icon: const Icon(Icons.settings),
          color: Colors.black,
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}
