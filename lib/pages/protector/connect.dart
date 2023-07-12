import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/protector_code.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProtectorConnect extends StatelessWidget {
  const ProtectorConnect({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
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
                    onPressed: () =>
                        provider.disconnect(provider.protectee!, provider.uid),
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ]),
          )),
    );
  }

  void disconnect() {}
}
