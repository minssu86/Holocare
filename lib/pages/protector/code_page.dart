import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:holocare/config/custom_exception.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/widget/alert.dart';
import 'package:holocare/pages/widget/button.dart';
import 'package:holocare/pages/widget/title_widget.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProtectorCodePage extends StatefulWidget {
  const ProtectorCodePage({super.key});

  @override
  State<ProtectorCodePage> createState() => _ProtectorCodePageState();
}

class _ProtectorCodePageState extends State<ProtectorCodePage> {
  String? code;
  final _focusNode = FocusNode();
  final _textEditController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _textEditController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      setState(() {
        code = null;
        _textEditController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
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
                    Offstage(
                      offstage: true,
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _textEditController,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: const InputDecoration(),
                        onChanged: (value) {
                          _onInputText();
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: GestureDetector(
                        onTap: () {
                          _focusNode.requestFocus();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (int i = 0; i < 6; i++)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: ColorStyles.gray_05,
                                  border: _focusNode.hasFocus &&
                                          ((code == null && i == 0) ||
                                              (code != null &&
                                                  code!.length == i))
                                      ? Border.all(
                                          color: ColorStyles.primary,
                                          width: 1,
                                        )
                                      : null,
                                ),
                                child: Text(
                                  code != null && code!.length > i
                                      ? code!.split('')[i]
                                      : "0",
                                  style: TextStyles.body1Strong.copyWith(
                                      color: code != null && code!.length > i
                                          ? ColorStyles.gray_02
                                          : ColorStyles.gray_04),
                                ),
                              ),
                          ],
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
      title1: "역할을 선택해주세요",
      title2: "역할은 수정할 수 없으니 신중하게 선택해주세요",
    );
  }

  Widget _button(provider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MyButton(
          onPressed: () async {
            print(code);
            _connectCode(provider, context);
          },
          text: "연결하기",
        )
      ],
    );
  }

  void _onInputText() {
    setState(() {
      code = _textEditController.text;
      if (_textEditController.text.length == 6) {
        _focusNode.unfocus();
      }
    });
  }

  void _connectCode(UserProvider provider, context) async {
    try {
      await provider.connectCode(_textEditController.text);
      _showDialog(context, "연결에 성공하였습니다", "보호자와 정상적으로 연결되었습니다.", (context) {
        Navigator.pushReplacementNamed(context, "/main");
      });
    } on CustomException catch (e) {
      _showDialog(context, "연결에 실패하였습니다", e.toString(), null);
    }
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
                if (onPressed != null) onPressed(context);
              },
            );
          });
        });
  }
}
