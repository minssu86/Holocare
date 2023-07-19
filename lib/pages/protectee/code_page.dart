import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/alert.dart';
import 'package:holocare/pages/widget/button.dart';
import 'package:holocare/pages/widget/title_widget.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProtecteeCodePage extends StatelessWidget {
  const ProtecteeCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    if (provider.protectorIds!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showDialog(context, "연결에 성공하였습니다", "보호자가 코드를 입력하여\n연결되었습니다",
            (ctx) => {Navigator.pushReplacementNamed(ctx, "/main")});
      });
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: _title(),
        ),
        Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                ),
                _button(provider),
              ],
            ))
      ],
    );
  }

  Widget _title() {
    return const TitleWidget(
      title1: "보호자에게 코드를\n공유해주세요",
      title2: "보호자가 코드를 입력하면 연결이 완료돼요.",
    );
  }

  Widget _button(provider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyButton(
          onPressed: () async {
            Clipboard.setData(ClipboardData(text: provider.code!));
          },
          text: "복사하기",
        )
      ],
    );
  }

  void _showDialog(BuildContext context, title, content, onPressed) {
    showDialog(
        context: context,
        builder: (ctx) {
          return Builder(builder: (dialogContext) {
            return CustomAlert(
              title: title,
              content: content,
              onPressed: () {
                Navigator.pop(dialogContext);
                onPressed(context);
              },
            );
          });
        });
  }
}
