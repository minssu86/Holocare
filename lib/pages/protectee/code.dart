import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/layout.dart';
import 'package:holocare/pages/widget/layout_top_widget.dart';
import 'package:holocare/pages/widget/outlined_button.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProtecteeCodeScreen extends StatelessWidget {
  const ProtecteeCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    if (provider.protectors!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showDialog(context);
      });
    }
    // List<dynamic>? protectors = provider.protectors;
    // print("build");
    // if (protectors!.isEmpty) {
    //   print(protectors);
    //   provider.getUserSnapshot().listen((snapshot) {
    //     if (snapshot.exists) {
    //       final data = snapshot.data();
    //       if ((data!['protectors'] as List<dynamic>).isNotEmpty &&
    //           !listEquals(protectors, data['protectors'])) {
    //         print("change");
    //         provider.protectors = data['protectors'];
    //         _showDialog(context);
    //       }
    //     }
    //   });
    // }

    // if (provider.protectors != null) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     _showDialog(context);
    //   });
    // }
    return LayoutWidget(
      appBar: _appBar(context),
      top: _topWidget(),
      middle: _middleWidget(provider),
      bottom: _bottomWidget(provider, context),
    );
  }

  AppBar _appBar(context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget _topWidget() {
    return const LayoutTopWidget(
      top1: "보호자에게 코드를\n공유해주세요",
      top2: "보호 대상자에게서 공유 받은 코드를 입력해주세요",
    );
  }

  Widget _middleWidget(UserProvider provider) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: ColorStyles.gray_04,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              provider.code!,
              style: TextStyles.title2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _bottomWidget(UserProvider provider, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomOutLinedButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: provider.code!));
          },
          text: "복사하기",
        )
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Container(
                constraints: const BoxConstraints(minWidth: 250),
                height: 130,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "연결에 성공하였습니다",
                      style: TextStyles.body1Strong,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "보호자가 코드를 입력하여\n연결되었습니다",
                      style: TextStyles.body2.copyWith(
                        color: ColorStyles.gray_03,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            actions: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomOutLinedButton(
                      onPressed: () {
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, '/protectee/home', (route) => false);
                      },
                      text: "확인",
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
